package kr.ac.hansung.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.ac.hansung.entity.Plan;
import kr.ac.hansung.entity.Spot;
import kr.ac.hansung.exception.NotFoundException;
import kr.ac.hansung.service.PlanService;
import kr.ac.hansung.service.SpotService;

@RestController
@RequestMapping(path = "/api/plans/{planid}/spots")
public class PlanSpotController {
   @Autowired
   private PlanService planService;

   @Autowired
   private SpotService spotService;

   @RequestMapping(method = RequestMethod.GET)
   public ResponseEntity<?> retrieveAllSpots(@PathVariable String planid) {

      // Getting the requiring plan; or throwing exception if not found
      final Plan plan = planService.getPlanById(planid);
      if (plan == null)
         throw new NotFoundException(planid);

      // Getting all spots in application...
      final List<Spot> spots = spotService.getAllSpots();
      if (spots.isEmpty()) {
         return new ResponseEntity<>(HttpStatus.NO_CONTENT);
      }
      
      return ResponseEntity.ok(spots);
         
   }

   @RequestMapping(path = "/{spotid}", method = RequestMethod.POST)
   public ResponseEntity<?> addSpot(@PathVariable String planid, @PathVariable String spotid) {

      // Getting the requiring plan; or throwing exception if not found
      final Plan plan = planService.getPlanById(planid);
      if (plan == null)
         throw new NotFoundException(planid);

      // Getting the requiring spot; or throwing exception if not found
      final Spot spot = spotService.getSpotById(spotid);
      if (spot == null)
         throw new NotFoundException(spotid);

      // Validating if association does not exist...
      /*
       * if (spotService.hasPlan(spot, plan)) { throw new IllegalArgumentException(
       * "spot " + spot.getId() + " already contains plan " + plan.getId()); }
       */
      // Associating spot with plan...
      if (spotService.hasPlan(spot, plan)) {
         throw new IllegalArgumentException(
               "spot " + spot.getId() + " already contains plan " + plan.getId());
      }
      spotService.addPlan(spot, plan);

      return ResponseEntity.status(HttpStatus.CREATED).body(spot);
   }

   @RequestMapping(path = "/{spotid}", method = RequestMethod.DELETE)
   public ResponseEntity<?> removeSpot(@PathVariable String planid, @PathVariable String spotid) {
      // Getting the requiring plan; or throwing exception if not found
      final Plan plan = planService.getPlanById(planid);
      if (plan == null)
         throw new NotFoundException(planid);

      // Getting the requiring spot; or throwing exception if not found
      final Spot spot = spotService.getSpotById(spotid);
      if (spot == null)
         throw new NotFoundException(spotid);
   
        spotService.removePlan(spot, plan);

        return ResponseEntity.noContent().build();
   }

}
