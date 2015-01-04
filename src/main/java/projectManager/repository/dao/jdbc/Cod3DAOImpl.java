package projectManager.repository.dao.jdbc;

import com.mysql.jdbc.Statement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import projectManager.repository.Cod3;
import projectManager.repository.dao.Cod3DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by Ciprian on 12/14/2014.
 * Project Raindrop
 */
public class Cod3DAOImpl extends JdbcDaoSupport implements Cod3DAO {
    private RowMapper<Cod3> rowMapper = new RowMapper<Cod3>() {
        @Override
        public Cod3 mapRow(ResultSet rs, int rowNum) throws SQLException {
            Cod3 cod3 = new Cod3();

            cod3.setIdCod3(rs.getInt("id_cod_3"));
            cod3.setCod1(rs.getInt("cod_1"));
            cod3.setCod2(rs.getInt("cod_2"));
            cod3.setCod3(rs.getInt("cod_3"));
            cod3.setDenumire3(rs.getString("denumire_3"));
            cod3.setBarcode(rs.getString("barcode"));
            cod3.setDetalii(rs.getString("detalii"));
            cod3.setPretAchizitie(rs.getString("pret_achizitie"));
            cod3.setStare(rs.getByte("stare"));

            return cod3;
        }
    };

    @Autowired
    public Cod3DAOImpl(DriverManagerDataSource driverManagerDataSource) {
        setDataSource(driverManagerDataSource);
    }

    @Override
    public List<Cod3> getAll() {
        final String query = "SELECT * FROM proiecte.cod_3";
        try {
            return getJdbcTemplate().query(query, rowMapper);
        } catch (DataAccessException ex){
            ex.printStackTrace();
            return null;
        }
    }

    @Override
    public Cod3 findByBarcode(String code) throws DataAccessException{
        final String query = "SELECT * FROM proiecte.cod_3 WHERE barcode=" + code;

        return getJdbcTemplate().queryForObject(query, rowMapper);

    }

    @Override
    public void setStare(final byte stare, final int id) {
        JdbcTemplate jdbcTemplate = getJdbcTemplate();
        final String query = "UPDATE proiecte.cod_3 SET stare=? WHERE cod_3=?";

        PreparedStatementCreator psc = new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {

                PreparedStatement ps = con.prepareStatement(query);

                ps.setInt(1, stare);

                ps.setInt(2, id);


                logger.debug(ps.toString());
                return ps;
            }
        };
        jdbcTemplate.update(psc);
    }

    @Override
    public Cod3 findByID(Integer id) {
        try {
            final String query = "SELECT * FROM proiecte.cod_3 WHERE id_cod_3=" + id;

            return getJdbcTemplate().queryForObject(query, rowMapper);
        } catch (DataAccessException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Integer create(final Cod3 entity) {
        JdbcTemplate jdbcTemplate = getJdbcTemplate();
        KeyHolder keyHolder = new GeneratedKeyHolder();
        final String query = "INSERT INTO proiecte.cod_3(id_cod_3, cod_1, cod_2, cod_3, denumire_3, barcode, detalii, pret_achizitie,stare) VALUES (?,?,?,getLastCode3(),?,uuid(),?,?,1)";

        PreparedStatementCreator psc = new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

                ps.setInt(1, entity.getIdCod3());
                ps.setInt(2, entity.getCod1());
                ps.setInt(3, entity.getCod2());
                ps.setString(4, entity.getDenumire3());
                ps.setString(5, entity.getDetalii());
                ps.setString(6, entity.getPretAchizitie());

                logger.debug(ps.toString());
                return ps;
            }
        };
        jdbcTemplate.update(psc, keyHolder);

        return keyHolder.getKey().intValue();
    }

    @Override
    public Integer update(final Cod3 entity) {
        JdbcTemplate jdbcTemplate = getJdbcTemplate();
        final String query = "UPDATE proiecte.cod_3 SET cod_1=?, cod_2=?, denumire_3=?, detalii=?, pret_achizitie=?, stare =? WHERE id_cod_3=?";

        PreparedStatementCreator psc = new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {

                PreparedStatement ps = con.prepareStatement(query);

                ps.setInt(1, entity.getCod1());
                ps.setInt(2, entity.getCod2());
                ps.setString(3, entity.getDenumire3());
                ps.setString(4, entity.getDetalii());
                ps.setString(5, entity.getPretAchizitie());
                ps.setByte(6, entity.getStare());
                ps.setInt(7, entity.getIdCod3());


                logger.debug(ps.toString());
                return ps;
            }
        };
        jdbcTemplate.update(psc);
        return entity.getIdCod3();
    }

    @Override
    public Integer deleteByID(Integer id) {
        String query = "DELETE FROM proiecte.cod_3 WHERE id_cod_3=" + id;
        return getJdbcTemplate().update(query);
    }
}
