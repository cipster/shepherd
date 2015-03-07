package model.dao;

import model.dto.ChestionarFinal;

import java.util.List;


public interface ChestionarFinalDAO extends GenericDAO<ChestionarFinal, Integer> {

    public List<ChestionarFinal> getAll();
}
