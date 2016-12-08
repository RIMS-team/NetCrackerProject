package rest.impl;

import dao.JdbcAccessCardTemplate;
import model.AccessCard;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by Kristina on 06.12.2016.
 */
@Controller
public class RestAccessCard {

    ApplicationContext context = new ClassPathXmlApplicationContext("Spring-Module.xml");
    @RequestMapping("/cards")
    public ModelAndView getAccessCards() {
        JdbcAccessCardTemplate jdbcAccessCardTemplate = (JdbcAccessCardTemplate) context.getBean("accessCardDAO");
        List<AccessCard> accessCards = jdbcAccessCardTemplate.findAllCards();
        return new ModelAndView("cards", "message", accessCards);
    }
}
