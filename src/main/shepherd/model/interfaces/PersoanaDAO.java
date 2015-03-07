package model.interfaces;


import model.dao.Persoana;

import java.util.List;

public interface PersoanaDAO extends GenericDAO<Persoana, Integer> {

    public List<Persoana> getAll();

    Persoana findByUsername(String username);
}
