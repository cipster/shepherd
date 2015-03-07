package model.implementation;


import com.mysql.jdbc.Statement;
import model.interfaces.PropunereDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import model.dao.Propunere;

import javax.sql.DataSource;
import java.sql.*;
import java.util.List;

public class PropunereDAOImpl extends JdbcDaoSupport implements PropunereDAO {

    private static final String PROPUNERE = "SELECT * FROM propunere ";
    private static final String FIND_PROPUNERE_BY_ID = PROPUNERE + " WHERE id_propunere=";
    private static final String DELETE_PROPUNERE_BY_ID = "DELETE FROM propunere WHERE id_propunere=?";
    private static final String INSERT_INTO_PROPUNERE = "INSERT INTO propunere(id_propunere, propunere, nume, creat_de, creat_la)VALUES(?, ?, ?, ?, ?)";

    private RowMapper<Propunere> propunereParameterizedRowMapper = new RowMapper<Propunere>() {
        @Override
        public Propunere mapRow(ResultSet rs, int rowNum) throws SQLException {
            Propunere propunere = new Propunere();

            propunere.setIdPropunere(rs.getInt("id_propunere"));
            propunere.setPropunere(rs.getString("propunere"));
            propunere.setNume(rs.getString("nume"));
            propunere.setCreat_de(rs.getString("creat_de"));
            propunere.setCreat_la(rs.getTimestamp("creat_la"));

            return propunere;
        }
    };

    @Autowired
    public PropunereDAOImpl(DataSource driverManagerDataSource) {
        setDataSource(driverManagerDataSource);
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public Propunere findByID(Integer id) {
        try {

            String findPropunere = FIND_PROPUNERE_BY_ID + id;

            return getJdbcTemplate().queryForObject(findPropunere, propunereParameterizedRowMapper);
        } catch(Exception e) {
            return null;
        }
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public Integer create(final Propunere entity) {
        JdbcTemplate jdbcTemplate = getJdbcTemplate();
        KeyHolder keyHolder = new GeneratedKeyHolder();

        PreparedStatementCreator psc = new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                PreparedStatement ps = con.prepareStatement(INSERT_INTO_PROPUNERE, Statement.RETURN_GENERATED_KEYS);

                ps.setInt(1, entity.getIdPropunere());

                ps.setString(2, entity.getPropunere());

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
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public Integer deleteByID(Integer id) {
        return getJdbcTemplate().update(DELETE_PROPUNERE_BY_ID, new Object[]{id});
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public List<Propunere> getAll() {
        List<Propunere> result = getJdbcTemplate().query(PROPUNERE, propunereParameterizedRowMapper);

        if(result != null) {
            return result;
        } else {
            return null;
        }

    }
}
