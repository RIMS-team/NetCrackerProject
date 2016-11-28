package model.impl;

/**
 * Created by Vic on 24-Nov-16.
 */
public class User extends EmployeeImpl {
    protected String password;

    public User(){}
    public User(int employeeID, int phoneNumber, String fullName, String eMail, String password){
        super(employeeID, phoneNumber, fullName, eMail);
        this.password = password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return password;
    }

    public String toString() {
        return super.toString() + " password=" + password;
    }
}
