package services;

import model.UserAndRolesResult;
import org.springframework.stereotype.Service;

/**
 * Created by Ciprian on 3/9/2015.
 * Project Shepherd
 */
@Service
public interface UserService {
	public UserAndRolesResult getRolesByUsername(String username) throws RuntimeException;
}
