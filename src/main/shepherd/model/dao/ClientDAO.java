package model.dao;

import model.domain.Client;

import java.util.List;


public interface ClientDAO extends GenericDAO<Client, Integer> {

    List<Client> getAll();

	public Client findClientByName(String name);
}
