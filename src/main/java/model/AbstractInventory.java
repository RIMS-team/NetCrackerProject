package model;

/**
 * Created by Kristina on 23.11.2016.
 */
class AbstractInventory extends Entity {

    protected String status;

    public AbstractInventory() {
 //       throw new IllegalArgumentException();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
