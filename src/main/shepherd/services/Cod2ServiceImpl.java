package services;

import exceptions.DAOException;
import model.ControllerResult;
import model.dao.Cod2DAO;
import model.domain.Cod2;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import util.enums.DAOResult;

import java.util.Collections;
import java.util.List;

public class Cod2ServiceImpl implements Cod2Service {
	private final Log LOGGER = LogFactory.getLog(getClass());

	@Autowired
	private Cod2DAO cod2DAO;

	@Override
	public List<Cod2> fetchAllCod2() {
		List<Cod2> listaCod2;
		try {
			listaCod2 = cod2DAO.getAll();
		} catch (Exception e) {
			listaCod2 = Collections.emptyList();
		}
		return listaCod2;
	}

	@Override
	public ControllerResult modCod2(Cod2 cod2) {
		ControllerResult controllerResult;
		try {
			if ( cod2DAO.update(cod2) > DAOResult.ZERO ) {
				controllerResult = new ControllerResult(HttpStatus.OK.value(), "Codul " + cod2.getDenumire2() + " a fost modificat cu succes!");
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
	public ControllerResult addCod2(Cod2 cod2) throws DAOException {

		ControllerResult controllerResult;
		try {
			if ( cod2DAO.create(cod2) > DAOResult.ZERO ) {
				controllerResult = new ControllerResult(HttpStatus.OK.value(), "Codul " + cod2.getDenumire2() + " a fost ad&#359;ugat cu succes in categoria Cod 1!");
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
	public ControllerResult delCod2(Cod2 cod2) throws DAOException {
		ControllerResult controllerResult;
		try {
			if ( cod2DAO.deleteByID(cod2.getIdCod2()) > DAOResult.ZERO ) {
				controllerResult = new ControllerResult(HttpStatus.OK.value(), "Codul " + cod2.getDenumire2() + " a fost &#351;ters cu succes!");
			} else {
				throw new RuntimeException("Codul nu a fost &#351;ters!");
			}

		} catch (RuntimeException e) {
			LOGGER.error(e.getMessage(), e);
			controllerResult = new ControllerResult(HttpStatus.INTERNAL_SERVER_ERROR.value(), e.getMessage());
		}
		return controllerResult;
	}
}
