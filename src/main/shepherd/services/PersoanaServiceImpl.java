package services;

import exceptions.DAOException;
import model.ControllerResult;
import model.dao.PersoanaDAO;
import model.domain.Persoana;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import util.enums.DAOResult;

import java.util.Collections;
import java.util.List;

/**
 * Created by Ciprian on 3/12/2015.
 * Project Shepherd
 */
public class PersoanaServiceImpl implements PersoanaService {
	private final Log LOGGER = LogFactory.getLog(getClass());

	@Autowired
	private PersoanaDAO persoanaDAO;

	@Override
	public List<Persoana> fetchAllPersoane() {
		List<Persoana> listaPersoane;
		try {
			listaPersoane = persoanaDAO.getAll();
		} catch (Exception e) {
			listaPersoane = Collections.emptyList();
		}
		return listaPersoane;
	}

	@Override
	public ControllerResult addPersoana(Persoana persoana) throws DAOException {
		ControllerResult controllerResult;
		try {
			if ( persoanaDAO.create(persoana) > DAOResult.ZERO ) {
				controllerResult = new ControllerResult(HttpStatus.OK.value(), "Persoana " + persoana.getNume() + " a fost adaugată cu succes!");
			} else {
				throw new RuntimeException("Persoana nu a fost adăugată!");
			}

		} catch (RuntimeException e) {
			LOGGER.error(e.getMessage(), e);
			controllerResult = new ControllerResult(HttpStatus.INTERNAL_SERVER_ERROR.value(), e.getMessage());
		}
		return controllerResult;
	}

	@Override
	public ControllerResult modPersoana(Persoana persoana) throws DAOException {
		ControllerResult controllerResult;
		try {
			if ( persoanaDAO.update(persoana) > DAOResult.ZERO ) {
				controllerResult = new ControllerResult(HttpStatus.OK.value(), "Persoana " + persoana.getNume() + " a fost modificată cu succes!");
			} else {
				throw new RuntimeException("Persoana nu a fost modificată!");
			}

		} catch (RuntimeException e) {
			LOGGER.error(e.getMessage(), e);
			controllerResult = new ControllerResult(HttpStatus.INTERNAL_SERVER_ERROR.value(), e.getMessage());
		}
		return controllerResult;
	}

	@Override
	public ControllerResult delPersoana(Persoana persoana) throws DAOException {
		ControllerResult controllerResult;
		try {
			if ( persoanaDAO.deleteByID(persoana.getIdPersoana()) > DAOResult.ZERO ) {
				controllerResult = new ControllerResult(HttpStatus.OK.value(), "Persoana " + persoana.getNume() + " a fost ştearsă cu succes!");
			} else {
				throw new RuntimeException("Persoana nu a fost ştearsă!");
			}

		} catch (RuntimeException e) {
			LOGGER.error(e.getMessage(), e);
			controllerResult = new ControllerResult(HttpStatus.INTERNAL_SERVER_ERROR.value(), e.getMessage());
		}
		return controllerResult;
	}
}
