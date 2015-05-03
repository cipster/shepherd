package model.dao;


import model.domain.AlteMateriale;

import java.util.List;

public interface AlteMaterialeDAO extends GenericDAO<AlteMateriale, Integer> {

    public List<AlteMateriale> getAll();
}
