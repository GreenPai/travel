package com.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.board.domain.PlanVo;

	@Mapper
	public interface PlanMapper {
		public int addTodoList(String contents, String userid);

		public List<PlanVo> getAllPlanList(String userid);

		public List<PlanVo> getActivePlanList(String userid);

		public List<PlanVo> getCompletedPlanList(String userid);

		public int updateComYnOfTodoList(int idx);

		public Object deletePlan(int idx, String userid);


	}

