package projectManager.dao.jdbc;


import com.mysql.jdbc.Statement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import projectManager.dao.UserDAO;
import projectManager.repository.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserJDBCDAO extends JdbcDaoSupport implements UserDAO {

    private static final String USER = "SELECT * FROM users ";
    private static final String FIND_USER_BY_USERNAME = USER + " WHERE username=:username";
    private static final String DELETE_USER_BY_ID = "DELETE FROM users WHERE usename= ?";
    private static final String INSERT_INTO_USER = "INSERT INTO users(username, password, enabled)VALUES(?, ?, ?)";
    private static final String UPDATE_USER_PASSWORD = "UPDATE users SET password = ? WHERE username = ?";
    private static final String UPDATE_USER = "UPDATE users SET password = ?, enabled = ? WHERE username = ?";


    private ParameterizedRowMapper<User> userParameterizedRowMapper = new ParameterizedRowMapper<User>() {
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
    public UserJDBCDAO(DriverManagerDataSource driverManagerDataSource) {
        setDataSource(driverManagerDataSource);
    }

    @Override
    public User findByID(String username) {
        try {
            Map<String, Object> args = new HashMap<String, Object>();
            args.put("username", username);
            StringBuilder findUser = new StringBuilder(FIND_USER_BY_USERNAME);

            return getJdbcTemplate().queryForObject(findUser.toString(), userParameterizedRowMapper, args);
        } catch(EmptyResultDataAccessException e) {
            return null;
        }
    }

    @Override
    public List<User> getAll() {
        List<User> result = getJdbcTemplate().query(USER, userParameterizedRowMapper);

        if(result != null) {
            return result;
        } else {
            return null;
        }
    }

    @Override
    public Integer updatePassword(String username, String password) {
        Map<String, Object> args = new HashMap<String, Object>();
        args.put("usename", username);
        args.put("password", password);

        return getJdbcTemplate().update(UPDATE_USER_PASSWORD, args);
    }

    @Override
    public User findByID(Integer id) {
        return null;
    }

    @Override
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

        return keyHolder.getKey().intValue();
    }

    @Override
    public Integer update(final User entity) {
        JdbcTemplate jdbcTemplate = getJdbcTemplate();
        PreparedStatementCreator psc = new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {

                PreparedStatement ps = con.prepareStatement(UPDATE_USER);


                ps.setString(1, entity.getPassword());
                ps.setInt(2, entity.getEnabled());


                logger.debug(ps.toString());
                return ps;

            }
        };
        jdbcTemplate.update(psc);
        return 1;
    }

    @Override
    public Integer deleteByID(Integer id) {
        return getJdbcTemplate().update(DELETE_USER_BY_ID, new Object[]{id});
    }
}
