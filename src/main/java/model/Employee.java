package model;

/**
 * Created by barmin on 23.11.2016.
 */
public class Employee extends Entity {
    //int employeeID;
    int phoneNumber;
    String fullName;
    String eMail;

    public Employee(){}

    public Employee(int id, int phoneNumber, String fullName, String eMail) {
        this.id = id;
        //this.employeeID = employeeID;
        this.phoneNumber = phoneNumber;
        this.fullName = fullName;
        this.eMail = eMail;
    }

    public Employee(String s, String s2, String s23) {
    }

    public String toString(){
        return super.toString() + " phoneNumber = " + phoneNumber + " fullName = " + fullName + " eMail = " + eMail;
     }

//    public int getEmployeeID() {
//        return employeeID;
//    }

//    public void setEmployeeID(int employeeID) {
//        this.employeeID = employeeID;
//    }

    public int getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(int phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String geteMail() {
        return eMail;
    }

    public void seteMail(String eMail) {
        this.eMail = eMail;
    }
}
