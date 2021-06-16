package kr.ac.hansung.service;

import java.util.List;

import kr.ac.hansung.entity.Plan;
import kr.ac.hansung.entity.User;

public interface PlanService {

    List<Plan> getAllPlans();

    Plan getPlanById(String id);

    Plan createPlan(String id, String startDate, String endDate, String planDay, String totalDate);

    void updatePlan(Plan plan);

    void deletePlan(Plan plan);
    
    void addUser(Plan plan, User user);
    
    boolean hasUser(Plan plan, User user);
    
}
