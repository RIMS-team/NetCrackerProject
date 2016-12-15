package rest.impl;

import dao.JdbcEmployeeDao;
import model.Employee;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
        JdbcEmployeeDao jdbcEmployeeDao=(JdbcEmployeeDao) context.getBean("employeeDAO");
        List<Employee> employee=jdbcEmployeeDao.findAllEmployee();
        return new ModelAndView("welcome", "message", employee);
    }
}
