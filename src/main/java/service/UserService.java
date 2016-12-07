package service;

import model.User;

import java.util.List;

/**
 * Created by trvler135 on 07.12.2016.
 */
public interface UserService {
    List<User> findAll();
    User findByEmail(String email);
}
