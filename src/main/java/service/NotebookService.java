package service;

import model.Notebook;

import java.util.List;

/**
 * Created by Elina on 08.12.2016.
 */
public interface NotebookService {
    List<Notebook> findAll();
//    Notebook findByEmail(String email);
}
