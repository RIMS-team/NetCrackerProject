package model.impl;

import model.OrderStatus;

/**
 * Created by dell on 24-Nov-16.
 */
public class OrderStatusImpl implements OrderStatus {
    protected String code;
    protected String name;

    @Override
    public void setCode(String code) {
        this.code = code;
    }

    @Override
    public String getCode() {
        return code;
    }

    @Override
    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String getName() {
        return name;
    }
}
