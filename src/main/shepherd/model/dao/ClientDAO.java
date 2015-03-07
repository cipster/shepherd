package model.dao;

import model.dto.Client;

import java.util.List;


public interface ClientDAO extends GenericDAO<Client, Integer> {

    List<Client> getAll();
}
