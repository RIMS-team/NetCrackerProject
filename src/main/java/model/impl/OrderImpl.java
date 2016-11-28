package model.impl;

import model.*;

import java.util.Date;

/**
 * Created by Vic on 24-Nov-16.
 */
public class OrderImpl implements Order {
    protected OrderStatus orderStatus;
    protected User user;
    protected Employee employee;
    protected Date date;
    protected Inventory inventory;

    @Override
    public void setOrderStatus(OrderStatus orderStatus) {
        this.orderStatus = orderStatus;
    }

    @Override
    public OrderStatus getOrderStatus() {
        return orderStatus;
    }

    @Override
    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    @Override
    public Employee getEmployee() {
        return employee;
    }

    @Override
    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public User getUser() {
        return user;
    }

    @Override
    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public Date getDate() {
        return date;
    }

    @Override
    public void setInventory(Inventory inventory) {
        this.inventory = inventory;
    }

    @Override
    public Inventory getInventory() {
        return inventory;
    }
}
