package model.dao;


import model.domain.Evidenta;

import java.util.List;

public interface EvidentaDAO extends GenericDAO<Evidenta, Long> {

    public List<Evidenta> getAll();

    Evidenta findByIdArticol(String idArticol);

    List<Evidenta> findEvidentaByBarcode(String barcode);
}
