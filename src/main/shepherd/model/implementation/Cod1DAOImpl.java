package model.implementation;

import com.mysql.jdbc.Statement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import model.domain.Cod1;
import model.dao.Cod1DAO;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

public class Cod1DAOImpl extends JdbcDaoSupport implements Cod1DAO {

    private RowMapper<Cod1> rowMapper = new RowMapper<Cod1>() {
        @Override
        public Cod1 mapRow(ResultSet rs, int rowNum) throws SQLException {
            Cod1 cod1 = new Cod1();

            cod1.setIdCod1(rs.getInt("id_cod_1"));
            cod1.setCod1(rs.getInt("cod_1"));
            cod1.setDenumire1(rs.getString("denumire_1"));

            return cod1;
        }
    };

    @Autowired
    public Cod1DAOImpl(DataSource driverManagerDataSource) {
        setDataSource(driverManagerDataSource);
    }

    @Override
    public List<Cod1> getAll() {
        final String query = "SELECT * FROM proiecte.cod_1";
        try {
            return getJdbcTemplate().query(query, rowMapper);
        } catch (DataAccessException e){
            logger.error(e);
           return Collections.emptyList();
        }
    }

    @Override
    public Cod1 findByID(Integer id) {
        try {
            String query = "SELECT * FROM proiecte.cod_1 WHERE id_cod_1=" + id;

            return getJdbcTemplate().queryForObject(query, rowMapper);
        } catch (DataAccessException e) {
            logger.error(e);
            return null;
        }
    }

    @Override
    public Integer create(final Cod1 entity) {
        JdbcTemplate jdbcTemplate = getJdbcTemplate();
        KeyHolder keyHolder = new GeneratedKeyHolder();
        final String query = "INSERT INTO proiecte.cod_1(id_cod_1, cod_1, denumire_1) VALUES (?,?,?)";

        PreparedStatementCreator psc = new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

                ps.setInt(1, entity.getIdCod1());
                ps.setInt(2, entity.getIdCod1());
                ps.setString(3, entity.getDenumire1());

                logger.debug(ps.toString());
                return ps;
            }
        };
        jdbcTemplate.update(psc, keyHolder);

        return keyHolder.getKey().intValue();
    }

    @Override
    public Integer update(final Cod1 entity) {
        JdbcTemplate jdbcTemplate = getJdbcTemplate();
        final String query = "UPDATE proiecte.cod_1 SET denumire_1=? WHERE id_cod_1=?";

        PreparedStatementCreator psc = new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {

                PreparedStatement ps = con.prepareStatement(query);

                ps.setString(1, entity.getDenumire1());
                ps.setInt(2, entity.getIdCod1());

                logger.debug(ps.toString());
                return ps;
            }
        };
        jdbcTemplate.update(psc);
        return entity.getIdCod1();
    }

    @Override
    public Integer deleteByID(Integer id) {
        String query = "DELETE FROM proiecte.cod_1 WHERE id_cod_1=" + id;
        return getJdbcTemplate().update(query);
    }
}
