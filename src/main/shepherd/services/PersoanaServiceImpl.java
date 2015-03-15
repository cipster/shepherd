package services;

import exceptions.DAOException;
import model.ControllerResult;
import model.dao.PersoanaDAO;
import model.dto.Persoana;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import util.enums.DAOResult;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Ciprian on 3/12/2015.
 * Project Raindrop
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
			listaPersoane = new ArrayList<>();
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
}
