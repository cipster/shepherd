package projectManager.repository.dao;


import projectManager.repository.Cod3;

import java.util.List;

public interface Cod3DAO extends GenericDAO<Cod3, Integer> {

    public List<Cod3> getAll();

}
