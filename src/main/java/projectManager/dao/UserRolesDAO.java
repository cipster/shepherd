package projectManager.dao;


import projectManager.repository.UserRoles;

import java.util.List;

public interface UserRolesDAO extends GenericDAO<UserRoles, Integer> {

    List<UserRoles> getAll();

    List<UserRoles> findByID(String username);

    void deleteByUsernameAndRole(String username, String role);
}
