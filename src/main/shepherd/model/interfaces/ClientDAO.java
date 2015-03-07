package model.interfaces;

import model.dao.Client;

import java.util.List;


public interface ClientDAO extends GenericDAO<Client, Integer> {

    List<Client> getAll();
}
