package dao;

import model.Notebook;

import java.util.List;

/**
 * Created by Elina on 08.12.2016.
 */
public interface NotebookDAO {
    List<Notebook> findAll();
}
