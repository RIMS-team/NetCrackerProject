package service.impl;

import dao.impl.JdbcNotebook;
import model.Notebook;
import service.NotebookService;

import java.util.List;

/**
 * Created by Elina on 08.12.2016.
 */
public class NotebookServiceImpl implements NotebookService {
    private JdbcNotebook notebookDao;

    public void setNotebookDao(JdbcNotebook notebookDao) {
        this.notebookDao = notebookDao;
    }

    @Override
    public List<Notebook> findAll() {
        return notebookDao.findAll();
    }
}
