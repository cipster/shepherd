package projectManager.repository.dao;


import projectManager.repository.RaportFinal;

import java.util.List;

public interface RaportFinalDAO extends GenericDAO<RaportFinal, Integer> {

    public List<RaportFinal> getAll();

}
