package projectManager.repository.dao;


import projectManager.repository.AlteMateriale;

import java.util.List;

public interface AlteMaterialeDAO extends GenericDAO<AlteMateriale, Integer> {

    public List<AlteMateriale> getAll();
}
