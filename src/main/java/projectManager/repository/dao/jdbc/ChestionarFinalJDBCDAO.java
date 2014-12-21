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
import projectManager.repository.ChestionarFinal;
import projectManager.repository.dao.ChestionarFinalDAO;

import java.sql.*;
import java.util.List;

public class ChestionarFinalJDBCDAO extends JdbcDaoSupport implements ChestionarFinalDAO {

    private static final String CHESTIONAR_FINAL = "SELECT * FROM chestionarfinal ";
    private static final String FIND_CHESTIONAR_FINAL_BY_ID = CHESTIONAR_FINAL + " WHERE id_chestionar_final=";
    private static final String DELETE_CHESTIONAR_FINAL_BY_ID = "DELETE FROM chestionarfinal WHERE id_chestionar_final=?";
    private static final String INSERT_INTO_CHESTIONAR_FINAL = "INSERT INTO chestionarfinal(id_chestionar_final, chestionar_final, nume, creat_de, creat_la)VALUES(?, ?, ?, ?, ?)";

    private RowMapper<ChestionarFinal> chestionarFinalRowMapper = new RowMapper<ChestionarFinal>() {
        @Override
        public ChestionarFinal mapRow(ResultSet rs, int rowNum) throws SQLException {
            ChestionarFinal chestionarFinal = new ChestionarFinal();

            chestionarFinal.setIdChestionarFinal(rs.getInt("id_chestionar_final"));
            chestionarFinal.setChestionarFinal(rs.getString("chestionar_final"));
            chestionarFinal.setNume(rs.getString("nume"));
            chestionarFinal.setCreat_de(rs.getString("creat_de"));
            chestionarFinal.setCreat_la(rs.getTimestamp("creat_la"));

            return chestionarFinal;
        }
    };

    @Autowired
    public ChestionarFinalJDBCDAO(DriverManagerDataSource driverManagerDataSource) {
        setDataSource(driverManagerDataSource);
    }

    @Override
    public ChestionarFinal findByID(Integer id) {
        try {
            String findChestionarFinal = FIND_CHESTIONAR_FINAL_BY_ID + id;

            return getJdbcTemplate().queryForObject(findChestionarFinal, chestionarFinalRowMapper);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public Integer create(final ChestionarFinal entity) {
        JdbcTemplate jdbcTemplate = getJdbcTemplate();
        KeyHolder keyHolder = new GeneratedKeyHolder();

        PreparedStatementCreator psc = new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                PreparedStatement ps = con.prepareStatement(INSERT_INTO_CHESTIONAR_FINAL, Statement.RETURN_GENERATED_KEYS);

                ps.setInt(1, entity.getIdChestionarFinal());

                ps.setString(2, entity.getChestionarFinal());

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
    public Integer update(final ChestionarFinal entity) {
        return null;
    }

    @Override
    public Integer deleteByID(Integer id) {
        return getJdbcTemplate().update(DELETE_CHESTIONAR_FINAL_BY_ID, new Object[]{id});
    }

    @Override
    public List<ChestionarFinal> getAll() {
        List<ChestionarFinal> result = getJdbcTemplate().query(CHESTIONAR_FINAL, chestionarFinalRowMapper);

        if(result != null) {
            return result;
        } else {
            return null;
        }

    }
}
