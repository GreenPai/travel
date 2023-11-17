package com.board.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.board.domain.DailyVo;
import com.board.domain.UserVo;

@Mapper
public interface UserMapper {

	int dupCheck(UserVo vo);

	public  void loginForm(UserVo vo);

	UserVo loginCheck(UserVo vo);

	void dailyInsert(DailyVo dailyVo);
	
	
}


