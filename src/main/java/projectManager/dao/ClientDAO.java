package projectManager.dao;

import projectManager.repository.Client;

import java.util.List;


public interface ClientDAO extends GenericDAO<Client, Integer> {

    List<Client> getAll();
}
