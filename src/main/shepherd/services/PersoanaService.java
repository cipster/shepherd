package services;

import exceptions.DAOException;
import model.ControllerResult;
import model.dto.Persoana;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Ciprian on 3/12/2015.
 * Project Shepherd
 */
@Service
public interface PersoanaService {

	List<Persoana> fetchAllPersoane();

	ControllerResult addPersoana(Persoana persoana) throws DAOException;

	ControllerResult modPersoana(Persoana persoana) throws DAOException;

	ControllerResult delPersoana(Persoana persoana) throws DAOException;
}
