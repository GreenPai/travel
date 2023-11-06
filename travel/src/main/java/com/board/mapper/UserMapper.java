package com.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.board.domain.BoardVo;
import com.board.domain.CommentVo;
import com.board.domain.UserVo;

@Mapper
public interface UserMapper {

	int dupCheck(UserVo vo);
	
	
}


