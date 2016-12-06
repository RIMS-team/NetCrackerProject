package dao;

import model.User;

import java.util.List;

/**
 * Created by trvler135 on 06.12.2016.
 */
public interface UserDAO {
    List<User> findALl();
    User findByEmail(String email);
}
