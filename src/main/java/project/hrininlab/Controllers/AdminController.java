package project.hrininlab.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import project.hrininlab.DAO.UserDao;
import project.hrininlab.Entity.User;
import project.hrininlab.Entity.UserRole;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * Created by mrhri on 03.02.2017.
 */
@Controller
@SessionAttributes("roles")
public class AdminController {


    @Autowired
    UserDao userService;

    @Autowired
    MessageSource messageSource;

    @RequestMapping(value = "/adminpage", method = RequestMethod.GET)
    public ModelAndView adminPage() {

        List<User> list = getList();
        ModelAndView model = new ModelAndView("adminpage");
        model.addObject("list", list);
        model.addObject("message", "Эта страница только для super админов!");

        return model;

    }

    @RequestMapping(value = { "/newuser" }, method = RequestMethod.GET)
    public String newUser(ModelMap model) {
        User user = new User();
        model.addAttribute("user", user);
        model.addAttribute("edit", false);
        return "registration";
    }

    @RequestMapping(value = { "/newuser" }, method = RequestMethod.POST)
    public String saveUser(@Valid User user, BindingResult result,
                           ModelMap model) {

        if (result.hasErrors()) {
            return "registration";
        }

        /*
         * Preferred way to achieve uniqueness of field [sso] should be implementing custom @Unique annotation
         * and applying it on field [sso] of Model class [User].
         *
         * Below mentioned peace of code [if block] is to demonstrate that you can fill custom errors outside the validation
         * framework as well while still using internationalized messages.
         *
         */
        if(!userService.isUserUnique(user.getId(), user.getLogin())){
            FieldError ssoError =new FieldError("user","ssoId", messageSource.getMessage("non.unique.ssoId", new String[]{user.getLogin()}, Locale.getDefault()));
            result.addError(ssoError);
            return "registration";
        }

        userService.add_User(user);

        model.addAttribute("success", "User " + user.getFirst_name() + " "+ user.getLast_name() + " registered successfully");
        model.addAttribute("loggedinuser", getPrincipal());
        //return "success";
        return "registrationsuccess";
    }

    @ModelAttribute("roles")
    public List<String> initializeProfiles() {
        List<String> list = new ArrayList<String>();
        list.add("ADMIN");
        list.add("USER");
        return list;
    }

    private List<User> getList() {

        UserDao dao = new UserDao();
        List<User> list = new ArrayList<User>();
        list.addAll(dao.getAllUsers());

        return list;

    }

    /**
     * This method returns the principal[user-name] of logged-in user.
     */
    private String getPrincipal(){
        String userName = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof UserDetails) {
            userName = ((UserDetails)principal).getUsername();
        } else {
            userName = principal.toString();
        }
        return userName;
    }
}
