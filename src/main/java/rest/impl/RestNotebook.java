package rest.impl;

import model.Notebook;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import service.impl.NotebookServiceImpl;

import java.util.List;

/**
 * Created by Elina on 08.12.2016.
 */
@Controller
public class RestNotebook {
    private ApplicationContext context = new ClassPathXmlApplicationContext("Spring-Module.xml");
    private NotebookServiceImpl notebookService = (NotebookServiceImpl) context.getBean("notebookServiceImpl");

    @RequestMapping("/notebooks")
    public ModelAndView getNotebooks() {
        List<Notebook> notebooks = notebookService.findAll();
        return new ModelAndView("notebooks", "noteList", notebooks);
    }
}
