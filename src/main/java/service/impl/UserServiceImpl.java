package service.impl;

import dao.impl.JdbcUser;
import model.User;
import service.UserService;

import java.util.List;

/**
 * Created by trvler135 on 07.12.2016.
 */
public class UserServiceImpl implements UserService {

    private JdbcUser userDao;

    public void setUserDao(JdbcUser userDAO) {
        this.userDao = userDAO;
    }

    @Override
    public List<User> findAll() {
        return userDao.findAll();
    }

    @Override
    public User findByEmail(String email) {
        return userDao.findByEmail(email);
    }
}
