package com.board.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.board.domain.BoardVo;
import com.board.domain.DailyVo;

@Mapper
public interface DailyMapper {

	public void dailyInsert(DailyVo dailyVo);


}


