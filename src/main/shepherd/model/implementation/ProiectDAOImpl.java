package model.implementation;

import com.mysql.jdbc.Statement;
import model.dao.ProiectDAO;
import model.dto.Proiect;
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
import java.sql.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class ProiectDAOImpl extends JdbcDaoSupport implements ProiectDAO {

    private static final String LISTA_PROIECTE = "SELECT * FROM listaproiecte ";
    private static final String FIND_LISTA_PROIECTE_BY_ID_CLIENT = LISTA_PROIECTE + " WHERE id_client=:id_client";
    private static final String FIND_LISTA_PROIECTE_BY_ID = "SELECT * FROM listaproiecte WHERE id_proiect=";
    private static final String DELETE_LISTA_PROIECTE_BY_ID = "DELETE FROM listaproiecte WHERE id_proiect=?";
    private static final String INSERT_INTO_LISTA_PROIECTE = "INSERT INTO listaproiecte(id_proiect,nume_proiect,nr_proiect,an,id_client,id_alte_materiale,id_propunere,id_bd,id_chestionar_final,id_raport_final)VALUES(?,?,?,?,?,'0','0','0','0','0')";
    private static final String UPDATE_LISTA_PROIECTE = "UPDATE listaproiecte SET nume_proiect = ?, nr_proiect = ?, an = ?, id_client = ?  WHERE id_proiect = ?";
    private static final String UPDATE_ID_PROPUNERE = "UPDATE listaproiecte SET id_propunere = ? WHERE id_proiect = ?";
    private static final String UPDATE_ID_CHESTIONAR_FINAL = "UPDATE listaproiecte SET id_chestionar_final = ? WHERE id_proiect = ?";
    private static final String UPDATE_ID_RAPORT_FINAL = "UPDATE listaproiecte SET id_raport_final = ? WHERE id_proiect = ?";
    private static final String UPDATE_ID_BD = "UPDATE listaproiecte SET id_bd = ? WHERE id_proiect = ?";
    private static final String UPDATE_ID_ALTE_MATERIALE = "UPDATE listaproiecte SET id_alte_materiale = ? WHERE id_proiect = ?";


    private RowMapper<Proiect> listaProiecteParameterizedRowMapper = new RowMapper<Proiect>() {
        @Override
        public Proiect mapRow(ResultSet rs, int rowNum) throws SQLException {
            Proiect listaProiecte = new Proiect();

            listaProiecte.setIdProiect(rs.getInt("id_proiect"));
            listaProiecte.setNumeProiect(rs.getString("nume_proiect"));
            listaProiecte.setNrProiect(rs.getString("nr_proiect"));
            listaProiecte.setAn(rs.getString("an"));
            listaProiecte.setIdClient(rs.getInt("id_client"));
            listaProiecte.setIdPropunere(rs.getString("id_propunere"));
            listaProiecte.setIdChestionarFinal(rs.getString("id_chestionar_final"));
            listaProiecte.setIdRaportFinal(rs.getString("id_raport_final"));
            listaProiecte.setIdBd(rs.getString("id_bd"));
            listaProiecte.setIdAlteMateriale(rs.getString("id_alte_materiale"));

            return listaProiecte;
        }
    };

    @Autowired
    public ProiectDAOImpl(DataSource driverManagerDataSource) {
        setDataSource(driverManagerDataSource);
    }

    @Override
    public Proiect findByID(Integer id) {
        try {
            String query = FIND_LISTA_PROIECTE_BY_ID + id;

            return getJdbcTemplate().queryForObject(query, listaProiecteParameterizedRowMapper);
        } catch (DataAccessException e) {
            throw e;
        }
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public Integer create(final Proiect entity) {
        JdbcTemplate jdbcTemplate = getJdbcTemplate();
        KeyHolder keyHolder = new GeneratedKeyHolder();

        PreparedStatementCreator psc = new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                PreparedStatement ps = con.prepareStatement(INSERT_INTO_LISTA_PROIECTE, Statement.RETURN_GENERATED_KEYS);

                ps.setInt(1, entity.getIdProiect());

                ps.setString(2, entity.getNumeProiect());

                ps.setString(3, entity.getNrProiect());

                ps.setString(4, entity.getAn());

                ps.setInt(5, entity.getIdClient());

                logger.debug(ps.toString());
                return ps;
            }
        };
        jdbcTemplate.update(psc, keyHolder);

        return keyHolder.getKey().intValue();
    }

    @Override
    @Transactional(isolation = Isolation.REPEATABLE_READ)
    public Integer update(final Proiect entity) {
        JdbcTemplate jdbcTemplate = getJdbcTemplate();
        PreparedStatementCreator psc = new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {

                PreparedStatement ps = con.prepareStatement(UPDATE_LISTA_PROIECTE);

                ps.setString(1, entity.getNumeProiect());

                ps.setString(2, entity.getNrProiect());

                ps.setString(3, entity.getAn());

                ps.setInt(4, entity.getIdClient());

                ps.setInt(5, entity.getIdProiect());
                logger.debug(ps.toString());
                return ps;

            }
        };
        jdbcTemplate.update(psc);
        return entity.getIdProiect();

    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public Integer deleteByID(Integer id) {
        return getJdbcTemplate().update(DELETE_LISTA_PROIECTE_BY_ID, new Object[]{id});
    }

    @Override
    @Transactional(isolation = Isolation.READ_UNCOMMITTED)
    public List<Proiect> getAll() {

        List<Proiect> result = getJdbcTemplate().query(LISTA_PROIECTE, listaProiecteParameterizedRowMapper);

        if (result != null) {
            return result;
        } else {
            return null;
        }
    }

    @Override
    public List<Proiect> findProiecteByClient(Integer id_client) {
        try {
            Map<String, Object> args = new HashMap<String, Object>();
            args.put("id_client", id_client);
            StringBuilder findProiectByClient = new StringBuilder(FIND_LISTA_PROIECTE_BY_ID_CLIENT);

            return getJdbcTemplate().query(findProiectByClient.toString(), listaProiecteParameterizedRowMapper, args);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public Integer updatePropunere(final Integer id_propunere, final Integer id_proiect) {
        JdbcTemplate jdbcTemplate = getJdbcTemplate();
        PreparedStatementCreator psc = new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {

                String idP = findByID(id_proiect).getIdPropunere();
                idP += "," + id_propunere;
                PreparedStatement ps = con.prepareStatement(UPDATE_ID_PROPUNERE);

                if (id_propunere <= 0 || id_propunere.equals(null)) {
                    ps.setNull(1, Types.NULL);
                } else {
                    ps.setString(1, idP);
                }
                ps.setInt(2, id_proiect);
                logger.debug(ps.toString());
                return ps;

            }
        };
        jdbcTemplate.update(psc);
        return id_proiect;
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public Integer updateChestionarFinal(final Integer id_chestionar_final, final Integer id_proiect) {
        JdbcTemplate jdbcTemplate = getJdbcTemplate();
        PreparedStatementCreator psc = new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                String idCF = findByID(id_proiect).getIdChestionarFinal();
                idCF += "," + id_chestionar_final;
                PreparedStatement ps = con.prepareStatement(UPDATE_ID_CHESTIONAR_FINAL);

                if (id_chestionar_final <= 0 || id_chestionar_final.equals(null)) {
                    ps.setNull(1, Types.NULL);
                } else {
                    ps.setString(1, idCF);
                }
                ps.setInt(2, id_proiect);
                logger.debug(ps.toString());
                return ps;

            }
        };
        jdbcTemplate.update(psc);
        return id_proiect;
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public Integer updateRaportFinal(final Integer id_raport_final, final Integer id_proiect) {
        JdbcTemplate jdbcTemplate = getJdbcTemplate();
        PreparedStatementCreator psc = new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                String idRF = findByID(id_proiect).getIdRaportFinal();
                idRF += "," + id_raport_final;
                PreparedStatement ps = con.prepareStatement(UPDATE_ID_RAPORT_FINAL);

                if (id_raport_final <= 0 || id_raport_final.equals(null)) {
                    ps.setNull(1, Types.NULL);
                } else {
                    ps.setString(1, idRF);
                }
                ps.setInt(2, id_proiect);
                logger.debug(ps.toString());
                return ps;

            }
        };
        jdbcTemplate.update(psc);
        return id_proiect;
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public Integer updateBd(final Integer id_bd, final Integer id_proiect) {
        JdbcTemplate jdbcTemplate = getJdbcTemplate();
        PreparedStatementCreator psc = new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                String idBd = findByID(id_proiect).getIdBd();
                idBd += "," + id_bd;
                PreparedStatement ps = con.prepareStatement(UPDATE_ID_BD);

                if (id_bd <= 0 || id_bd.equals(null)) {
                    ps.setNull(1, Types.NULL);
                } else {
                    ps.setString(1, idBd);
                }
                ps.setInt(2, id_proiect);
                logger.debug(ps.toString());
                return ps;

            }
        };
        jdbcTemplate.update(psc);
        return id_proiect;
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public Integer updateAlteMateriale(final Integer id_alte_materiale, final Integer id_proiect) {
        JdbcTemplate jdbcTemplate = getJdbcTemplate();
        PreparedStatementCreator psc = new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                String idAM = findByID(id_proiect).getIdAlteMateriale();
                idAM += "," + id_alte_materiale;
                PreparedStatement ps = con.prepareStatement(UPDATE_ID_ALTE_MATERIALE);

                if (id_alte_materiale <= 0 || id_alte_materiale.equals(null)) {
                    ps.setNull(1, Types.NULL);
                } else {
                    ps.setString(1, idAM);
                }
                ps.setInt(2, id_proiect);
                logger.debug(ps.toString());
                return ps;

            }
        };
        jdbcTemplate.update(psc);
        return id_proiect;
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public Integer stergeAlteMateriale(final Integer id_alte_materiale, final Integer id_proiect) {
        JdbcTemplate jdbcTemplate = getJdbcTemplate();
        PreparedStatementCreator psc = new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                String idAM = findByID(id_proiect).getIdAlteMateriale();
                idAM = idAM.replace("," + id_alte_materiale.toString(), ",");
                PreparedStatement ps = con.prepareStatement(UPDATE_ID_ALTE_MATERIALE);

                if (id_alte_materiale <= 0 || id_alte_materiale.equals(null)) {
                    ps.setNull(1, Types.NULL);
                } else {
                    ps.setString(1, idAM);
                }
                ps.setInt(2, id_proiect);
                logger.debug(ps.toString());
                return ps;

            }
        };
        jdbcTemplate.update(psc);
        return id_proiect;
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public Integer stergePropunere(final Integer id_propunere, final Integer id_proiect) {
        JdbcTemplate jdbcTemplate = getJdbcTemplate();
        PreparedStatementCreator psc = new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                String idP = findByID(id_proiect).getIdPropunere();
                idP = idP.replace("," + id_propunere.toString(), ",");
                PreparedStatement ps = con.prepareStatement(UPDATE_ID_PROPUNERE);

                if (id_propunere <= 0 || id_propunere.equals(null)) {
                    ps.setNull(1, Types.NULL);
                } else {
                    ps.setString(1, idP);
                }
                ps.setInt(2, id_proiect);
                logger.debug(ps.toString());
                return ps;

            }
        };
        jdbcTemplate.update(psc);
        return id_proiect;
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public Integer stergeChestionar(final Integer id_chestionar, final Integer id_proiect) {
        JdbcTemplate jdbcTemplate = getJdbcTemplate();
        PreparedStatementCreator psc = new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                String idC = findByID(id_proiect).getIdChestionarFinal();
                idC = idC.replace("," + id_chestionar.toString(), ",");
                PreparedStatement ps = con.prepareStatement(UPDATE_ID_CHESTIONAR_FINAL);

                if (id_chestionar <= 0 || id_chestionar.equals(null)) {
                    ps.setNull(1, Types.NULL);
                } else {
                    ps.setString(1, idC);
                }
                ps.setInt(2, id_proiect);
                logger.debug(ps.toString());
                return ps;

            }
        };
        jdbcTemplate.update(psc);
        return id_proiect;
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public Integer stergeRaport(final Integer id_raport, final Integer id_proiect) {
        JdbcTemplate jdbcTemplate = getJdbcTemplate();
        PreparedStatementCreator psc = new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                String idR = findByID(id_proiect).getIdRaportFinal();
                idR = idR.replace("," + id_raport.toString(), ",");
                PreparedStatement ps = con.prepareStatement(UPDATE_ID_RAPORT_FINAL);

                if (id_raport <= 0 || id_raport.equals(null)) {
                    ps.setNull(1, Types.NULL);
                } else {
                    ps.setString(1, idR);
                }
                ps.setInt(2, id_proiect);
                logger.debug(ps.toString());
                return ps;

            }
        };
        jdbcTemplate.update(psc);
        return id_proiect;
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public Integer stergeBd(final Integer id_bd, final Integer id_proiect) {
        JdbcTemplate jdbcTemplate = getJdbcTemplate();
        PreparedStatementCreator psc = new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                String idP = findByID(id_proiect).getIdBd();
                idP = idP.replace("," + id_bd.toString(), ",");
                PreparedStatement ps = con.prepareStatement(UPDATE_ID_BD);

                if (id_bd <= 0 || id_bd.equals(null)) {
                    ps.setNull(1, Types.NULL);
                } else {
                    ps.setString(1, idP);
                }
                ps.setInt(2, id_proiect);
                logger.debug(ps.toString());
                return ps;

            }
        };
        jdbcTemplate.update(psc);
        return id_proiect;
    }

    @Override
    public boolean hasFiles(int id) {
        try {
            final String query = "SELECT * FROM proiecte.listaproiecte p WHERE p.id_proiect='" + id + "' AND p.id_alte_materiale REGEXP '^[A-Za-z1-9]+$' OR p.id_propunere REGEXP '^[A-Za-z1-9]+$'" +
                    " OR p.id_chestionar_final REGEXP '^[A-Za-z1-9]+$' OR p.id_raport_final REGEXP '^[A-Za-z1-9]+$' OR p.id_bd REGEXP '^[A-Za-z1-9]+$'";

            List<Proiect> proiectList = getJdbcTemplate().query(query, listaProiecteParameterizedRowMapper);
            return !proiectList.isEmpty();
        } catch (DataAccessException e) {
            throw e;
        }
    }
}
