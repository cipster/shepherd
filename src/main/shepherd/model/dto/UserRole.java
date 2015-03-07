package model.dto;

import javax.persistence.*;

@Entity
@Table(name = "user_roles", schema = "", catalog = "proiecte")
public class UserRole {

    private int userRoleId;
    private String role;
    private String username;
    private int roleType;

    @Id
    @Column(name = "user_role_id", nullable = false, insertable = true, updatable = true)
    public int getUserRoleId() {
        return userRoleId;
    }

    public void setUserRoleId(int userRoleId) {
        this.userRoleId = userRoleId;
    }

    @Basic
    @Column(name = "role", nullable = false, insertable = true, updatable = true, length = 45)
    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Basic
    @Column(name = "role_type", nullable = false, insertable = true, updatable = true, length = 45)
    public int getRoleType() {
        return roleType;
    }

    public void setRoleType(int roleType) {
        this.roleType = roleType;
    }

    @Override
    public boolean equals(Object o) {
        if(this == o) return true;
        if(o == null || getClass() != o.getClass()) return false;

        UserRole userRole = (UserRole) o;

        if(userRoleId != userRole.userRoleId) return false;
        if(role != null ? !role.equals(userRole.role) : userRole.role != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = userRoleId;
        result = 31 * result + (role != null ? role.hashCode() : 0);
        return result;
    }
}
