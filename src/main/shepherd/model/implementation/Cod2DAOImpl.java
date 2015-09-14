package model.implementation;

import com.mysql.jdbc.Statement;
import model.domain.Cod2;
import model.dao.Cod2DAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by Ciprian on 12/14/2014.
 * Project Raindrop
 */
public class Cod2DAOImpl extends JdbcDaoSupport implements Cod2DAO {
    private RowMapper<Cod2> rowMapper = new RowMapper<Cod2>() {
        @Override
        public Cod2 mapRow(ResultSet rs, int rowNum) throws SQLException {
            Cod2 cod2 = new Cod2();

            cod2.setIdCod2(rs.getInt("id_cod_2"));
            cod2.setCod1(rs.getInt("cod_1"));
            cod2.setCod2(rs.getInt("cod_2"));
            cod2.setDenumire2(rs.getString("denumire_2"));

            return cod2;
        }
    };

    @Autowired
    public Cod2DAOImpl(DataSource driverManagerDataSource) {
        setDataSource(driverManagerDataSource);
    }

    @Override
    public List<Cod2> getAll() {
        final String query = "SELECT * FROM proiecte.cod_2";
        try {
            return getJdbcTemplate().query(query, rowMapper);
        } catch (DataAccessException ex){
            ex.printStackTrace();
            return null;
        }
    }

    @Override
    public List<Cod2> getAllByCod1(int cod1) {
        final String query = "SELECT * FROM proiecte.cod_2 c WHERE c.cod_1='" + cod1 + "'";
        try {
            return getJdbcTemplate().query(query, rowMapper);
        } catch (DataAccessException ex){
            ex.printStackTrace();
            return null;
        }
    }

    @Override
    public Cod2 findByID(Integer id) {
        try {
            String query = "SELECT * FROM proiecte.cod_2 WHERE id_cod_2=" + id;

            return getJdbcTemplate().queryForObject(query, rowMapper);
        } catch (DataAccessException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Integer create(final Cod2 entity) {
        JdbcTemplate jdbcTemplate = getJdbcTemplate();
        KeyHolder keyHolder = new GeneratedKeyHolder();
        final String query = "INSERT INTO proiecte.cod_2(id_cod_2, cod_1,cod_2, denumire_2) VALUES (?,?,?,?)";

        PreparedStatementCreator psc = new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

                ps.setInt(1, entity.getIdCod2());
                ps.setInt(2, entity.getCod1());
                ps.setInt(3, entity.getCod2());
                ps.setString(4, entity.getDenumire2());

                logger.debug(ps.toString());
                return ps;
            }
        };
        jdbcTemplate.update(psc, keyHolder);

        return keyHolder.getKey().intValue();
    }

    @Override
    public Integer update(final Cod2 entity) {
        JdbcTemplate jdbcTemplate = getJdbcTemplate();
        final String query = "UPDATE proiecte.cod_2 SET cod_1=?, cod_2=?, denumire_2=? WHERE id_cod_2=?";

        PreparedStatementCreator psc = new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {

                PreparedStatement ps = con.prepareStatement(query);

                ps.setInt(1, entity.getCod1());
                ps.setInt(2, entity.getCod2());
                ps.setString(3, entity.getDenumire2());
                ps.setInt(4, entity.getIdCod2());

                logger.debug(ps.toString());
                return ps;
            }
        };
        jdbcTemplate.update(psc);
        return entity.getIdCod2();
    }

    @Override
    public Integer deleteByID(Integer id) {
        String query = "DELETE FROM proiecte.cod_2 WHERE id_cod_2=" + id;
        return getJdbcTemplate().update(query);
    }
}
