package model.dao;

import model.domain.ChestionarFinal;

import java.util.List;


public interface ChestionarFinalDAO extends GenericDAO<ChestionarFinal, Integer> {

    public List<ChestionarFinal> getAll();
}
