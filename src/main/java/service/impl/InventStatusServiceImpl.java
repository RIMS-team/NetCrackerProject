package service.impl;

import dao.impl.JdbcInventStatus;
import model.InventStatus;
import service.InventStatusService;

import java.util.List;

/**
 * Created by dell on 08-Dec-16.
 */
public class InventStatusServiceImpl implements InventStatusService {
    private JdbcInventStatus inventStatusDao;

    public void setInventStatusDao(JdbcInventStatus inventStatusDAO) {
        this.inventStatusDao = inventStatusDAO;
    }

    @Override
    public List<InventStatus> findAll() {
        return inventStatusDao.findAll();
    }

    @Override
    public InventStatus findById(int id) {
        return inventStatusDao.findById(id);
    }
}
