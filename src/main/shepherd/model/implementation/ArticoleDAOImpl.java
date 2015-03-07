package model.implementation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import model.dao.Articole;
import model.interfaces.ArticoleDAO;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by Ciprian on 12/14/2014.
 * Project Raindrop
 */
public class ArticoleDAOImpl extends JdbcDaoSupport implements ArticoleDAO {
    private RowMapper<Articole> rowMapper = new RowMapper<Articole>() {
        @Override
        public Articole mapRow(ResultSet rs, int rowNum) throws SQLException {
            Articole articole = new Articole();

            articole.setIdCod3(rs.getInt("id_cod_3"));
            articole.setDenumire1(rs.getString("denumire_1"));
            articole.setDenumire2(rs.getString("denumire_2"));
            articole.setDenumire3(rs.getString("denumire_3"));
            articole.setBarcode(rs.getString("barcode"));
            articole.setDetalii(rs.getString("detalii"));
            articole.setPretAchizitie(rs.getString("pret_achizitie"));
            articole.setStare(rs.getInt("stare"));
            articole.setIdLoc(rs.getInt("id_loc"));
            articole.setDataAdaugare(rs.getString("data_adaugare"));
            articole.setDataRecuperare(rs.getString("data_recuperare"));
            articole.setDataPrimire(rs.getString("data_primire"));
            articole.setModificatDe(rs.getString("modificat_de"));
            articole.setDetaliiRecuperare(rs.getString("detalii_recuperare"));

            return articole;
        }
    };

    @Autowired
    public ArticoleDAOImpl(DataSource driverManagerDataSource) {
        setDataSource(driverManagerDataSource);
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public List<Articole> getAll() {
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
    public Articole findByID(Integer id) {
        try {
            String query = "SELECT * FROM proiecte.articole WHERE id_cod_3=" + id;

            return getJdbcTemplate().queryForObject(query, rowMapper);
        } catch (DataAccessException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Integer create(final Articole entity) {
        return null;
    }

    @Override
    public Integer update(final Articole entity) {
       return null;
    }

    @Override
    public Integer deleteByID(Integer id) {
        return null;
    }
}
