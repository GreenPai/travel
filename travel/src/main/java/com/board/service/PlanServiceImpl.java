package com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.domain.PlanVo;
import com.board.mapper.PlanMapper;

@Service
public class PlanServiceImpl implements PlanService {
	
	@Autowired
	private PlanMapper planmapper;

	@Override
	public List<PlanVo> getPlanList(int searchType, String userid) {
		if(searchType == 0) {
			// 전체 Plan 가져오기
			return planmapper.getAllPlanList(userid);
            
		} else if(searchType == 1) {
			// 활성화된 Plan 가져오기
			return planmapper.getActivePlanList(userid);
            
		} else {
			// 완료된 Plan 가져오기
			return planmapper.getCompletedPlanList(userid);
		}
	}

	@Override
	public int addPlanList(String contents, String userid) {
		return planmapper.addTodoList(contents, userid);
	
	}

	@Override
	public int updateComYnOfPlanList(int idx) {
		return planmapper.updateComYnOfTodoList(idx);
	}

	@Override
	public Object deletePlan(int idx, String userid) {
		return planmapper.deletePlan(idx, userid);

	}

}
