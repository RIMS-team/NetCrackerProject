package service.impl;

import dao.impl.JdbcOrderStatus;
import model.OrderStatus;
import service.OrderStatusService;

import java.util.List;

/**
 * Created by dell on 08-Dec-16.
 */
public class OrderStatusServiceImpl implements OrderStatusService {
    private JdbcOrderStatus orderStatusDao;

    public void setOrderStatusDao(JdbcOrderStatus orderStatusDAO) {
        this.orderStatusDao = orderStatusDAO;
    }

    @Override
    public List<OrderStatus> findAll() {
        return orderStatusDao.findAll();
    }

    @Override
    public OrderStatus findById(int id) {
        return orderStatusDao.findById(id);
    }
}
