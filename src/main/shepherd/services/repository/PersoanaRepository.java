package services.repository;

import model.domain.Persoana;
import org.springframework.data.repository.CrudRepository;

public interface PersoanaRepository extends CrudRepository<Persoana, Long> {
    Persoana findOneByUsernameEquals(String username);
}
