package model.dao;


import model.dto.Role;

import java.util.List;

public interface RoleDAO extends GenericDAO<Role, Integer> {
    List<Role> getAll();

}
