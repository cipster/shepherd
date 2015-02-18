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
import projectManager.repository.Loc;
import projectManager.repository.dao.LocDAO;

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
public class LocDAOImpl extends JdbcDaoSupport implements LocDAO {
    private RowMapper<Loc> rowMapper = new RowMapper<Loc>() {
        @Override
        public Loc mapRow(ResultSet rs, int rowNum) throws SQLException {
            Loc loc = new Loc();

            loc.setIdLoc(rs.getInt("id_loc"));
            loc.setDenumireLoc(rs.getString("denumire_loc"));

            return loc;
        }
    };

    @Autowired
    public LocDAOImpl(DataSource driverManagerDataSource) {
        setDataSource(driverManagerDataSource);
    }

    @Override
    public List<Loc> getAll() {
        final String query = "SELECT * FROM proiecte.loc";
        try {
            return getJdbcTemplate().query(query, rowMapper);
        } catch (DataAccessException ex){
            ex.printStackTrace();
            return null;
        }
    }

    @Override
    public Loc findByID(Integer id) {
        try {
            String query = "SELECT * FROM proiecte.loc WHERE id_loc=" + id;

            return getJdbcTemplate().queryForObject(query, rowMapper);
        } catch (DataAccessException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Integer create(final Loc entity) {
        JdbcTemplate jdbcTemplate = getJdbcTemplate();
        KeyHolder keyHolder = new GeneratedKeyHolder();
        final String query = "INSERT INTO proiecte.loc(id_loc, denumire_loc) VALUES (?,?)";

        PreparedStatementCreator psc = new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

                ps.setInt(1, entity.getIdLoc());
                ps.setString(2, entity.getDenumireLoc());

                logger.debug(ps.toString());
                return ps;
            }
        };
        jdbcTemplate.update(psc, keyHolder);

        return keyHolder.getKey().intValue();
    }

    @Override
    public Integer update(final Loc entity) {
        JdbcTemplate jdbcTemplate = getJdbcTemplate();
        final String query = "UPDATE proiecte.loc SET denumire_loc=? WHERE id_loc=?";

        PreparedStatementCreator psc = new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {

                PreparedStatement ps = con.prepareStatement(query);

                ps.setString(1, entity.getDenumireLoc());
                ps.setInt(2, entity.getIdLoc());

                logger.debug(ps.toString());
                return ps;
            }
        };
        jdbcTemplate.update(psc);
        return entity.getIdLoc();
    }

    @Override
    public Integer deleteByID(Integer id) {
        String query = "DELETE FROM proiecte.loc WHERE id_loc=" + id;
        return getJdbcTemplate().update(query);
    }
}
