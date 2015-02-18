package projectManager.repository.dao.jdbc;


import com.mysql.jdbc.Statement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import projectManager.repository.UserRoles;
import projectManager.repository.dao.UserRolesDAO;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserRolesJDBCDAO extends JdbcDaoSupport implements UserRolesDAO {
    String USER_ROLE = "SELECT * FROM user_roles";
    String FIND_USER_ROLE_BY_USERNAME = USER_ROLE + " WHERE username=?" ;
    String DELETE_USER_ROLE = "DELETE FROM user_roles where username=? and role=?";
    String INSERT_INTO_USER_ROLES = "INSERT INTO user_roles(user_role_id, username, role, role_type) VALUES(?,?,?,?)";

    private RowMapper<UserRoles> userRolesParameterizedRowMapper = new RowMapper<UserRoles>() {
        @Override
        public UserRoles mapRow(ResultSet rs, int rowNum) throws SQLException {
            UserRoles userRoles = new UserRoles();

            userRoles.setUserRoleId(rs.getInt("user_role_id"));
            userRoles.setUsername(rs.getString("username"));
            userRoles.setRole(rs.getString("role"));
            userRoles.setRoleType(rs.getInt("role_type"));

            return userRoles;
        }
    };

    @Autowired
    public UserRolesJDBCDAO(DataSource driverManagerDataSource) {
        setDataSource(driverManagerDataSource);
    }


    @Override
    public List<UserRoles> getAll() {
        List<UserRoles> result = getJdbcTemplate().query(USER_ROLE, userRolesParameterizedRowMapper);

        if(result != null) {
            return result;
        } else {
            return null;
        }
    }

    @Override
    public List<UserRoles> findByID(String username) {

        try {
            return getJdbcTemplate().query(FIND_USER_ROLE_BY_USERNAME, userRolesParameterizedRowMapper, new Object[]{username});
        } catch (Exception e) {
            return null;
        }

    }

    @Override
    public void deleteByUsernameAndRole(String username, String role) {
            Map<String, Object> args = new HashMap<String, Object>();
            args.put("username", username);
            args.put("role", role);
            StringBuilder deleteUserRole = new StringBuilder(DELETE_USER_ROLE);

            getJdbcTemplate().update(deleteUserRole.toString(), userRolesParameterizedRowMapper, args);
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public Integer deleteByUsername(String user) {
        final String query = "DELETE FROM user_roles where username='" + user + "'";
        try{
            getJdbcTemplate().update(query);
            return 1;
        } catch (DataAccessException e){
            return 0;
        }
    }

    @Override
    public UserRoles findByID(Integer integer) {
        return null;
    }

    @Override
    public Integer create(final UserRoles entity) {
        JdbcTemplate jdbcTemplate = getJdbcTemplate();
        KeyHolder keyHolder = new GeneratedKeyHolder();

        PreparedStatementCreator psc = new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                PreparedStatement ps = con.prepareStatement(INSERT_INTO_USER_ROLES, Statement.RETURN_GENERATED_KEYS);

                ps.setInt(1, entity.getUserRoleId());
                ps.setString(2, entity.getUsername());
                ps.setString(3, entity.getRole());
                ps.setInt(4, entity.getRoleType());


                logger.debug(ps.toString());
                return ps;
            }
        };
        jdbcTemplate.update(psc, keyHolder);

        return keyHolder.getKey().intValue();
    }

    @Override
    public Integer update(UserRoles entity) {
        return null;
    }

    @Override
    public Integer deleteByID(Integer integer) {
        return null;
    }
}
