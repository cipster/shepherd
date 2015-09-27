package services.repository;

import model.domain.Cod2;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface Cod2Repository extends CrudRepository<Cod2, Long> {
    List<Cod2> findAllByCod1Equals(Long cod1);
}
