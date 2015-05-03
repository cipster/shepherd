package model.dao;

import model.domain.Propunere;

import java.util.List;


public interface PropunereDAO extends GenericDAO<Propunere, Integer> {

    public List<Propunere> getAll();

}
