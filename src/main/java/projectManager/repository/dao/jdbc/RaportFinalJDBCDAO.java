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
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import projectManager.repository.RaportFinal;
import projectManager.repository.dao.RaportFinalDAO;

import java.sql.*;
import java.util.List;

public class RaportFinalJDBCDAO extends JdbcDaoSupport implements RaportFinalDAO {

    private static final String RAPORT_FINAL = "SELECT * FROM raportfinal ";
    private static final String FIND_RAPORT_FINAL_BY_ID = RAPORT_FINAL + " WHERE id_raport_final=";
    private static final String DELETE_RAPORT_FINAL_BY_ID = "DELETE FROM raportfinal WHERE id_raport_final=?";
    private static final String INSERT_INTO_RAPORT_FINAL = "INSERT INTO raportfinal(id_raport_final, raport_final, nume, creat_de, creat_la)VALUES(?, ?, ?, ?, ?)";

    private RowMapper<RaportFinal> raportFinalParameterizedRowMapper = new RowMapper<RaportFinal>() {
        @Override
        public RaportFinal mapRow(ResultSet rs, int rowNum) throws SQLException {
            RaportFinal raportFinal = new RaportFinal();

            raportFinal.setIdRaportFinal(rs.getInt("id_raport_final"));
            raportFinal.setRaportFinal(rs.getString("raport_final"));
            raportFinal.setNume(rs.getString("nume"));
            raportFinal.setCreat_de(rs.getString("creat_de"));
            raportFinal.setCreat_la(rs.getTimestamp("creat_la"));

            return raportFinal;
        }
    };

    @Autowired
    public RaportFinalJDBCDAO(DriverManagerDataSource driverManagerDataSource) {
        setDataSource(driverManagerDataSource);
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public RaportFinal findByID(Integer id) {
        try {

            String findRaportFinal = FIND_RAPORT_FINAL_BY_ID + id;

            return getJdbcTemplate().queryForObject(findRaportFinal, raportFinalParameterizedRowMapper);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public Integer create(final RaportFinal entity) {
        JdbcTemplate jdbcTemplate = getJdbcTemplate();
        KeyHolder keyHolder = new GeneratedKeyHolder();

        PreparedStatementCreator psc = new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                PreparedStatement ps = con.prepareStatement(INSERT_INTO_RAPORT_FINAL, Statement.RETURN_GENERATED_KEYS);

                ps.setInt(1, entity.getIdRaportFinal());

                ps.setString(2, entity.getRaportFinal());

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
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public Integer update(final RaportFinal entity) {
        return null;
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public Integer deleteByID(Integer id) {
        return getJdbcTemplate().update(DELETE_RAPORT_FINAL_BY_ID, new Object[]{id});
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public List<RaportFinal> getAll() {
        List<RaportFinal> result = getJdbcTemplate().query(RAPORT_FINAL, raportFinalParameterizedRowMapper);

        if(result != null) {
            return result;
        } else {
            return null;
        }

    }
}
