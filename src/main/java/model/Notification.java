package model.impl;

import java.util.Date;

/**
 * Created by dell on 24-Nov-16.
 */
public class Notification {
    protected Order order;
    protected Date first;
    protected Date second;
    protected Date third;

    public void setOrder(Order order) {
        this.order = order;
    }

    public Order getOrder() {
        return order;
    }

    public void setFirst(Date first) {
        this.first = first;
    }

    public Date getFirst() {
        return first;
    }

    public void setSecond(Date second) {
        this.second = second;
    }

    public Date getSecond() {
        return second;
    }

    public void setThird(Date third) {
        this.third = third;
    }

    public Date getThird() {
        return third;
    }
}
