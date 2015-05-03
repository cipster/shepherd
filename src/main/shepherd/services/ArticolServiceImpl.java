package services;

import exceptions.DAOException;
import model.ControllerResult;
import model.dao.*;
import model.domain.Articol;
import model.domain.Cod3;
import model.domain.Evidenta;
import model.domain.EvidentaInventar;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import util.enums.DAOResult;

import java.util.Collections;
import java.util.List;

public class ArticolServiceImpl implements ArticolService {
    private final Log LOGGER = LogFactory.getLog(getClass());

    @Autowired
    private ArticolDAO articolDAO;
    @Autowired
    private Cod3DAO cod3DAO;
    @Autowired
    private EvidentaDAO evidentaDAO;
    @Autowired
    private EvidentaInventarDAO evidentaInventarDAO;
    @Autowired
    private PersoanaDAO persoanaDAO;


    @Override
    public List<Articol> fetchAllArticole() {
        List<Articol> articoleList;
        try {
            articoleList = articolDAO.getAll();
        } catch (Exception e) {
            articoleList = Collections.emptyList();
        }
        return articoleList;
    }

    @Override
    public List<Cod3> fetchAllCod3() {
        List<Cod3> articoleList;
        try {
            articoleList = cod3DAO.getAll();
        } catch (Exception e) {
            articoleList = Collections.emptyList();
        }
        return articoleList;
    }

    @Override
    public ControllerResult addArticol(Cod3 cod3) throws DAOException {
        ControllerResult controllerResult;
        try {
            if ( cod3DAO.create(cod3) > DAOResult.ZERO ) {
                controllerResult = new ControllerResult(HttpStatus.OK.value(), "Articolul " + cod3.getDenumire3() + " a fost adăugat cu succes!");
            } else {
                throw new RuntimeException("Articolul nu a fost adăugat!");
            }

        } catch (RuntimeException e) {
            LOGGER.error(e.getMessage(), e);
            controllerResult = new ControllerResult(HttpStatus.INTERNAL_SERVER_ERROR.value(), e.getMessage());
        }
        return controllerResult;
    }

    @Override
    @Transactional(isolation = Isolation.SERIALIZABLE)
    public ControllerResult modArticol(Cod3 cod3) throws DAOException {
        org.springframework.security.core.userdetails.User user = (org.springframework.security.core.userdetails.User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = user.getUsername(); //get logged in username
        ControllerResult controllerResult;
        EvidentaInventar evidentaInventar;
        String detalii = "Modificat de administrator: " + username;
        int idCod3 = cod3DAO.findByID(cod3.getCod3()).getCod3();
        try {
            evidentaInventar = evidentaInventarDAO.findByIdArticol(String.valueOf(idCod3));
            cod3.setDetaliiRecuperare(detalii);
            if ( cod3DAO.update(cod3) > DAOResult.ZERO ) {
                controllerResult = new ControllerResult(HttpStatus.OK.value(), "Articolul " + cod3.getDenumire3() + " a fost modificat cu succes!");
                if(evidentaInventar != null) {
                    evidentaInventarDAO.update(evidentaInventar);
                }
            } else {
                throw new RuntimeException("Articolul nu a fost modificat!");
            }
        } catch (RuntimeException e) {
            LOGGER.error(e.getMessage(), e);
            controllerResult = new ControllerResult(HttpStatus.INTERNAL_SERVER_ERROR.value(), e.getMessage());
        }
        return controllerResult;
    }

    @Override
    public ControllerResult delArticol(Cod3 cod3) throws DAOException {
        ControllerResult controllerResult;
        try {
            if ( cod3DAO.deleteByID(cod3.getCod3()) > DAOResult.ZERO ) {
                controllerResult = new ControllerResult(HttpStatus.OK.value(), "Articolul " + cod3.getDenumire3() + " a fost şters cu succes!");
            } else {
                throw new RuntimeException("Articolul nu a fost şters!");
            }

        } catch (RuntimeException e) {
            LOGGER.error(e.getMessage(), e);
            controllerResult = new ControllerResult(HttpStatus.INTERNAL_SERVER_ERROR.value(), e.getMessage());
        }
        return controllerResult;
    }

    @Override
    public List<Evidenta> fetchEvidentaByBarcode(String barcode) {
        List<Evidenta> evidenta;
        try {
            evidenta = evidentaDAO.findEvidentaByBarcode(barcode);
        } catch (Exception e) {
            evidenta = Collections.emptyList();
        }
        return evidenta;

    }
}
