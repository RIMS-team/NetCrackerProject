package rest.impl;

import model.User;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.env.SystemEnvironmentPropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import service.impl.UserServiceImpl;

import java.util.List;

/**
 * Created by trvler135 on 07.12.2016.
 */
@Controller
public class RestUser {

    private ApplicationContext context = new ClassPathXmlApplicationContext("Spring-Module.xml");
    private UserServiceImpl userService = (UserServiceImpl) context.getBean("userServiceImpl");;

    @RequestMapping("/users")
    public ModelAndView getUsers() {

        //userService = (UserServiceImpl) context.getBean("userServiceImpl");

        List<User> users = userService.findAll();
        return new ModelAndView("users", "userList", users);
    }
}
