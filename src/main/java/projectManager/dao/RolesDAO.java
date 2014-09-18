package projectManager.dao;


import projectManager.repository.Roles;

import java.util.List;

public interface RolesDAO extends GenericDAO<Roles, Integer> {
    List<Roles> getAll();

}
