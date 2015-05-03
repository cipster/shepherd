package model.implementation;


import com.mysql.jdbc.Statement;
import exceptions.DAOException;
import model.domain.Client;
import model.dao.ClientDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class ClientDAOImpl extends JdbcDaoSupport implements ClientDAO {


    private static final String CLIENTI = "SELECT * FROM clienti ";
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
    public ClientDAOImpl(DataSource driverManagerDataSource) {
        setDataSource(driverManagerDataSource);
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public List<Client> getAll() {
        List<Client> result = getJdbcTemplate().query(CLIENTI, clientiParameterizedRowMapper);

        if (result != null) {
            return result;
        } else {
            return null;
        }
    }

	@Override
	public Client findClientByName(String name) {
		try {
			String findProiect = "SELECT * FROM clienti WHERE client='" + name + "'";
			return getJdbcTemplate().queryForObject(findProiect, clientiParameterizedRowMapper);
		} catch (DataAccessException e) {
			return null;
		}
	}

	@Override
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public Client findByID(Integer id) {
        try {
            String findProiect = "SELECT * FROM clienti WHERE id_client=" + id;
            return getJdbcTemplate().queryForObject(findProiect, clientiParameterizedRowMapper);
        } catch (DataAccessException e) {
            return null;
        }
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public Integer create(final Client entity) {
        JdbcTemplate jdbcTemplate = getJdbcTemplate();
        KeyHolder keyHolder = new GeneratedKeyHolder();

		try {
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
		} catch (DataAccessException e) {
			throw e;
		}

		return keyHolder.getKey().intValue();
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public Integer update(final Client entity) {
        JdbcTemplate jdbcTemplate = getJdbcTemplate();
		try {
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
		} catch (DataAccessException e) {
			e.printStackTrace();
			throw new DAOException(e.getMessage());
		}
		return entity.getIdClient();

    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public Integer deleteByID(Integer id) {
        return getJdbcTemplate().update(DELETE_CLIENTI_BY_ID, id);
    }
}
