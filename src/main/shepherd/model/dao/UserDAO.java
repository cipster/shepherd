package model.dao;


import model.dto.User;

import java.util.List;

public interface UserDAO extends GenericDAO<User, Integer> {


    User findByID(String username);

    List<User> getAll();

    Integer updatePassword(String username, String newpassword);

    Integer deleteByUsername(String username);

    List<User> getAll(int i);
}
