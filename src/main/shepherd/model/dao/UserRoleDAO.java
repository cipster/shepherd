package model.dao;


import model.domain.UserRole;

import java.util.List;

public interface UserRoleDAO extends GenericDAO<UserRole, Integer> {

    List<UserRole> getAll();

    List<UserRole> findByID(String username);

    void deleteByUsernameAndRole(String username, String role);

    Integer deleteByUsername(String user);
}
