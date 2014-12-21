package projectManager.repository.dao;


import projectManager.repository.Articole;
import projectManager.repository.Cod3;

import java.util.List;

public interface ArticoleDAO extends GenericDAO<Articole, Integer> {

    public List<Articole> getAll();

}
