package kr.ac.hansung.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.hansung.dao.PlanDao;
import kr.ac.hansung.entity.Plan;
import kr.ac.hansung.entity.User;

@Service
@Transactional
public class PlanServiceImpl implements PlanService {

    @Autowired
    private PlanDao planRepository;

    @Override
    public List<Plan> getAllPlans() {
        return planRepository.getPlans();
    }
    
    @Override
    public Plan getPlanById(String id) {
        return planRepository.getPlanById(id);
    }
    
    @Override
    public Plan createPlan(String id, String startDate, String endDate, String planDay, String totalDate) {
        Plan plan = new Plan();
        plan.setId(id);
        plan.setStartDate(startDate);
        plan.setEndDate(endDate);
        plan.setPlanDay(planDay);
        plan.setToTalDate(totalDate);
        
        planRepository.addPlan(plan);

        return plan;
    }
           
    @Override
    public void updatePlan(Plan plan) {       
        planRepository.updatePlan(plan);
    }
    
    @Override
    public void deletePlan(Plan plan) {
        planRepository.deletePlan(plan);
    }
    
    @Override
    public void addUser(Plan plan, User user) {
    	plan.getUsers().add(user);
    	
    	planRepository.updatePlan(plan);
    }
    
    @Override
    public boolean hasUser(Plan plan, User user) {
    	return plan.getUsers().contains(user);
    }
    
}