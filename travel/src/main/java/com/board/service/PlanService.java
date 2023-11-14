package com.board.service;

import java.util.List;

import com.board.domain.PlanVo;

public interface PlanService {
    public List<PlanVo> getPlanList();
    public boolean insertPlanList(PlanVo params);
    public boolean updatePlanList(PlanVo params);
    public boolean deletePlanList(Long idx);
}
