package model;

/**
 * Created by Kristina on 23.11.2016.
 */
public interface Inventory {

    String IN_USE = "In use";
    String IN_STOCK = "In stock";
    String ON_DIAGNOSTICS = "On diagnostics";

    public String getStatus();
    public void setStatus(String status);
}
