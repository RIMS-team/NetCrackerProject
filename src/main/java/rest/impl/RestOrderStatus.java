package rest.impl;

import model.OrderStatus;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import service.impl.OrderStatusServiceImpl;

import java.util.List;

/**
 * Created by dell on 08-Dec-16.
 */
@Controller
public class RestOrderStatus {
    private ApplicationContext context = new ClassPathXmlApplicationContext("Spring-Module.xml");
    private OrderStatusServiceImpl orderStatusService = (OrderStatusServiceImpl) context.getBean("orderStatusServiceImpl");;

    @RequestMapping("/orderstatus")
    public ModelAndView getOrderStatus() {
        List<OrderStatus> orderStatusList = orderStatusService.findAll();
        return new ModelAndView("orderstatus", "orderstatusList", orderStatusList);
    }
}
