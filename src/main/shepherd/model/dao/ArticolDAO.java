package model.dao;


import model.domain.Articol;

import java.util.List;

public interface ArticolDAO extends GenericDAO<Articol, Integer> {

    public List<Articol> getAll();

    public List<Articol> getOnlyMine(int idPersoana);
}
