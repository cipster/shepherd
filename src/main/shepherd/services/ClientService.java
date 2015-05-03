package services;

import model.domain.Client;
import org.springframework.stereotype.Service;

/**
 * Created by Ciprian on 3/7/2015.
 * Project Shepherd
 */
@Service
public interface ClientService {

    public Client createClient(Client client) throws RuntimeException;
    public Client modifyClient(Client client) throws RuntimeException;
    public boolean deleteClient(Client client) throws RuntimeException;


}
