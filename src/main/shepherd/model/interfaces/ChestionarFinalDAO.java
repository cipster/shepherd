package model.interfaces;

import model.dao.ChestionarFinal;

import java.util.List;


public interface ChestionarFinalDAO extends GenericDAO<ChestionarFinal, Integer> {

    public List<ChestionarFinal> getAll();
}
