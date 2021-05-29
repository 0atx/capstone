package kr.ac.hansung.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.hansung.dao.UserDao;
import kr.ac.hansung.entity.User;

@Service
@Transactional
public class UserServiceImpl implements UserService {
	@Autowired
    private UserDao userRepository;

    @Override
    public List<User> getAllUsers() {
        return userRepository.getUsers();
    }
    
    @Override
    public User getUserById(String id) {
        return userRepository.getUserById(id);
    }
    
    @Override
    public User createUser(String userId) {
        User user = new User();
        user.setUserID(userId);
        
        userRepository.addUser(user);
        
        return user;
    }
           
    @Override
    public void updateUser(User user) {       
        userRepository.updateUser(user);
    }
    
    @Override
    public void deleteUser(User user) {
        userRepository.deleteUser(user);
    }
	
}
