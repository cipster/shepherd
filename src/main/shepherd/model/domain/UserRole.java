package model.domain;

import javax.persistence.*;

@Entity
@Table(name = "user_roles", schema = "", catalog = "proiecte")
public class UserRole {

    private long userRoleId;
    private String role;
    private String username;
    private Integer roleType;

    @Id
    @Column(name = "user_role_id", nullable = false, insertable = true, updatable = true)
    public long getUserRoleId() {
        return userRoleId;
    }

    public void setUserRoleId(long userRoleId) {
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
    public Integer getRoleType() {
        return roleType;
    }

    public void setRoleType(Integer roleType) {
        this.roleType = roleType;
    }

}
