package model.interfaces;


import model.dao.Bd;

import java.util.List;

public interface BdDAO extends GenericDAO<Bd, Integer> {

    public List<Bd> getAll();

}
