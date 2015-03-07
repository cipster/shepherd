package model.implementation;


import com.mysql.jdbc.Statement;
import model.dao.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import model.interfaces.UserDAO;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class UserDAOImpl extends JdbcDaoSupport implements UserDAO {

    private static final String USER = "SELECT * FROM users ";
    private static final String FIND_USER_BY_USERNAME = USER + " WHERE username=:username";
    private static final String INSERT_INTO_USER = "INSERT INTO users(username, password, enabled)VALUES(?, ?, ?)";
    private static final String UPDATE_USER = "UPDATE users SET password = ?, enabled = ? WHERE username = ?";

    private RowMapper<User> userParameterizedRowMapper = new RowMapper<User>() {
        @Override
        public User mapRow(ResultSet rs, int rowNum) throws SQLException {
            User user = new User();

            user.setUsername(rs.getString("username"));
            user.setPassword(rs.getString("password"));
            user.setEnabled(rs.getInt("enabled"));

            return user;
        }
    };
    @Autowired
    private PasswordEncoder encoder;

    @Autowired
    public UserDAOImpl(DataSource driverManagerDataSource) {
        setDataSource(driverManagerDataSource);
    }


    @Override
    public User findByID(String username) {
        try {
            final String query = "SELECT * FROM users WHERE username ='" + username + "'";

            return getJdbcTemplate().queryForObject(query, userParameterizedRowMapper);
        } catch(EmptyResultDataAccessException e) {
            return null;
        }
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public List<User> getAll() {
        final String query = "SELECT * FROM proiecte.users";
        try {

            return getJdbcTemplate().query(query, userParameterizedRowMapper);
        } catch (DataAccessException ex){
            ex.printStackTrace();
            return null;
        }
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public Integer updatePassword(String username, String password) {
        password = encoder.encode(password);
        String query = "UPDATE proiecte.users SET password = '" + password + "' WHERE username='" + username + "'";

        return getJdbcTemplate().update(query);

    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public Integer deleteByUsername(String username) {
        String query = "DELETE FROM proiecte.users WHERE username='" + username + "'";
        return getJdbcTemplate().update(query);
    }

    @Override
    public List<User> getAll(int i) {
        final String query = "SELECT * FROM proiecte.users WHERE username NOT IN (SELECT username FROM proiecte.user_roles WHERE role_type in (2,8))";

        try {
            return getJdbcTemplate().query(query, userParameterizedRowMapper);
        } catch (DataAccessException ex){
            ex.printStackTrace();
            return null;
        }

    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public User findByID(Integer id) {
        return null;
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public Integer create(final User entity) {
        JdbcTemplate jdbcTemplate = getJdbcTemplate();
        KeyHolder keyHolder = new GeneratedKeyHolder();

        PreparedStatementCreator psc = new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                PreparedStatement ps = con.prepareStatement(INSERT_INTO_USER, Statement.RETURN_GENERATED_KEYS);

                ps.setString(1, entity.getUsername());
                ps.setString(2, entity.getPassword());
                ps.setInt(3, entity.getEnabled());

                logger.debug(ps.toString());
                return ps;
            }
        };
        jdbcTemplate.update(psc, keyHolder);
        return 1;
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public Integer update(final User entity) {
        JdbcTemplate jdbcTemplate = getJdbcTemplate();
        PreparedStatementCreator psc = new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {

                PreparedStatement ps = con.prepareStatement(UPDATE_USER);

                ps.setString(1, entity.getPassword());
                ps.setInt(2, entity.getEnabled());
                ps.setString(3, entity.getUsername());

                logger.debug(ps.toString());
                return ps;
            }
        };
        jdbcTemplate.update(psc);
        return 1;
    }

    @Override
    public Integer deleteByID(Integer id) {
        return null;
    }
}
