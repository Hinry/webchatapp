package project.hrininlab.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import project.hrininlab.DAO.UserDao;
import project.hrininlab.Entity.UserRole;

/**
 * Created by mrhri on 07.02.2017.
 */
@Component
public class ConvertUserRole implements Converter<Object, UserRole> {

    @Autowired
    UserDao dao;

    public UserRole convert(Object element) {
        Integer id = Integer.parseInt((String)element);
        UserRole profile= dao.findById(id);
        return profile;
    }
}
