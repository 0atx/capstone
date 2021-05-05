package kr.ac.hansung.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.hansung.dao.PlanDao;
import kr.ac.hansung.entity.Plan;

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
    public Plan getPlanById(Long id) {
        return planRepository.getPlanById(id);
    }
    
    @Override
    public Plan createPlan(String startDate, String endDate) {
        Plan plan = new Plan();
        plan.setStartDate(startDate);
        plan.setEndDate(endDate);

        Long id =  planRepository.addPlan(plan);
        plan.setId(id);
        
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
    
}