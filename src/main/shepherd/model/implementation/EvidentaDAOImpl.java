package model.implementation;

import model.dao.EvidentaDAO;
import model.domain.Evidenta;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class EvidentaDAOImpl extends JdbcDaoSupport implements EvidentaDAO {

    private RowMapper<Evidenta> rowMapper = new RowMapper<Evidenta>() {
        @Override
        public Evidenta mapRow(ResultSet rs, int rowNum) throws SQLException {
            Evidenta evidenta = new Evidenta();

            evidenta.setIdCod3(rs.getInt("id_cod_3"));
            evidenta.setNume(rs.getString("nume"));
            evidenta.setBarcode(rs.getString("barcode"));
            evidenta.setDenumireLoc(rs.getString("denumire_loc"));
            evidenta.setDenumireLocRecuperare(rs.getString("denumire_loc_recuperare"));
            evidenta.setDataPreluarii(rs.getString("data_preluarii"));
            evidenta.setDataRecuperarii(rs.getString("data_recuperarii"));
            evidenta.setDetalii(rs.getString("detalii"));
            evidenta.setDetaliiRecuperare(rs.getString("detalii_recuperare"));

            return evidenta;
        }
    };

    @Autowired
    public EvidentaDAOImpl(DataSource driverManagerDataSource) {
        setDataSource(driverManagerDataSource);
    }

    @Override
    public List<Evidenta> getAll() {
        final String query = "SELECT * FROM proiecte.evidenta";
        try {
            return getJdbcTemplate().query(query, rowMapper);
        } catch (DataAccessException ex){
            logger.error(ex);
            return null;
        }
    }

    @Override
    public Evidenta findByIdArticol(String idArticol) {
        throw new NotImplementedException();
    }

    @Override
    public List<Evidenta> findEvidentaByBarcode(String barcode) {
        final String query = "SELECT * FROM proiecte.evidenta WHERE barcode='" + barcode + "' ORDER BY data_preluarii DESC ";
        try {
            return getJdbcTemplate().query(query, rowMapper);
        } catch (DataAccessException ex){
            logger.error(ex);
            return null;
        }
    }

    @Override
    public Evidenta findByID(Long id) {
       throw new NotImplementedException();
    }

    @Override
    public Long create(final Evidenta entity) {
        throw new NotImplementedException();
    }

    @Override
    public Integer update(final Evidenta entity) {
        throw new NotImplementedException();
    }

    @Override
    public Integer deleteByID(Long id) {
        throw new NotImplementedException();
    }
}
