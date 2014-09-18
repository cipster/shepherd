package projectManager.dao.jdbc;


import com.mysql.jdbc.Statement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import projectManager.dao.PropunereDAO;
import projectManager.repository.Propunere;

import java.sql.*;
import java.util.List;

public class PropunereJDBCDAO extends JdbcDaoSupport implements PropunereDAO {

    private static final String PROPUNERE = "SELECT * FROM propunere ";
    private static final String FIND_PROPUNERE_BY_ID = PROPUNERE + " WHERE id_propunere=";
    private static final String DELETE_PROPUNERE_BY_ID = "DELETE FROM propunere WHERE id_propunere=?";
    private static final String INSERT_INTO_PROPUNERE = "INSERT INTO propunere(id_propunere, propunere, nume, creat_de, creat_la)VALUES(?, ?, ?, ?, ?)";

    private ParameterizedRowMapper<Propunere> propunereParameterizedRowMapper = new ParameterizedRowMapper<Propunere>() {
        @Override
        public Propunere mapRow(ResultSet rs, int rowNum) throws SQLException {
            Propunere propunere = new Propunere();

            propunere.setIdPropunere(rs.getInt("id_propunere"));
            propunere.setPropunere(rs.getBytes("propunere"));
            propunere.setNume(rs.getString("nume"));
            propunere.setCreat_de(rs.getString("creat_de"));
            propunere.setCreat_la(rs.getTimestamp("creat_la"));

            return propunere;
        }
    };

    @Autowired
    public PropunereJDBCDAO(DriverManagerDataSource driverManagerDataSource) {
        setDataSource(driverManagerDataSource);
    }

    @Override
    public Propunere findByID(Integer id) {
        try {

            String findPropunere = FIND_PROPUNERE_BY_ID + id;

            return getJdbcTemplate().queryForObject(findPropunere, propunereParameterizedRowMapper);
        } catch(Exception e) {
            return null;
        }
    }

    @Override
    public Integer create(final Propunere entity) {
        JdbcTemplate jdbcTemplate = getJdbcTemplate();
        KeyHolder keyHolder = new GeneratedKeyHolder();

        PreparedStatementCreator psc = new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                PreparedStatement ps = con.prepareStatement(INSERT_INTO_PROPUNERE, Statement.RETURN_GENERATED_KEYS);

                ps.setInt(1, entity.getIdPropunere());

                ps.setBytes(2, entity.getPropunere());

                ps.setString(3, entity.getNume().replace(",", " "));

                ps.setString(4, entity.getCreat_de());

                ps.setTimestamp(5, new Timestamp(System.currentTimeMillis()));

                logger.debug(ps.toString());
                return ps;
            }
        };
        jdbcTemplate.update(psc, keyHolder);

        return keyHolder.getKey().intValue();
    }

    @Override
    public Integer update(final Propunere entity) {
        return null;
    }

    @Override
    public Integer deleteByID(Integer id) {
        return getJdbcTemplate().update(DELETE_PROPUNERE_BY_ID, new Object[]{id});
    }

    @Override
    public List<Propunere> getAll() {
        List<Propunere> result = getJdbcTemplate().query(PROPUNERE, propunereParameterizedRowMapper);

        if(result != null) {
            return result;
        } else {
            return null;
        }

    }
}
