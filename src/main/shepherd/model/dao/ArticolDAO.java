package model.dao;


import model.dto.Articol;

import java.util.List;

public interface ArticolDAO extends GenericDAO<Articol, Integer> {

    public List<Articol> getAll();

}
