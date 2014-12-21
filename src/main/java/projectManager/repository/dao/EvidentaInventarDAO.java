package projectManager.repository.dao;


import projectManager.repository.EvidentaInventar;

import java.util.List;

public interface EvidentaInventarDAO extends GenericDAO<EvidentaInventar, Long> {

    public List<EvidentaInventar> getAll();

}
