package com.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.board.domain.PlanVo;

	@Mapper
	public interface PlanMapper {
	    public List<PlanVo> selectPlanList();
	    public int insertPlanList(PlanVo params);
	    public int updatePlanList(PlanVo params);
	    public int deletePlanList(Long p_idx);
	}

