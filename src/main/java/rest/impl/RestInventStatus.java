package rest.impl;

import model.InventStatus;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import service.impl.InventStatusServiceImpl;

import java.util.List;

/**
 * Created by dell on 08-Dec-16.
 */
@Controller
public class RestInventStatus {
    private ApplicationContext context = new ClassPathXmlApplicationContext("Spring-Module.xml");
    private InventStatusServiceImpl inventStatusService = (InventStatusServiceImpl) context.getBean("inventStatusServiceImpl");;

    @RequestMapping("/inventstatus")
    public ModelAndView getOrderStatus() {
        List<InventStatus> inventStatusList = inventStatusService.findAll();
        return new ModelAndView("inventstatus", "inventstatusList", inventStatusList);
    }
}
