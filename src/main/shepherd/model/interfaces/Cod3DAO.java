package model.interfaces;


import model.dao.Cod3;

import java.util.List;

public interface Cod3DAO extends GenericDAO<Cod3, Integer> {

    public List<Cod3> getAll();

    Cod3 findByBarcode(String code);

    void setStare(int stare, int id);

    void setPrimit(int id);
}
