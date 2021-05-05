package kr.ac.hansung.service;

import java.util.List;

import kr.ac.hansung.entity.Plan;

public interface PlanService {

    List<Plan> getAllPlans();

    Plan getPlanById(Long id);

    Plan createPlan(String startDate, String endDate);

    void updatePlan(Plan plan);

    void deletePlan(Plan plan);

}