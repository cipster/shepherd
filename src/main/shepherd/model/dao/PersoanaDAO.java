package model.dao;


import model.dto.Persoana;

import java.util.List;

public interface PersoanaDAO extends GenericDAO<Persoana, Integer> {

    public List<Persoana> getAll();

    public Persoana findByUsername(String username);
}
