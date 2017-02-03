package project.hrininlab.Entity;

import com.sun.javafx.beans.IDProperty;

import javax.persistence.*;

/**
 * Created by mrhri on 29.01.2017.
 */
@Entity
@Table(name = "user_role")
public class UserRole {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "role_id")
    private int role_id;

    @OneToOne
    @JoinColumn(name = "user_owner")
    private User user;

    @Column(name = "roles")
    private String roles;

    public UserRole() {
    }

    public UserRole(User user, String roles) {
        this.user = user;
        this.roles = roles;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getRoles() {
        return roles;
    }

    public void setRoles(String roles) {
        this.roles = roles;
    }

    @Override
    public String toString() {
        return "UserRole{" +
                "role_id=" + role_id +
                ", user=" + user +
                ", roles='" + roles + '\'' +
                '}';
    }
}
