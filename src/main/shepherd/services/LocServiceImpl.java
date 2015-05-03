package services;

import exceptions.DAOException;
import model.ControllerResult;
import model.dao.LocDAO;
import model.domain.Loc;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import util.enums.DAOResult;

import java.util.Collections;
import java.util.List;

public class LocServiceImpl implements LocService {
    private final Log LOGGER = LogFactory.getLog(getClass());

    @Autowired
    private LocDAO locDAO;

    @Override
    public List<Loc> fetchAllLocuri() {
        List<Loc> listaLocuri;
        try {
            listaLocuri = locDAO.getAll();
        } catch (Exception e) {
            listaLocuri = Collections.emptyList();
        }
        return listaLocuri;
    }

    @Override
    public ControllerResult addLoc(Loc loc) throws DAOException {

        ControllerResult controllerResult;
        try {
            if ( locDAO.create(loc) > DAOResult.ZERO ) {
                controllerResult = new ControllerResult(HttpStatus.OK.value(), "Locul " + loc.getDenumireLoc() + " a fost adaugat cu succes!");
            } else {
                throw new RuntimeException("Locul nu a fost ad?ugat!");
            }

        } catch (RuntimeException e) {
            LOGGER.error(e.getMessage(), e);
            controllerResult = new ControllerResult(HttpStatus.INTERNAL_SERVER_ERROR.value(), e.getMessage());
        }
        return controllerResult;
    }

    @Override
    public ControllerResult modLoc(Loc loc) throws DAOException {
        ControllerResult controllerResult;
        try {
            if ( locDAO.update(loc) > DAOResult.ZERO ) {
                controllerResult = new ControllerResult(HttpStatus.OK.value(), "Locul " + loc.getDenumireLoc() + " a fost modificat cu succes!");
            } else {
                throw new RuntimeException("Locul nu a fost modificat!");
            }

        } catch (RuntimeException e) {
            LOGGER.error(e.getMessage(), e);
            controllerResult = new ControllerResult(HttpStatus.INTERNAL_SERVER_ERROR.value(), e.getMessage());
        }
        return controllerResult;
    }

    @Override
    public ControllerResult delLoc(Loc loc) throws DAOException {
        ControllerResult controllerResult;
        try {
            if ( locDAO.deleteByID(loc.getIdLoc()) > DAOResult.ZERO ) {
                controllerResult = new ControllerResult(HttpStatus.OK.value(), "Locul " + loc.getDenumireLoc() + " a fost şters cu succes!");
            } else {
                throw new RuntimeException("Locul nu a fost şters!");
            }

        } catch (RuntimeException e) {
            LOGGER.error(e.getMessage(), e);
            controllerResult = new ControllerResult(HttpStatus.INTERNAL_SERVER_ERROR.value(), e.getMessage());
        }
        return controllerResult;
    }
}
