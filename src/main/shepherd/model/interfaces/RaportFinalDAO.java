package model.interfaces;


import model.dao.RaportFinal;

import java.util.List;

public interface RaportFinalDAO extends GenericDAO<RaportFinal, Integer> {

    public List<RaportFinal> getAll();

}
