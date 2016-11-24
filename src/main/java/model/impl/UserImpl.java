package model.impl;

import model.User;

/**
 * Created by Vic on 24-Nov-16.
 */
public class UserImpl extends EmployeeImpl implements User {
    protected String password;

    @Override
    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String getPassword() {
        return password;
    }
}
