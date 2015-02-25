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
import projectManager.repository.EvidentaInventar;
import projectManager.repository.dao.EvidentaInventarDAO;

import javax.sql.DataSource;
import java.sql.*;
import java.util.List;

/**
 * Created by Ciprian on 12/14/2014.
 * Project Raindrop
 */
public class EvidentaInventarDAOImpl extends JdbcDaoSupport implements EvidentaInventarDAO {
    private RowMapper<EvidentaInventar> rowMapper = new RowMapper<EvidentaInventar>() {
        @Override
        public EvidentaInventar mapRow(ResultSet rs, int rowNum) throws SQLException {
            EvidentaInventar evidentaInventar = new EvidentaInventar();

            evidentaInventar.setIdEvidentaInventar(rs.getInt("id_evidenta_inventar"));
            evidentaInventar.setIdCod3(rs.getInt("id_cod_3"));
            evidentaInventar.setIdPersoana(rs.getInt("id_persoana"));
            evidentaInventar.setIdLoc(rs.getInt("id_loc"));
            evidentaInventar.setDataPreluarii(rs.getString("data_preluarii"));
            evidentaInventar.setDataRecuperarii(rs.getString("data_recuperarii"));
            evidentaInventar.setDetalii(rs.getString("detalii"));

            return evidentaInventar;
        }
    };

    @Autowired
    public EvidentaInventarDAOImpl(DataSource driverManagerDataSource) {
        setDataSource(driverManagerDataSource);
    }

    @Override
    public List<EvidentaInventar> getAll() {
        final String query = "SELECT * FROM proiecte.evidenta_inventar";
        try {
            return getJdbcTemplate().query(query, rowMapper);
        } catch (DataAccessException ex){
            ex.printStackTrace();
            return null;
        }
    }

    @Override
    public EvidentaInventar findByIdArticol(String idArticol) {
        try {
            String query = "SELECT * FROM proiecte.evidenta_inventar WHERE id_cod_3='"
                    + idArticol
                    + "' AND data_recuperarii IS NULL ORDER BY id_evidenta_inventar DESC LIMIT 1";
            return getJdbcTemplate().queryForObject(query, rowMapper);
        } catch (DataAccessException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<EvidentaInventar> findTranzitByIdPersoana(int idPersoana) {
        final String query = "SELECT e.* FROM evidenta_inventar e " +
                "JOIN cod_3 c ON e.id_cod_3=c.cod_3 AND c.stare=4 " +
                "WHERE e.data_recuperarii IS NULL ANd e.id_persoana=" + idPersoana;
        try {
            return getJdbcTemplate().query(query, rowMapper);
        } catch (DataAccessException ex){
            ex.printStackTrace();
            return null;
        }
    }

    @Override
    public EvidentaInventar findByID(Long id) {
        try {
            String query = "SELECT * FROM proiecte.evidenta_inventar WHERE id_evidenta_inventar=" + id;

            return getJdbcTemplate().queryForObject(query, rowMapper);
        } catch (DataAccessException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Long create(final EvidentaInventar entity) {
        JdbcTemplate jdbcTemplate = getJdbcTemplate();
        KeyHolder keyHolder = new GeneratedKeyHolder();
        final String query = "INSERT INTO proiecte.evidenta_inventar(id_evidenta_inventar, id_cod_3, id_persoana, id_loc, data_preluarii, detalii) VALUES (?,?,?,?,now(),?)";

        PreparedStatementCreator psc = new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

                ps.setLong(1, entity.getIdEvidentaInventar());
                ps.setInt(2, entity.getIdCod3());
                ps.setInt(3, entity.getIdPersoana());
                ps.setInt(4, entity.getIdLoc());

                ps.setString(5, (entity.getDetalii() == null)?"":entity.getDetalii());

                logger.debug(ps.toString());
                return ps;
            }
        };
        jdbcTemplate.update(psc, keyHolder);

        return keyHolder.getKey().longValue();
    }

    @Override
    public Integer update(final EvidentaInventar entity) {
        JdbcTemplate jdbcTemplate = getJdbcTemplate();
        final String query = "UPDATE proiecte.evidenta_inventar SET id_cod_3=?, id_persoana=?, id_loc=?, data_recuperarii=NOW(), detalii=? WHERE id_evidenta_inventar=?";

        PreparedStatementCreator psc = new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {

                PreparedStatement ps = con.prepareStatement(query);

                ps.setInt(1, entity.getIdCod3());
                ps.setInt(2, entity.getIdPersoana());
                ps.setInt(3, entity.getIdLoc());
                ps.setString(4, entity.getDetalii());
                ps.setLong(5, entity.getIdEvidentaInventar());

                logger.debug(ps.toString());
                return ps;
            }
        };
        jdbcTemplate.update(psc);
        return 1;
    }

    @Override
    public Integer deleteByID(Long id) {
        String query = "DELETE FROM proiecte.evidenta_inventar WHERE id_evidenta_inventar=" + id;
        return getJdbcTemplate().update(query);
    }
}
