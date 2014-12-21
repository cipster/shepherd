package projectManager.repository.dao.jdbc;

import com.mysql.jdbc.Statement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import projectManager.repository.Roles;
import projectManager.repository.dao.RolesDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class RolesJDBCDAO extends JdbcDaoSupport implements RolesDAO {

    String ROLE = "SELECT * FROM roles ORDER BY role ASC";
    String FIND_ROLE_BY_ID = ROLE + " WHERE idRole=?";
    String DELETE_ROLE = "DELETE FROM roles where idRole=?";
    String INSERT_INTO_ROLES = "INSERT INTO roles(idRole, role) VALUES(?,?)";

    private RowMapper<Roles> rolesParameterizedRowMapper = new RowMapper<Roles>() {
        @Override
        public Roles mapRow(ResultSet rs, int rowNum) throws SQLException {
            Roles roles = new Roles();

            roles.setIdRole(rs.getInt("idRole"));
            roles.setRole(rs.getString("role"));

            return roles;
        }
    };

    @Autowired
    public RolesJDBCDAO(DriverManagerDataSource driverManagerDataSource) {
        setDataSource(driverManagerDataSource);
    }


    @Override
    public List<Roles> getAll() {
        List<Roles> result = getJdbcTemplate().query(ROLE, rolesParameterizedRowMapper);

        if(result != null) {
            return result;
        } else {
            return null;
        }
    }

    @Override
    public Roles findByID(Integer id) {
        try {
            Map<String, Object> args = new HashMap<String, Object>();
            args.put("id_role", id);
            StringBuilder findUser = new StringBuilder(FIND_ROLE_BY_ID);

            return getJdbcTemplate().queryForObject(findUser.toString(), rolesParameterizedRowMapper, args);
        } catch(EmptyResultDataAccessException e) {
            return null;
        }
    }

    @Override
    public Integer create(final Roles entity) {
        JdbcTemplate jdbcTemplate = getJdbcTemplate();
        KeyHolder keyHolder = new GeneratedKeyHolder();

        PreparedStatementCreator psc = new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                PreparedStatement ps = con.prepareStatement(INSERT_INTO_ROLES, Statement.RETURN_GENERATED_KEYS);

                ps.setInt(1, entity.getIdRole());

                ps.setString(2, entity.getRole());

                logger.debug(ps.toString());
                return ps;
            }
        };
        jdbcTemplate.update(psc, keyHolder);

        return keyHolder.getKey().intValue();
    }

    @Override
    public Integer update(Roles entity) {
        return null;
    }

    @Override
    public Integer deleteByID(Integer id) {
        return getJdbcTemplate().update(DELETE_ROLE, new Object[]{id});
    }
}
