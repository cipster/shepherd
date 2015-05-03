package services;

import exceptions.DAOException;
import model.ControllerResult;
import model.domain.Loc;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface LocService {

    List<Loc> fetchAllLocuri();

    ControllerResult addLoc(Loc loc) throws DAOException;

    ControllerResult modLoc(Loc loc) throws DAOException;

    ControllerResult delLoc(Loc loc) throws DAOException;
}
