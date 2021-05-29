package kr.ac.hansung.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.hansung.dao.SpotDao;
import kr.ac.hansung.entity.Spot;
import kr.ac.hansung.entity.Plan;

@Service
@Transactional
public class SpotServiceImpl implements SpotService {

   @Autowired
   private SpotDao spotRepository;

   @Override
   public List<Spot> getAllSpots() {
      return spotRepository.getSpots();
   }

   @Override
   public Spot getSpotById(String id) {
      return spotRepository.getSpotById(id);
   }

   @Override
   public Spot createSpot(String id, String title, String addr, double mapx, double mapy) {
      // TODO Auto-generated method stub
      Spot spot = new Spot();
      spot.setId(id);
      spot.setTitle(title);
      spot.setAddr(addr);
      spot.setMapx(mapx);
      spot.setMapy(mapy);
      
      spotRepository.addSpot(spot);
      
      return spot;
   }

   @Override
   public void updateSpot(Spot spot) {
      spotRepository.updateSpot(spot);
   }

   @Override
   public void deleteSpot(Spot spot) {
      spotRepository.deleteSpot(spot);
   }
   
   @Override
   public void addPlan(Spot spot, Plan plan) {
      // TODO Auto-generated method stub
      spot.getPlans().add(plan);
      
      spotRepository.updateSpot(spot);   
   }

   @Override
   public boolean hasPlan(Spot spot, Plan plan) {
      return spot.getPlans().contains(plan);
   }
   @Override
   public void removePlan(Spot spot, Plan plan) {
      // TODO Auto-generated method stub
      
   }


}