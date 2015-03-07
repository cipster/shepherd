package model.interfaces;


import model.dao.Roles;

import java.util.List;

public interface RolesDAO extends GenericDAO<Roles, Integer> {
    List<Roles> getAll();

}
