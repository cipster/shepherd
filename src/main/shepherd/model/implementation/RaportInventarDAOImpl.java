package model.implementation;

import model.dao.RaportInventarDAO;
import model.domain.RaportInventar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Component;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

@Component
public class RaportInventarDAOImpl extends JdbcDaoSupport implements RaportInventarDAO {
    private RowMapper<RaportInventar> rowMapper = new RowMapper<RaportInventar>() {
        @Override
        public RaportInventar mapRow(ResultSet rs, int rowNum) throws SQLException {
            RaportInventar entity = new RaportInventar();

            entity.setCod1(rs.getInt("cod1"));
            entity.setCat1(rs.getString("cat1"));
            entity.setCod2(rs.getInt("cod2"));
            entity.setCat2(rs.getString("cat2"));
            if (rs.getString("denumire") != null) {
                entity.setDenumire(rs.getString("denumire"));
            } else {
                entity.setDenumire(rs.getString("denumire"));
            }
            entity.setBarcode(rs.getString("barcode"));
            if (rs.getString("detalii") != null) {
                entity.setDetalii(rs.getString("detalii"));
            } else {
                entity.setDetalii("");
            }
            entity.setIdPersoana(rs.getInt("id_persoana"));
            if (rs.getString("nume") != null) {
                entity.setNume(rs.getString("nume"));
            } else {
                entity.setNume("");
            }
            entity.setIdLoc(rs.getInt("id_loc"));
            if (rs.getString("denumire_loc") != null) {
                entity.setDenumireLoc(rs.getString("denumire_loc"));
            } else {
                entity.setDenumireLoc("");

            }
            if (rs.getString("data_recuperare") != null) {
                entity.setDataPrimire(rs.getString("data_recuperare"));
            } else if (rs.getString("data_primire") != null) {
                entity.setDataPrimire(rs.getString("data_primire"));
            } else {
                entity.setDataPrimire("");
            }
            if (rs.getString("detalii_recuperare") != null) {
                entity.setDetaliiRecuperare(rs.getString("detalii_recuperare"));
            } else if (rs.getString("detalii_preluare") != null) {
                entity.setDetaliiRecuperare(rs.getString("detalii_preluare"));
            } else {
                entity.setDetaliiRecuperare("");
            }

            return entity;
        }
    };

    @Autowired
    public RaportInventarDAOImpl(DataSource driverManagerDataSource) {
        setDataSource(driverManagerDataSource);
    }

    @Override
    public List<RaportInventar> getAll() {
        final String query = "SELECT * FROM proiecte.raport_inventar";
        try {
            return getJdbcTemplate().query(query, rowMapper);
        } catch (DataAccessException ex) {
            ex.printStackTrace();
            return Collections.emptyList();
        }
    }

    @Override
    public List<RaportInventar> getBy(int[] idLoc, int[] idPersoana, int[] cod1, int[] cod2, String orderBy) {
        String query = "SELECT * FROM proiecte.raport_inventar r WHERE 1=1 ";
        if (idLoc != null && idLoc.length > 0) {
            StringBuilder loc = new StringBuilder(idLoc.length);
            for (int i = 0; i < idLoc.length; i++) {
                if (i == 0) {
                    loc.append(idLoc[i]);
                } else {
                    loc.append(",").append(idLoc[i]);
                }
            }
            query += " AND r.id_loc in (" + loc + ")";
        }
        if (idPersoana != null && idPersoana.length > 0) {
            StringBuilder persoana = new StringBuilder(idPersoana.length);
            for (int i = 0; i < idPersoana.length; i++) {
                if (i == 0) {
                    persoana.append(idPersoana[i]);
                } else {
                    persoana.append(",").append(idPersoana[i]);
                }
            }
            query += " AND r.id_persoana in (" + persoana + ")";
        }
        if (cod1 != null && cod1.length > 0) {
            StringBuilder codUnu = new StringBuilder(cod1.length);
            for (int i = 0; i < cod1.length; i++) {
                if (i == 0) {
                    codUnu.append(cod1[i]);
                } else {
                    codUnu.append(",").append(cod1[i]);
                }
            }
            query += " AND r.cod1 in (" + codUnu + ")";
        }
        if (cod2 != null && cod2.length > 0) {
            StringBuilder codDoi = new StringBuilder(cod2.length);
            for (int i = 0; i < cod2.length; i++) {
                if (i == 0) {
                    codDoi.append(cod2[i]);
                } else {
                    codDoi.append(",").append(cod2[i]);
                }
            }
            query += " AND r.cod2 in (" + codDoi + ")";
        }
        if (orderBy != null && !orderBy.isEmpty()) {
            query += " ORDER BY r." + orderBy;
        }

        try {
            return getJdbcTemplate().query(query, rowMapper);
        } catch (DataAccessException ex) {
            ex.printStackTrace();
            return Collections.emptyList();
        }
    }

    @Override
    public RaportInventar findByID(Integer integer) throws DataAccessException {
        throw new NotImplementedException();
    }

    @Override
    public Integer create(RaportInventar entity) throws DataAccessException {
        throw new NotImplementedException();
    }

    @Override
    public Integer update(RaportInventar entity) throws DataAccessException {
        throw new NotImplementedException();
    }

    @Override
    public Integer deleteByID(Integer integer) throws DataAccessException {
        throw new NotImplementedException();
    }
}
