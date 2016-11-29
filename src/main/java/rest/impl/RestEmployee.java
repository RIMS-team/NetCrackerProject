package rest.impl;

import model.Employee;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/*
 * author: Crunchify.com
 *
 */

@Controller
public class RestEmployee {
    ApplicationContext context = new ClassPathXmlApplicationContext("spring-beans.xml");
    @RequestMapping("/welcome")
    public ModelAndView helloWorld() {

        ApplicationContext context =
                new ClassPathXmlApplicationContext("spring-beans.xml");
        Employee employee= (Employee) context.getBean("Employee");
        return new ModelAndView("welcome", "message", employee);
    }
}
