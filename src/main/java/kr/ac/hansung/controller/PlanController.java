package kr.ac.hansung.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.ac.hansung.entity.Plan;
import kr.ac.hansung.exception.NotFoundException;
import kr.ac.hansung.service.PlanService;
import lombok.Getter;
import lombok.Setter;

@RestController
@RequestMapping(path = "/api/plans")
public class PlanController {

    @Autowired
    private PlanService planService;

    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<?> retrieveAllplans() {
        // Getting all plans in application...
        final List<Plan> plans = planService.getAllPlans();

        if (plans.isEmpty()) {
         return new ResponseEntity<>(HttpStatus.NO_CONTENT);
      }

        return ResponseEntity.ok(plans);
      //return new ResponseEntity<List<Category>>(plans, HttpStatus.OK);
      
    }

    @RequestMapping(path = "/{id}", method = RequestMethod.GET)
    public ResponseEntity<?> retrievePlan(@PathVariable String id) {
       
       final Plan plan = planService.getPlanById(id);
      
      if(plan == null) {
         throw new NotFoundException(id);
      }
      
      return new ResponseEntity<Plan>(plan, HttpStatus.OK);     
      
    }

    // DTO(Data Transfer Object) : 계층간 데이터 교환을 위한 객체, 여기서는 클라이언트(Postman)에서 오는 데이터를 수신할 목적으로 사용
    // Category와 CategoryDto와의 차이를 비교해서 살펴보기 바람
    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity<?> createPlan(@RequestBody @Valid PlanDto request) {
       
        // Creating a new category in the application...
       final Plan plan = planService.createPlan(request.getId(), request.getStartDate(), request.getEndDate(), request.getPlanDay(), request.getToTalDate());
       
        //return new ResponseEntity<Plan>(plan, HttpStatus.CREATED);
        return ResponseEntity.status(HttpStatus.CREATED).body(plan);
    }

    @RequestMapping(path = "/{id}", method = RequestMethod.PUT)
    public ResponseEntity<?> updatePlan(@PathVariable String id, @RequestBody @Valid PlanDto request) {
       
       final Plan plan = planService.getPlanById(id);
      
      if(plan == null) {
         throw new NotFoundException(id);
      }
      
      plan.setStartDate(request.getStartDate());
      plan.setEndDate(request.getEndDate());
      plan.setPlanDay(request.getPlanDay());
      plan.setToTalDate(request.getToTalDate());
      
      planService.updatePlan(plan);
      return new ResponseEntity<Plan>(plan, HttpStatus.OK);
       
    }

    @RequestMapping(path = "/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<?> deletePlan(@PathVariable String id) {
       
        // Getting the requiring category; or throwing exception if not found
        final Plan plan = planService.getPlanById(id);
        
        if(plan == null)
         throw new NotFoundException(id);

        // Deleting category from the application...
        planService.deletePlan(plan);

        return ResponseEntity.noContent().build();
      //return new ResponseEntity<>(HttpStatus.NO_CONTENT);

    }
    
    
    @Getter
    @Setter
    static class PlanDto {
        private String Id;
        private String StartDate;
        private String EndDate;
        private String PlanDay;
        private String ToTalDate;
        
    }

}