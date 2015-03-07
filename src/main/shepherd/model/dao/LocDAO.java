package model.dao;


import model.dto.Loc;

import java.util.List;

public interface LocDAO extends GenericDAO<Loc, Integer> {

    public List<Loc> getAll();

}
