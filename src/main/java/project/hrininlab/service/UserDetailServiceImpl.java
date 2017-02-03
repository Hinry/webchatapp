package project.hrininlab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import project.hrininlab.DAO.UserDao;
import project.hrininlab.Entity.User;
import project.hrininlab.Entity.UserRole;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by mrhri on 01.02.2017.
 */
@Service("customUserDetailsService")
public class UserDetailServiceImpl implements UserDetailsService {

    @Autowired
    private UserDao dao;

    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {

        User user = dao.get_user_by_login(s);
        if(user==null){
            throw new UsernameNotFoundException("Пользователь не найден");
        }


        return new org.springframework.security.core.userdetails.User(user.getLogin(),user.getPassword()
                ,true, true,true,true
                , getGrantedAuthorities(user));
    }

    private List<GrantedAuthority> getGrantedAuthorities(User user){
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();

        UserRole userRole = user.getRoles();

        authorities.add(new SimpleGrantedAuthority("ROLE_"+userRole.getRoles()));

        return authorities;
    }


}
