package kr.ac.hansung.controller;

import java.util.List;

import javax.persistence.Column;
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

import kr.ac.hansung.controller.SpotController.SpotDto;
import kr.ac.hansung.entity.Plan;
import kr.ac.hansung.entity.Spot;
import kr.ac.hansung.exception.NotFoundException;
import kr.ac.hansung.service.PlanService;
import kr.ac.hansung.service.SpotService;
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
    public ResponseEntity<?> retrieveCategory(@PathVariable Long id) {
    	
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
        final Plan plan = planService.createPlan(request.getStartDate(), request.getEndDate());
        
		//return new ResponseEntity<Category>(category, HttpStatus.CREATED);
        return ResponseEntity.status(HttpStatus.CREATED).body(plan);
    }

    @RequestMapping(path = "/{id}", method = RequestMethod.PUT)
    public ResponseEntity<?> updatePlan(@PathVariable Long id, @RequestBody @Valid PlanDto request) {
    	
    	final Plan plan = planService.getPlanById(id);
		
		if(plan == null) {
			throw new NotFoundException(id);
		}
		
		plan.setStartDate(request.getStartDate());
		plan.setEndDate(request.getEndDate());
		
		planService.updatePlan(plan);
		return new ResponseEntity<Plan>(plan, HttpStatus.OK);
       
    }

    @RequestMapping(path = "/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<?> deletePlan(@PathVariable Long id) {
    	
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
        @NotNull(message = "title is required")
        @Size(message = "title must be equal to or lower than 100", min = 1, max = 100)
        private String StartDate;
        private String EndDate;
        private String PlanDay;
        private String ToTalDate;
        
    }

}