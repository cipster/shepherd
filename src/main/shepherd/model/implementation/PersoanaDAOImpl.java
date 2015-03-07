package model.implementation;

import com.mysql.jdbc.Statement;
import model.dao.Persoana;
import model.interfaces.PersoanaDAO;
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
public class PersoanaDAOImpl extends JdbcDaoSupport implements PersoanaDAO {
    private RowMapper<Persoana> rowMapper = new RowMapper<Persoana>() {
        @Override
        public Persoana mapRow(ResultSet rs, int rowNum) throws SQLException {
            Persoana persoana = new Persoana();

            persoana.setIdPersoana(rs.getInt("id_persoana"));
            persoana.setNume(rs.getString("nume"));
            persoana.setCnp(rs.getString("cnp"));
            persoana.setFunctie(rs.getString("functie"));
            persoana.setUsername(rs.getString("username"));

            return persoana;
        }
    };

    @Autowired
    public PersoanaDAOImpl(DataSource driverManagerDataSource) {
        setDataSource(driverManagerDataSource);
    }

    @Override
    public List<Persoana> getAll() {
        final String query = "SELECT * FROM proiecte.persoana";
        try {
            return getJdbcTemplate().query(query, rowMapper);
        } catch (DataAccessException ex){
            ex.printStackTrace();
            return null;
        }
    }

    @Override
    public Persoana findByUsername(String username) {
        try {
            String query = "SELECT * FROM proiecte.persoana WHERE username='" + username + "'";

            return getJdbcTemplate().queryForObject(query, rowMapper);
        } catch (DataAccessException e) {
            return null;
        }
    }

    @Override
    public Persoana findByID(Integer id) {
        try {
            String query = "SELECT * FROM proiecte.persoana WHERE id_persoana=" + id;

            return getJdbcTemplate().queryForObject(query, rowMapper);
        } catch (DataAccessException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Integer create(final Persoana entity) {
        JdbcTemplate jdbcTemplate = getJdbcTemplate();
        KeyHolder keyHolder = new GeneratedKeyHolder();
        final String query = "INSERT INTO proiecte.persoana(id_persoana, nume,cnp, functie,username) VALUES (?,?,?,?,?)";

        PreparedStatementCreator psc = new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

                ps.setInt(1, entity.getIdPersoana());
                ps.setString(2, entity.getNume());
                ps.setString(3, entity.getCnp());
                ps.setString(4, entity.getFunctie());
                ps.setString(5, entity.getUsername());

                logger.debug(ps.toString());
                return ps;
            }
        };
        jdbcTemplate.update(psc, keyHolder);

        return keyHolder.getKey().intValue();
    }

    @Override
    public Integer update(final Persoana entity) {
        JdbcTemplate jdbcTemplate = getJdbcTemplate();
        final String query = "UPDATE proiecte.persoana SET nume=?, cnp=?, functie=?, username=? WHERE id_persoana=?";

        PreparedStatementCreator psc = new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {

                PreparedStatement ps = con.prepareStatement(query);

                ps.setString(1, entity.getNume());
                ps.setString(2, entity.getCnp());
                ps.setString(3, entity.getFunctie());
                ps.setString(4, entity.getUsername());
                ps.setInt(5, entity.getIdPersoana());

                logger.debug(ps.toString());
                return ps;
            }
        };
        jdbcTemplate.update(psc);
        return entity.getIdPersoana();
    }

    @Override
    public Integer deleteByID(Integer id) {
        String query = "DELETE FROM proiecte.persoana WHERE id_persoana=" + id;
        return getJdbcTemplate().update(query);
    }
}
