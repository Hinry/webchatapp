package project.hrininlab.Entity;

import javax.persistence.*;

/**
 * Created by mrhri on 29.01.2017.
 */
@Entity
@Table(name = "contact_list")
public class ContactList {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="id")
    private int list_id;

    @ManyToOne
    @JoinColumn(name = "owner_id")
    private User owner_id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user_id;

    @Column(name="allias")
    private String allias;

    public ContactList(User owner_id, User user_id) {
        this.owner_id = owner_id;
        this.user_id = user_id;
    }

    public ContactList() {
    }

    public int getList_id() {
        return list_id;
    }

    public void setList_id(int list_id) {
        this.list_id = list_id;
    }

    public User getOwner_id() {
        return owner_id;
    }

    public void setOwner_id(User owner_id) {
        this.owner_id = owner_id;
    }

    public User getUser_id() {
        return user_id;
    }

    public void setUser_id(User user_id) {
        this.user_id = user_id;
        this.allias = user_id.getLogin();
    }

    public String getAllias() {
        return allias;
    }

    public void setAllias(String allias) {
        this.allias = allias;
    }

    @Override
    public String toString() {
        return "ContactList{" +
                "list_id=" + list_id +
                ", owner_id=" + owner_id +
                ", user_id=" + user_id +
                '}';
    }
}
