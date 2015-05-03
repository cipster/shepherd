package model.implementation;


import com.mysql.jdbc.Statement;
import model.domain.Bd;
import model.dao.BdDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import javax.sql.DataSource;
import java.sql.*;
import java.util.List;

public class BdDAOImpl extends JdbcDaoSupport implements BdDAO {

    private static final String DB = "SELECT * FROM bd ";
    private static final String FIND_DB_BY_ID = DB + " WHERE id_bd=";
    private static final String DELETE_DB_BY_ID = "DELETE FROM bd WHERE id_bd=?";
    private static final String INSERT_INTO_DB = "INSERT INTO bd(id_bd, bd, nume, creat_de, creat_la)VALUES(?, ?, ?, ?, ?)";

    private RowMapper<Bd> bdRowMapper = new RowMapper<Bd>() {
        @Override
        public Bd mapRow(ResultSet rs, int rowNum) throws SQLException {
            Bd bd = new Bd();

            bd.setIdBd(rs.getInt("id_bd"));
            bd.setBd(rs.getString("bd"));
            bd.setNume(rs.getString("nume"));
            bd.setCreat_de(rs.getString("creat_de"));
            bd.setCreat_la(rs.getTimestamp("creat_la"));

            return bd;
        }
    };

    @Autowired
    public BdDAOImpl(DataSource driverManagerDataSource) {
        setDataSource(driverManagerDataSource);
    }


    @Override
    @Transactional(isolation = Isolation.READ_UNCOMMITTED)
    public Bd findByID(Integer id) {
        try {

            String findBd = FIND_DB_BY_ID + id;

            return getJdbcTemplate().queryForObject(findBd, bdRowMapper);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public Integer create(final Bd entity) {
        JdbcTemplate jdbcTemplate = getJdbcTemplate();
        KeyHolder keyHolder = new GeneratedKeyHolder();

        PreparedStatementCreator psc = new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                PreparedStatement ps = con.prepareStatement(INSERT_INTO_DB, Statement.RETURN_GENERATED_KEYS);

                ps.setInt(1, entity.getIdBd());

                ps.setString(2, entity.getBd());

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
    public Integer update(final Bd entity) {
        return null;

    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public Integer deleteByID(Integer id) {

        return getJdbcTemplate().update(DELETE_DB_BY_ID, new Object[]{id});

    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public List<Bd> getAll() {
        List<Bd> result = getJdbcTemplate().query(DB, bdRowMapper);

        if(result != null) {
            return result;
        } else {
            return null;
        }

    }
}
