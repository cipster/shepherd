package model.dao;


import model.dto.EvidentaInventar;

import java.util.List;

public interface EvidentaInventarDAO extends GenericDAO<EvidentaInventar, Long> {

    public List<EvidentaInventar> getAll();

    EvidentaInventar findByIdArticol(String idArticol);

    List<EvidentaInventar> findTranzitByIdPersoana(int idPersoana);
}
