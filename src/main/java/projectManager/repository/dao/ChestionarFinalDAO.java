package projectManager.repository.dao;

import projectManager.repository.ChestionarFinal;

import java.util.List;


public interface ChestionarFinalDAO extends GenericDAO<ChestionarFinal, Integer> {

    public List<ChestionarFinal> getAll();
}
