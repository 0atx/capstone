package kr.ac.hansung.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.hansung.entity.Plan;

@Repository
public class PlanDao {
   
   @Autowired
   private SessionFactory sessionFactory;

   public Plan getPlanById(String id) {
      Session session = sessionFactory.getCurrentSession();
      Plan plan = (Plan) session.get(Plan.class, id);
      
      return plan;
   }

   public List<Plan> getPlans() {
      Session session = sessionFactory.getCurrentSession();
      String hql = "from Plan";

      Query<Plan> query = session.createQuery(hql, Plan.class);
      List<Plan> plans = query.getResultList();

      return plans;
   }

   public String addPlan(Plan plan) {
      Session session = sessionFactory.getCurrentSession();
      String id = (String) session.save(plan);
      session.flush();
      return id;
   }

   public void deletePlan(Plan plan) {
      Session session = sessionFactory.getCurrentSession();
      session.delete(plan);
      session.flush();
   }

   public void updatePlan(Plan plan) {
      Session session = sessionFactory.getCurrentSession();
      session.update(plan);
      session.flush();
   }
}