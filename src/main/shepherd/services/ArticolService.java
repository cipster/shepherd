package services;

import exceptions.DAOException;
import model.ControllerResult;
import model.dto.Articol;
import model.dto.Cod3;
import model.dto.Loc;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ArticolService {

    List<Articol> fetchAllArticole();

    List<Cod3> fetchAllCod3();

    ControllerResult addArticol(Cod3 articol) throws DAOException;

    ControllerResult modArticol(Cod3 articol) throws DAOException;

    ControllerResult delArticol(Cod3 articol) throws DAOException;
}
