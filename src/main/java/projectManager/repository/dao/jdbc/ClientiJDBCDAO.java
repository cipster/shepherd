package projectManager.repository.dao.jdbc;


import com.mysql.jdbc.Statement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import projectManager.repository.Client;
import projectManager.repository.dao.ClientDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ClientiJDBCDAO extends JdbcDaoSupport implements ClientDAO {


    private static final String CLIENTI = "SELECT * FROM clienti ";
    private static final String FIND_CLIENTI_BY_ID = CLIENTI + " WHERE id_client=:id_client";
    private static final String DELETE_CLIENTI_BY_ID = "DELETE FROM clienti WHERE id_client=?";
    private static final String INSERT_INTO_CLIENTI = "INSERT INTO clienti(id_client, client)VALUES(?, ?)";
    private static final String UPDATE_CLIENTI = "UPDATE clienti SET client = ? WHERE id_client = ?";

    private RowMapper<Client> clientiParameterizedRowMapper = new RowMapper<Client>() {
        @Override
        public Client mapRow(ResultSet rs, int rowNum) throws SQLException {
            Client client = new Client();

            client.setIdClient(rs.getInt("id_client"));
            client.setClient(rs.getString("client"));

            return client;
        }
    };

    @Autowired
    public ClientiJDBCDAO(DriverManagerDataSource driverManagerDataSource) {
        setDataSource(driverManagerDataSource);
    }

    @Override
    public List<Client> getAll() {
        List<Client> result = getJdbcTemplate().query(CLIENTI, clientiParameterizedRowMapper);

        if (result != null) {
            return result;
        } else {
            return null;
        }
    }

    @Override
    public Client findByID(Integer id) {
        try {
            String findProiect = "SELECT * FROM clienti WHERE id_client=" + id;
            return getJdbcTemplate().queryForObject(findProiect, clientiParameterizedRowMapper);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public Integer create(final Client entity) {
        JdbcTemplate jdbcTemplate = getJdbcTemplate();
        KeyHolder keyHolder = new GeneratedKeyHolder();

        PreparedStatementCreator psc = new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                PreparedStatement ps = con.prepareStatement(INSERT_INTO_CLIENTI, Statement.RETURN_GENERATED_KEYS);

                ps.setInt(1, entity.getIdClient());

                ps.setString(2, entity.getClient());

                logger.debug(ps.toString());
                return ps;
            }
        };
        jdbcTemplate.update(psc, keyHolder);

        return keyHolder.getKey().intValue();
    }

    @Override
    public Integer update(final Client entity) {
        JdbcTemplate jdbcTemplate = getJdbcTemplate();
        PreparedStatementCreator psc = new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                PreparedStatement ps = con.prepareStatement(UPDATE_CLIENTI);

                ps.setString(1, entity.getClient());
                ps.setInt(2, entity.getIdClient());
                logger.debug(ps.toString());
                return ps;

            }
        };
        jdbcTemplate.update(psc);
        return entity.getIdClient();

    }

    @Override
    public Integer deleteByID(Integer id) {
        return getJdbcTemplate().update(DELETE_CLIENTI_BY_ID, new Object[]{id});
    }
}
