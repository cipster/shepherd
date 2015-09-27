package services.repository;

import model.domain.Cod3;
import org.springframework.data.repository.CrudRepository;

public interface Cod3Repository extends CrudRepository<Cod3, Long> {
    Cod3 findOneByBarcodeEquals(String barcode);
}
