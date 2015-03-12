package services;

import model.UserAndRolesResult;
import model.dao.UserDAO;
import model.dao.UserRoleDAO;
import model.dto.User;
import model.dto.UserRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.util.CollectionUtils;
import util.enums.RoleType;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Ciprian on 3/9/2015.
 * Project Shepherd
 */
public class UserServiceImpl implements UserService {
	@Autowired
	private UserRoleDAO userRoleDAO;
	@Qualifier("userDAO")
	@Autowired
	private UserDAO userDAO;


	@Override
	public UserAndRolesResult getRolesByUsername(String username) throws RuntimeException {
		UserAndRolesResult userAndRolesResult;
		List<UserRole> foundRoles = userRoleDAO.findByID(username);
		if(thereAreNo(foundRoles))
			throw new NullPointerException("Utilizatorul " + username + " nu are roluri definite!");
		else {
			int[] roles = itterateRoles(foundRoles);
			userAndRolesResult = new UserAndRolesResult(username, roles);
		}
		return userAndRolesResult;
	}

	@Override
	public List<User> fetchAllUsers() {
		List<User> listaUsers;
		String role = SecurityContextHolder.getContext().getAuthentication().getAuthorities().iterator().next().getAuthority();

		try {
			if(role.equals("ROLE_ADMIN")) {
				listaUsers = userDAO.getAll();
			} else {
				listaUsers = userDAO.getAllNonAdmin();
			}
		} catch (Exception e) {
			listaUsers = new ArrayList<>();
		}
		return listaUsers;
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
