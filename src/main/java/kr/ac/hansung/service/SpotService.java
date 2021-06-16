package kr.ac.hansung.service;

import java.util.List;

import kr.ac.hansung.entity.Spot;
import kr.ac.hansung.entity.Plan;

public interface SpotService {
   
    List<Spot> getAllSpots();
   
    Spot getSpotById(String id);
   
    Spot createSpot(String id, String title, String addr, double mapx, double mapy);
   
    void updateSpot(Spot spot);
   
    void deleteSpot(Spot spot);
    
    void addPlan(Spot spot, Plan plan);
    
    boolean hasPlan(Spot spot, Plan plan);
    
    void removePlan(Spot spot, Plan plan);

}
