package model.domain;

import javax.persistence.*;

@Entity
@Table(name = "roles", schema = "", catalog = "proiecte")
public class Role {
    private long idRole;
    private String role;
    private String roleValue;


    @Id
    @Column(name = "id_role")
    public long getIdRole() {
        return idRole;
    }

    public void setIdRole(long idRole) {
        this.idRole = idRole;
    }

    @Basic
    @Column(name = "role")
    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Basic
    @Column(name = "role_value")
    public String getRoleValue() {
        return roleValue;
    }

    public void setRoleValue(String roleValue) {
        this.roleValue = roleValue;
    }
}
