package kr.ac.hansung.service;

import java.util.List;

import kr.ac.hansung.entity.User;

public interface UserService {
	List<User> getAllUsers();

    User getUserById(String userId);

    User createUser(String userId);

    void updateUser(User user);

    void deleteUser(User user);
}
