package kr.ac.hansung.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.hansung.entity.Spot;

@Repository
public class SpotDao {
   
   @Autowired
   private SessionFactory sessionFactory;
   
   //query and return a single object
   public Spot getSpotById(String id) {
      Session session = sessionFactory.getCurrentSession();
      Spot spot = (Spot) session.get(Spot.class, id);
      
      return spot;
   }
   
      //query and return a multiple object
      //cRud method
      public List<Spot> getSpots() {
         Session session = sessionFactory.getCurrentSession();
         String hql = "from Spot";
         
         Query<Spot> query = session.createQuery(hql, Spot.class);
         List<Spot> spotList = query.getResultList();

         return spotList;
      }
      
      //Crud method
      public String addSpot(Spot spot) {
         Session session = sessionFactory.getCurrentSession();
         String id = (String) session.save(spot);
         session.flush();
         return id;
      }
      
      //crUd method
      public void updateSpot(Spot spot) {
         Session session = sessionFactory.getCurrentSession();
         session.update(spot);
         session.flush();
      }
      
      //cruD method 일정 DB에서 삭제할때 장소 검색한 다음에 중복되면 삭제 안하고 중복 안되면 삭제
      public void deleteSpot(Spot spot) {
         Session session = sessionFactory.getCurrentSession();
         session.delete(spot);
         session.flush();
      }
}