package project.hrininlab.Entity;

import project.hrininlab.DAO.UserDao;

/**
 * Created by mrhri on 29.01.2017.
 */
public class Main {

    public static void main (String[] args){
        UserDao dao = new UserDao();
        User user2 = new User("login3","name","lastname","password",true);

        UserRole role = new UserRole();
        role.setRoles("USER");

        user2.setRoles(role);

        dao.add_User(user2);

    }

}
