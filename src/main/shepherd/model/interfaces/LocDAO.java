package model.interfaces;


import model.dao.Loc;

import java.util.List;

public interface LocDAO extends GenericDAO<Loc, Integer> {

    public List<Loc> getAll();

}
