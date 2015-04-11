package services;

import exceptions.DAOException;
import model.ControllerResult;
import model.dto.Loc;
import model.dto.Persoana;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Ciprian on 4/4/2015.
 *
 *         Shepherd
 */
@Service
public interface LocService {

    List<Loc> fetchAllLocuri();

    ControllerResult addLoc(Loc loc) throws DAOException;

    ControllerResult modLoc(Loc loc) throws DAOException;

    ControllerResult delLoc(Loc loc) throws DAOException;
}
