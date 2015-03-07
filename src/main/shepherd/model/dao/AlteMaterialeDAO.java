package model.dao;


import model.dto.AlteMateriale;

import java.util.List;

public interface AlteMaterialeDAO extends GenericDAO<AlteMateriale, Integer> {

    public List<AlteMateriale> getAll();
}
