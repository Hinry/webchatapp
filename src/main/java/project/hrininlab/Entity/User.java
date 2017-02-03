package project.hrininlab.Entity;

import org.hibernate.annotations.IndexColumn;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by mrhri on 29.01.2017.
 */
@Entity
@Table(name = "user")
public class User {

    @Id
    @Column(name = "user_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @NotEmpty
    @Column(name = "login", unique = true)
    private String login;

    @NotEmpty
    @Column(name = "first_name")
    private String first_name;

    @NotEmpty
    @Column(name = "last_name")
    private String last_name;

    @NotEmpty
    @Column(name = "password")
    private String password;

    @Column(name = "enabled")
    private boolean enabled;

    @OneToMany(cascade={CascadeType.ALL})
    @JoinColumn(name = "owner_id")
    @IndexColumn(name="user_id")
    private Set<ContactList> contactList;

    @OneToMany(cascade={CascadeType.ALL})
    @JoinColumn(name = "owner_id")
    @IndexColumn(name="which_user_id")
    private Set<ChatHistory> chatHistories;

    @OneToOne(cascade={CascadeType.ALL})
    @JoinColumn(name = "user_role")
    private UserRole roles;

    public User(String login, String first_name, String last_name, String password, boolean enabled) {
        this.login = login;
        this.first_name = first_name;
        this.last_name = last_name;
        this.password = password;
        this.enabled = enabled;
        this.contactList = new HashSet<ContactList>();
    }

    public User() {
    }

    public UserRole getRoles() {
        return roles;
    }

    public void setRoles(UserRole roles) {
        this.roles = roles;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public Set<ContactList> getContactList() {
        return contactList;
    }

    public void setContactList(Set<ContactList> contactList) {
        this.contactList = contactList;
    }

    public Set<ChatHistory> getChatHistories() {
        return chatHistories;
    }

    public void setChatHistories(Set<ChatHistory> chatHistories) {
        this.chatHistories = chatHistories;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", login='" + login + '\'' +
                ", first_name='" + first_name + '\'' +
                ", last_name='" + last_name + '\'' +
                ", password='" + password + '\'' +
                ", enabled=" + enabled +
                ", contactList=" + contactList +
                ", chatHistories=" + chatHistories +
                '}';
    }
}
