package model.impl;

import model.Inventory;

/**
 * Created by Kristina on 23.11.2016.
 */
public class Notebook extends AbstractInventory implements Inventory {

    protected String name;
    protected String location;
    protected String memoryType;
    protected String model;
    protected int additionalFinanceNumber;
    protected String serialNumber;

    public Notebook(String name, String location, String memoryType,
                        String model, int additionalFinanceNumber, String serialNumber) {
        this.status = IN_STOCK;
        this.name = name;
        this.location = location;
        this.memoryType = memoryType;
        this.model = model;
        this.additionalFinanceNumber = additionalFinanceNumber;
        this.serialNumber = serialNumber;
    }

    public String getName() {
        return name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getMemoryType() {
        return memoryType;
    }

    public String getModel() {
        return model;
    }

    public int getAdditionalFinanceNumber() {
        return additionalFinanceNumber;
    }

    public String getSerialNumber() {
        return serialNumber;
    }
}
