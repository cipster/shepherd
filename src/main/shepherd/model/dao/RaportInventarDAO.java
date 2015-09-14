package model.dao;

import model.domain.RaportInventar;

import java.util.List;

public interface RaportInventarDAO extends GenericDAO<RaportInventar, Integer>{
    List<RaportInventar> getAll();

    List<RaportInventar> getBy(int[] idLoc, int[] idPersoana, int[] cod1, int[] cod2, String orderBy);
}
