package model.dao;


import model.dto.RaportFinal;

import java.util.List;

public interface RaportFinalDAO extends GenericDAO<RaportFinal, Integer> {

    public List<RaportFinal> getAll();

}
