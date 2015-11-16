package services;

import model.UserAndRolesResult;
import model.domain.User;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Ciprian on 3/9/2015.
 * Project Shepherd
 */
@Service
public interface UserService {
	UserAndRolesResult getRolesByUsername(String username) throws RuntimeException;

	List<User> fetchAllUsers();
}
