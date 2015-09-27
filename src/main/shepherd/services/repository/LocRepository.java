package services.repository;

import model.domain.Loc;
import org.springframework.data.repository.CrudRepository;

public interface LocRepository extends CrudRepository<Loc, Long> {
}
