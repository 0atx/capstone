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
import kr.ac.hansung.entity.User;
import kr.ac.hansung.exception.NotFoundException;
import kr.ac.hansung.service.PlanService;
import kr.ac.hansung.service.UserService;

//한번에 plan, spot
@RestController
@RequestMapping(path = "/api/users/{email}/plans")
public class UserPlansController {

	@Autowired
	private UserService userService;

	@Autowired
	private PlanService planService;

	@RequestMapping(method = RequestMethod.GET)
	public ResponseEntity<?> retrieveAllplans(@PathVariable String email) {
		// Getting the requiring user; or throwing exception if not found
		final User user = userService.getUserById(email);
		if (user == null)
			throw new NotFoundException(email);

		// Getting all products in application...
		final List<Plan> plans = planService.getAllPlans();
		if (plans.isEmpty()) {
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		}

		return ResponseEntity.ok(plans);
		// return new ResponseEntity<List<User>>(plans, HttpStatus.OK);

	}
	
	@RequestMapping(path = "/{planid}", method = RequestMethod.POST)
	public ResponseEntity<?> addPlan(@PathVariable String email, @PathVariable String planid) {

		// Getting the requiring user; or throwing exception if not found
		final User user = userService.getUserById(email);
		if (user == null)
			throw new NotFoundException(email);

		// Getting the requiring product; or throwing exception if not found
		final Plan plan = planService.getPlanById(planid);
		if (plan == null)
			throw new NotFoundException(planid);

		// Validating if association does not exist...
		if (planService.hasUser(plan, user)) {
			throw new IllegalArgumentException(
					"plan " + plan.getId() + " already contains user " + user.getUserID());
		}

		// Associating plan with user...
		planService.addUser(plan, user);

		return ResponseEntity.status(HttpStatus.CREATED).body(plan);
	}

}
