package project.hrininlab.Entity;

import project.hrininlab.DAO.UserDao;

import javax.sound.midi.Soundbank;

/**
 * Created by mrhri on 29.01.2017.
 */
public class Main {

    public static void main (String[] args){
        UserDao dao = new UserDao();
        User user2 = dao.get_user_by_login("as");
        System.out.println(user2.getRol());


    }

}
