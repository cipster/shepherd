package services.repository;

import model.domain.Evidenta;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface EvidentaRepository extends CrudRepository<Evidenta, Long> {
    Evidenta findOneByIdCod3Equals(Long idCod3);

    List<Evidenta> findAllByBarcodeEquals(String barcode);
}
