package services.repository;

import model.domain.Articol;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ArticolRepository extends CrudRepository<Articol, Long> {
    List<Articol> findAllByIdPersoanaEquals(Long idPersoana);
}
