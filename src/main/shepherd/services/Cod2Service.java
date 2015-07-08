package services;

import exceptions.DAOException;
import model.ControllerResult;
import model.domain.Cod2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface Cod2Service {

	List<Cod2> fetchAllCod2();

	ControllerResult modCod2(Cod2 cod2);

	ControllerResult addCod2(Cod2 cod2) throws DAOException;

	ControllerResult delCod2(Cod2 cod2) throws DAOException;
}
