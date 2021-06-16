package kr.ac.hansung.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.hansung.entity.User;

@Repository
public class UserDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public User getUserById(String id) {
	      Session session = sessionFactory.getCurrentSession();
	      User user = (User) session.get(User.class, id);
	      
	      return user;
	   }

	   public List<User> getUsers() {
	      Session session = sessionFactory.getCurrentSession();
	      String hql = "from User";

	      Query<User> query = session.createQuery(hql, User.class);
	      List<User> users = query.getResultList();

	      return users;
	   }

	   public String addUser(User user) {
	      Session session = sessionFactory.getCurrentSession();
	      String id = (String) session.save(user);
	      session.flush();
	      return id;
	   }

	   public void deleteUser(User user) {
	      Session session = sessionFactory.getCurrentSession();
	      session.delete(user);
	      session.flush();
	   }

	   public void updateUser(User user) {
	      Session session = sessionFactory.getCurrentSession();
	      session.update(user);
	      session.flush();
	   }
}