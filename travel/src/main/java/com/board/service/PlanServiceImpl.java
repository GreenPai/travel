package com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.board.domain.PlanVo;
import com.board.mapper.PlanMapper;

public class PlanServiceImpl implements PlanService {
	
	@Autowired
	private PlanMapper planMapper;

	@Override
	public List<PlanVo> getPlanList() {
        List<PlanVo> planList = planMapper.selectPlanList();
        return planList;
	}

	@Override
	public boolean insertPlanList(PlanVo params) {
        int queryResult = 0;
        if(params != null)
           queryResult = planMapper.insertPlanList(params);
        return (queryResult == 1) ? true : false;
	}

	@Override
	public boolean updatePlanList(PlanVo params) {
        int queryResult = 0;
        if(params != null)
            queryResult = planMapper.updatePlanList(params);
        return (queryResult == 1) ? true : false;
	}

	@Override
	public boolean deletePlanList(Long idx) {
        int queryResult = 0;
        if(idx != null)
            queryResult = planMapper.deletePlanList(idx);
        return (queryResult == 1) ? true : false;
	}

}
