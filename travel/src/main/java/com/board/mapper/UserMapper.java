package com.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.board.domain.DailyVo;
import com.board.domain.UserVo;

@Mapper
public interface UserMapper {

	int dupCheck(UserVo vo);

	public  void loginForm(UserVo vo);

	UserVo loginCheck(UserVo vo);

	void dailyInsert(DailyVo dailyVo);

	List<DailyVo> dailyGet(DailyVo dailyVo);

	void dailyDelete(String userid);

	void dailyListInsert(List<DailyVo> dayList);

	void dailyListInsert(DailyVo daily);

	void dailyDateDelete(String date);

	void dailyWeatherInsert(DailyVo dailyVo);

	List<DailyVo> dailyListGet(DailyVo dailyVo);
	
	
}


