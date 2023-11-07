package com.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.board.domain.BoardVo;
import com.board.domain.CommentVo;
import com.board.domain.UserVo;

@Mapper
public interface BoardMapper {
	
	public  void              boardInsert(BoardVo  board);
	public  List<BoardVo>     boardList();
	public  BoardVo           boardView(BoardVo vo);
	public  void              boardDelete(int bno);
	public  void              boardUpdate(BoardVo vo);
	public  void              boardHitUpdate(BoardVo vo);
	public  List<BoardVo>     getWriter(String writer);
	
	public  List<CommentVo>   commentList(CommentVo vo);
	public  void              commentAdd(CommentVo vo);
	
	public void commentDelete(CommentVo vo);
	
}


