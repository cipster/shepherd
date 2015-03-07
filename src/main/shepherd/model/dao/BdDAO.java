package model.dao;


import model.dto.Bd;

import java.util.List;

public interface BdDAO extends GenericDAO<Bd, Integer> {

    public List<Bd> getAll();

}
