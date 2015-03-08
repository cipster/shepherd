package services;

import exceptions.DAOException;
import model.dao.ProiectDAO;
import model.dto.Proiect;
import org.springframework.beans.factory.annotation.Autowired;
import util.enums.DAOResult;

/**
 * Created by Ciprian on 3/8/2015.
 * Project Shepherd
 */

public class ProiectServiceImpl implements ProiectService {

    @Autowired
    private ProiectDAO proiectDAO;

    @Override
    public Proiect createProject(Proiect proiect) throws RuntimeException {
        if (paramsAreEmpty(proiect, Boolean.TRUE))
            throw new IllegalArgumentException("Parameters cannot be null!");
        if (proiectDAO.create(proiect) > DAOResult.ZERO)
            return proiect;
        else
            throw new DAOException("Project was not created!");
    }

    @Override
    public Proiect modifyProject(Proiect proiect) throws RuntimeException {
        if (paramsAreEmpty(proiect))
            throw new IllegalArgumentException("Parameters cannot be null!");
        if (proiectDAO.update(proiect) > DAOResult.ZERO)
            return proiect;
        else
            throw new DAOException("Project was not updated!");
    }

	@Override
	public boolean deleteProject(String idProiect) throws RuntimeException {
		int id = Integer.parseInt(idProiect);
		if(isInvalidParam(id))
			throw new IllegalArgumentException("Project ID cannot be null!");
		else
		if(proiectDAO.deleteByID(id) > DAOResult.ZERO)
			return true;
		else
			return false;
	}

	private boolean paramsAreEmpty(Proiect proiect) {
        if (proiect.getNumeProiect().isEmpty() || proiect.getNrProiect().isEmpty() || proiect.getAn().isEmpty() || proiect.getIdClient() == 0) {
            return true;
        }
        return false;
    }

    private boolean paramsAreEmpty(Proiect proiect, boolean creating) {
        if (creating)
            return paramsAreEmpty(proiect);
        else
            return (paramsAreEmpty(proiect) && proiect.getIdProiect() == 0);
    }

	private boolean isInvalidParam(int param){
		if ( param == 0 )
			return true;
		else
			return false;
	}
}
