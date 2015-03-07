package model.interfaces;

import model.dao.Propunere;

import java.util.List;


public interface PropunereDAO extends GenericDAO<Propunere, Integer> {

    public List<Propunere> getAll();

}
