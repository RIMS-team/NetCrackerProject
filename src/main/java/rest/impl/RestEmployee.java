package rest.impl;

import dao.JdbcEmployeeTemplate;
import model.Employee;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/*
 * author: Crunchify.com
 *
 */

@Controller
public class RestEmployee {
    ApplicationContext context = new ClassPathXmlApplicationContext("Spring-Module.xml");
    @RequestMapping("/welcome")
    public ModelAndView getEmployee() {
        JdbcEmployeeTemplate jdbcEmployeeTemplate =(JdbcEmployeeTemplate) context.getBean("employeeDAO");
        List<Employee> employee= jdbcEmployeeTemplate.findAllEmployee();
        return new ModelAndView("welcome", "message", employee);
    }
}
