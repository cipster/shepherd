package services;

import exceptions.DAOException;
import model.ControllerResult;
import model.dao.ArticolDAO;
import model.dao.Cod3DAO;
import model.dto.Articol;
import model.dto.Cod3;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import util.enums.DAOResult;

import java.util.Collections;
import java.util.List;

public class ArticolServiceImpl implements ArticolService {
    private final Log LOGGER = LogFactory.getLog(getClass());

    @Autowired
    private ArticolDAO articolDAO;
    @Qualifier("cod3DAO")
    @Autowired
    private Cod3DAO cod3DAO;


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
    public ControllerResult modArticol(Cod3 cod3) throws DAOException {
        ControllerResult controllerResult;
        try {
            if ( cod3DAO.update(cod3) > DAOResult.ZERO ) {
                controllerResult = new ControllerResult(HttpStatus.OK.value(), "Articolul " + cod3.getDenumire3() + " a fost modificat cu succes!");
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
            if ( articolDAO.deleteByID(cod3.getIdCod3()) > DAOResult.ZERO ) {
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
}
