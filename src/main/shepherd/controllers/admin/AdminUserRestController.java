package controllers.admin;

import model.UserAndRolesResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import services.UserService;

@Controller
@RequestMapping(value = "/apis/v1/admin/user")
public class AdminUserRestController {

	@Autowired
	private UserService userService;

	@PreAuthorize("hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')")
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@RequestMapping(value = "/getrolesforusername", method = RequestMethod.POST)
	@ResponseBody
	public UserAndRolesResult getRolesByUsername(@RequestParam String username) throws Exception {
		try {
			return userService.getRolesByUsername(username);
		} catch (RuntimeException e) {
			return new UserAndRolesResult(username,new int[]{});
		}

	}

}
