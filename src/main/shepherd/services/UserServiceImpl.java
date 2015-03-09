package services;

import model.UserAndRolesResult;
import model.dao.UserRoleDAO;
import model.dto.UserRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;

import java.util.List;

/**
 * Created by Ciprian on 3/9/2015.
 * Project Shepherd
 */
public class UserServiceImpl implements UserService {
	@Autowired
	private UserRoleDAO userRoleDAO;

	@Override
	public UserAndRolesResult getRolesByUsername(String username) throws RuntimeException {
		UserAndRolesResult userAndRolesResult;
		List<UserRole> foundRoles = userRoleDAO.findByID(username);
		if(thereAreNo(foundRoles))
			throw new NullPointerException("Utilizatorul nu are roluri definite!");
		else {
			int[] roles = itterateRoles(foundRoles);
			userAndRolesResult = new UserAndRolesResult(username, roles);
		}
		return userAndRolesResult;
	}

	private int[] itterateRoles(List<UserRole> foundRoles) {
		int[] roles = new int[10];
		int counter = 0;
		for (UserRole role : foundRoles) {
			roles[counter] = role.getRoleType();
			counter++;
		}
		return roles;
	}

	private boolean thereAreNo(List<UserRole> foundRoles){
		return CollectionUtils.isEmpty(foundRoles);
	}
}
