package com.board.service;

import java.util.List;

import com.board.domain.PlanVo;

public interface PlanService {

	public List<PlanVo> getPlanList(int searchType, String userid);

	public int addPlanList(String contents, String userid);

	public int updateComYnOfPlanList(int idx);

	public Object deletePlan(int idx, String userid);
}
