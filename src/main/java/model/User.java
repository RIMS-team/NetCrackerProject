package model;

/**
 * Created by Vic on 24-Nov-16.
 */
public interface User extends Employee {
    void setPassword(String password);
    String getPassword();
}
