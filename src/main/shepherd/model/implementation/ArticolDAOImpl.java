package model.implementation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import model.dto.Articol;
import model.dao.ArticolDAO;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by Ciprian on 12/14/2014.
 * Project Raindrop
 */
public class ArticolDAOImpl extends JdbcDaoSupport implements ArticolDAO {
    private RowMapper<Articol> rowMapper = new RowMapper<Articol>() {
        @Override
        public Articol mapRow(ResultSet rs, int rowNum) throws SQLException {
            Articol articol = new Articol();

            articol.setIdCod3(rs.getInt("id_cod_3"));
            articol.setDenumire1(rs.getString("denumire_1"));
            articol.setDenumire2(rs.getString("denumire_2"));
            articol.setDenumire3(rs.getString("denumire_3"));
            articol.setBarcode(rs.getString("barcode"));
            articol.setDetalii(rs.getString("detalii"));
            articol.setPretAchizitie(rs.getString("pret_achizitie"));
            articol.setStare(rs.getInt("stare"));
            articol.setIdLoc(rs.getInt("id_loc"));
            articol.setDataAdaugare(rs.getString("data_adaugare"));
            articol.setDataRecuperare(rs.getString("data_recuperare"));
            articol.setDataPrimire(rs.getString("data_primire"));
            articol.setModificatDe(rs.getString("modificat_de"));
            articol.setDetaliiRecuperare(rs.getString("detalii_recuperare"));

            return articol;
        }
    };

    @Autowired
    public ArticolDAOImpl(DataSource driverManagerDataSource) {
        setDataSource(driverManagerDataSource);
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public List<Articol> getAll() {
        final String query = "SELECT * FROM proiecte.articole";
        try {
            return getJdbcTemplate().query(query, rowMapper);
        } catch (DataAccessException ex){
            ex.printStackTrace();
            return null;
        }
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public Articol findByID(Integer id) {
        try {
            String query = "SELECT * FROM proiecte.articole WHERE id_cod_3=" + id;

            return getJdbcTemplate().queryForObject(query, rowMapper);
        } catch (DataAccessException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Integer create(final Articol entity) {
        return null;
    }

    @Override
    public Integer update(final Articol entity) {
       return null;
    }

    @Override
    public Integer deleteByID(Integer id) {
        return null;
    }
}
