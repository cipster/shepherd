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
import projectManager.repository.EvidentaInventar;
import projectManager.repository.dao.EvidentaInventarDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
            evidentaInventar.setDataPreluarii(rs.getDate("data_preluarii"));
            evidentaInventar.setDetalii(rs.getString("detalii"));

            return evidentaInventar;
        }
    };

    @Autowired
    public EvidentaInventarDAOImpl(DriverManagerDataSource driverManagerDataSource) {
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
        final String query = "INSERT INTO proiecte.evidenta_inventar(id_evidenta_inventar, id_cod_3, id_persoana, id_loc, data_preluarii, detalii) VALUES (?,?,?,?,?,?)";

        PreparedStatementCreator psc = new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

                ps.setLong(1, entity.getIdEvidentaInventar());
                ps.setInt(2, entity.getIdCod3());
                ps.setInt(3, entity.getIdPersoana());
                ps.setInt(4, entity.getIdLoc());
                ps.setDate(5, entity.getDataPreluarii());
                ps.setString(6, entity.getDetalii());

                logger.debug(ps.toString());
                return ps;
            }
        };
        jdbcTemplate.update(psc, keyHolder);

        return keyHolder.getKey().longValue();
    }

    @Override
    public Integer update(final EvidentaInventar entity) {
        return null;
    }

    @Override
    public Integer deleteByID(Long id) {
        String query = "DELETE FROM proiecte.evidenta_inventar WHERE id_evidenta_inventar=" + id;
        return getJdbcTemplate().update(query);
    }
}
