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
   public Spot getSpotById(Long id) {
      return spotRepository.getSpotById(id);
   }

   @Override
   public Spot createSpot(String title, String addr, double mapx, double mapy, String cat) {
      // TODO Auto-generated method stub
      Spot spot = new Spot();
      spot.setTitle(title);
      spot.setAddr(addr);
      spot.setMapx(mapx);
      spot.setMapy(mapy);
      spot.setCat(cat);

      Long id = spotRepository.addSpot(spot);
      spot.setId(id);
      
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

}