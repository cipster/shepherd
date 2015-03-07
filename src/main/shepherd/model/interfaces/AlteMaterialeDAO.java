package model.interfaces;


import model.dao.AlteMateriale;

import java.util.List;

public interface AlteMaterialeDAO extends GenericDAO<AlteMateriale, Integer> {

    public List<AlteMateriale> getAll();
}
