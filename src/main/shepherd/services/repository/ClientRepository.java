package services.repository;

import model.domain.Client;
import org.springframework.data.repository.CrudRepository;

public interface ClientRepository extends CrudRepository<Client, Long> {
    Client findOneByClientEquals(String client);
}
