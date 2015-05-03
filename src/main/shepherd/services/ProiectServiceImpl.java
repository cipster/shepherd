package services;

import exceptions.DAOException;
import exceptions.ProjectHasFilesException;
import model.dao.ProiectDAO;
import model.domain.Proiect;
import org.springframework.beans.factory.annotation.Autowired;
import util.enums.DAOResult;

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
		if(isInvalidParam(id)) {
            throw new IllegalArgumentException("Project ID cannot be null!");
        }
        if(projectHasFiles(id)) {
            throw new ProjectHasFilesException("Proiectul are fisiere salvate. Stergeti mai intai fisierele si apoi proiectul!");
        }
            return proiectDAO.deleteByID(id) > DAOResult.ZERO;

	}

	private boolean paramsAreEmpty(Proiect proiect) {
        return proiect.getNumeProiect().isEmpty() || proiect.getNrProiect().isEmpty() || proiect.getAn().isEmpty() || proiect.getIdClient() == 0;
    }

    private boolean paramsAreEmpty(Proiect proiect, boolean creating) {
        if (creating)
            return paramsAreEmpty(proiect);
        else
            return (paramsAreEmpty(proiect) && proiect.getIdProiect() == 0);
    }

	private boolean isInvalidParam(int param){
        return param <= 0;
	}

    private boolean projectHasFiles(int id){
        return proiectDAO.hasFiles(id);
    }
}
