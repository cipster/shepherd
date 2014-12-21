package projectManager.repository.dao;

import projectManager.repository.Propunere;

import java.util.List;


public interface PropunereDAO extends GenericDAO<Propunere, Integer> {

    public List<Propunere> getAll();

}
