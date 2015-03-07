package model.dao;

import model.dto.Propunere;

import java.util.List;


public interface PropunereDAO extends GenericDAO<Propunere, Integer> {

    public List<Propunere> getAll();

}
