package model.impl;

import model.Inventory;

/**
 * Created by Kristina on 23.11.2016.
 */
abstract class AbstractInventory implements Inventory {

    protected String status;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
