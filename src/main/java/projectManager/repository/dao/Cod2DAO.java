package projectManager.repository.dao;


import projectManager.repository.Cod2;

import java.util.List;

public interface Cod2DAO extends GenericDAO<Cod2, Integer> {

    public List<Cod2> getAll();

}
