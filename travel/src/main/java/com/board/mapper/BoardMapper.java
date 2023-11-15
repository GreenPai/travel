package com.board.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.board.domain.BoardVo;
import com.board.domain.CommentVo;
import com.board.domain.FileVo;


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
	public int getBoardCount(String menuid);
	public List<BoardVo> pageBoardList(Map<String, Object> params);
	public List<BoardVo> boardSearch(String keyword);
	public BoardVo getBno(BoardVo vo);
	public void insertFile(FileVo fileVo);
	public List<FileVo> boardFileList(BoardVo vo);
	public void insertImgFile(FileVo fileVo);
	public List<FileVo> getFileName(BoardVo vo);

	
}


