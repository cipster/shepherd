package services;

import exceptions.DAOException;
import model.ControllerResult;
import model.dao.Cod1DAO;
import model.dto.Cod1;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import util.enums.DAOResult;

import java.util.Collections;
import java.util.List;

public class Cod1ServiceImpl implements Cod1Service {
	private final Log LOGGER = LogFactory.getLog(getClass());

	@Autowired
	private Cod1DAO cod1DAO;

	@Override
	public List<Cod1> fetchAllCod1() {
		List<Cod1> listaCod1;
		try {
			listaCod1 = cod1DAO.getAll();
		} catch (Exception e) {
			listaCod1 = Collections.emptyList();
		}
		return listaCod1;
	}

	@Override
	public ControllerResult modCod1(Cod1 cod1) {
		ControllerResult controllerResult;
		try {
			if ( cod1DAO.update(cod1) > DAOResult.ZERO ) {
				controllerResult = new ControllerResult(HttpStatus.OK.value(), "Codul " + cod1.getDenumire1() + " a fost modificat cu succes!");
			} else {
				throw new RuntimeException("Codul nu a fost modificat!");
			}

		} catch (RuntimeException e) {
			LOGGER.error(e.getMessage(), e);
			controllerResult = new ControllerResult(HttpStatus.INTERNAL_SERVER_ERROR.value(), e.getMessage());
		}
		return controllerResult;
	}

	@Override
	public ControllerResult addCod1(Cod1 cod1) throws DAOException {

		ControllerResult controllerResult;
		try {
			if ( cod1DAO.create(cod1) > DAOResult.ZERO ) {
				controllerResult = new ControllerResult(HttpStatus.OK.value(), "Codul " + cod1.getDenumire1() + " a fost adaugat cu succes in categoria Cod 1!");
			} else {
				throw new RuntimeException("Codul nu a fost ad?ugat!");
			}

		} catch (RuntimeException e) {
			LOGGER.error(e.getMessage(), e);
			controllerResult = new ControllerResult(HttpStatus.INTERNAL_SERVER_ERROR.value(), e.getMessage());
		}
		return controllerResult;
	}

	@Override
	public ControllerResult delCod1(Cod1 cod1) throws DAOException {
		ControllerResult controllerResult;
		try {
			if ( cod1DAO.deleteByID(cod1.getIdCod1()) > DAOResult.ZERO ) {
				controllerResult = new ControllerResult(HttpStatus.OK.value(), "Codul " + cod1.getDenumire1() + " a fost ?ters cu succes!");
			} else {
				throw new RuntimeException("Codul nu a fost ?ters!");
			}

		} catch (RuntimeException e) {
			LOGGER.error(e.getMessage(), e);
			controllerResult = new ControllerResult(HttpStatus.INTERNAL_SERVER_ERROR.value(), e.getMessage());
		}
		return controllerResult;
	}
}
