package model;

import java.util.Date;

/**
 * Created by Vic on 24-Nov-16.
 */
public interface Order {
    void setOrderStatus(OrderStatus orderStatus);
    OrderStatus getOrderStatus();

    void setEmployee(Employee employee);
    Employee getEmployee();

    void setUser(User user);
    User getUser();

    void setDate(Date date);
    Date getDate();

    void setInventory(Inventory inventory);
    Inventory getInventory();
}
