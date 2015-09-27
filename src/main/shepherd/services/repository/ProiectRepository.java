package services.repository;

import model.domain.Proiect;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ProiectRepository extends CrudRepository<Proiect, Long> {
    List<Proiect> findAllByIdClientEquals(Long idClient);
}
