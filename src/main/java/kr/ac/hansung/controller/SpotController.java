package kr.ac.hansung.controller;

import java.util.List;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.ac.hansung.entity.Spot;
import kr.ac.hansung.exception.NotFoundException;
import kr.ac.hansung.service.SpotService;
import lombok.Getter;
import lombok.Setter;

@RestController
@RequestMapping(path="/api/spots")
public class SpotController {
   
   @Autowired
   private SpotService spotService;
   
   @RequestMapping(method = RequestMethod.GET)
   public ResponseEntity<?> retrieveAllSpots() {
      
      // Getting all spots in application...
      final List<Spot> spots = spotService.getAllSpots();

      if (spots.isEmpty()) {
         return new ResponseEntity<>(HttpStatus.NO_CONTENT);
      }

      return new ResponseEntity<List<Spot>>(spots, HttpStatus.OK);
   }
   
   @RequestMapping(path = "/{id}", method = RequestMethod.GET)
   public ResponseEntity<Spot> retrieveSpot(@PathVariable Long id) {
      
      Spot spot = spotService.getSpotById(id);
      
      if( spot == null) {
         throw new NotFoundException(id);
      }
      
      return new ResponseEntity<Spot>(spot, HttpStatus.OK);
      
   }
   
    @RequestMapping(method = RequestMethod.POST)
      public ResponseEntity<Spot> createSpot(@RequestBody @Valid SpotDto request) {

         Spot spot = spotService.createSpot(request.getTitle(), request.getAddr(), request.getMapx(), request.getMapy(), request.getCat());

         return new ResponseEntity<Spot>(spot, HttpStatus.CREATED);
      }
       
      @RequestMapping(path = "/{id}", method = RequestMethod.PUT)
      public ResponseEntity<Spot> updateSpot(@PathVariable Long id, @RequestBody @Valid SpotDto request) {
         
         Spot currentSpot = spotService.getSpotById(id);
         
         if (currentSpot == null) {
            throw new NotFoundException(id);
         }
         
         currentSpot.setTitle(request.getTitle());
         currentSpot.setAddr(request.getAddr());
         currentSpot.setMapx(request.getMapx());
         currentSpot.setMapy(request.getMapy());
         currentSpot.setCat(request.getCat());
         
         spotService.updateSpot(currentSpot);
         return new ResponseEntity<Spot>(currentSpot, HttpStatus.OK);
         
         
         
      }

      @RequestMapping(path = "/{id}", method = RequestMethod.DELETE)
      public ResponseEntity<Void> deleteSpot(@PathVariable Long id) {
         // Getting the requiring spot; or throwing exception if not found
         final Spot spot = spotService.getSpotById(id);
         
         if(spot == null)
            throw new NotFoundException(id);                  

         // Deleting spot from the application...
         spotService.deleteSpot(spot);

         return new ResponseEntity<>(HttpStatus.NO_CONTENT); //아래와 동일한 기능
         //return ResponseEntity.noContent().build();

      }
      
      @Getter
      @Setter
      static class SpotDto {
         
           @NotNull(message = "name is required")
           @Size(message = "name must be equal to or lower than 300", min = 1, max = 300)
           private String title;           
           
           @NotNull(message = "name is required")
           private String addr;
           
           private double mapx;
           
           private double mapy;
           
           private String cat;
      }
}