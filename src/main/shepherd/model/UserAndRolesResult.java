package model;

/**
 * Created by Ciprian on 3/9/2015.
 * Project Raindrop
 */
public class UserAndRolesResult {
	private String username;
	private int[] roles;

	public UserAndRolesResult(String username, int[] roles) {
		this.username = username;
		this.roles = roles;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int[] getRoles() {
		return roles;
	}

	public void setRoles(int[] roles) {
		this.roles = roles;
	}
}
