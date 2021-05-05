package kr.ac.hansung.service;

import java.util.List;

import kr.ac.hansung.entity.Spot;

public interface SpotService {
   
    List<Spot> getAllSpots();
   
    Spot getSpotById(Long id);
   
    Spot createSpot(String title, String addr, double mapx, double mapy, String cat);
   
    void updateSpot(Spot spot);
   
    void deleteSpot(Spot spot);

}