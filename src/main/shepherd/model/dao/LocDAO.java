package model.dao;


import model.domain.Loc;

import java.util.List;

public interface LocDAO extends GenericDAO<Loc, Integer> {

    public List<Loc> getAll();

}
