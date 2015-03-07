package model.interfaces;


import model.dao.Articole;

import java.util.List;

public interface ArticoleDAO extends GenericDAO<Articole, Integer> {

    public List<Articole> getAll();

}
