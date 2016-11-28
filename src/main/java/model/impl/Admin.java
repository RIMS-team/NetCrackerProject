package model.impl;

/**
 * Created by Vic on 24-Nov-16.
 */
public class Admin extends User {

    public Admin(){}

    public Admin(int employeeID, int phoneNumber, String fullName, String eMail, String password){
        super(employeeID, phoneNumber, fullName, eMail, password);
    }

    public String toString() {
        return super.toString();
    }
}
