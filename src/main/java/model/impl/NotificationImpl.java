package model.impl;

import model.Notification;
import model.Order;
import java.util.Date;

/**
 * Created by dell on 24-Nov-16.
 */
public class NotificationImpl implements Notification {
    protected Order order;
    protected Date first;
    protected Date second;
    protected Date third;

    @Override
    public void setOrder(Order order) {
        this.order = order;
    }

    @Override
    public Order getOrder() {
        return order;
    }

    @Override
    public void setFirst(Date first) {
        this.first = first;
    }

    @Override
    public Date getFirst() {
        return first;
    }

    @Override
    public void setSecond(Date second) {
        this.second = second;
    }

    @Override
    public Date getSecond() {
        return second;
    }

    @Override
    public void setThird(Date third) {
        this.third = third;
    }

    @Override
    public Date getThird() {
        return third;
    }
}
