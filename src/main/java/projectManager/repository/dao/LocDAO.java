package projectManager.repository.dao;


import projectManager.repository.Loc;

import java.util.List;

public interface LocDAO extends GenericDAO<Loc, Integer> {

    public List<Loc> getAll();

}
