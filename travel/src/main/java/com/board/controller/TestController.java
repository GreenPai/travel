package com.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.board.domain.BoardVo;
import com.board.mapper.BoardMapper;

@Controller
public class TestController {
	
	@Autowired
	private   BoardMapper  boardMapper;
	
	@RequestMapping("/")
	public  ModelAndView   home( String name) {
			
		ModelAndView  mv = new ModelAndView();
		mv.addObject("irum", name);
		mv.setViewName("home");
		return mv;   
	}
	
	@RequestMapping("/test")
	@ResponseBody
	public  String  test(String str) {
		String header = str;
		return "<h2>" + header + "</h2>";		
	}
	
	@RequestMapping("/rest")
	public  ModelAndView  rest() {
		ModelAndView  mv = new ModelAndView();
		mv.setViewName("board/board");  
		return mv;
	}
	
	@RequestMapping("/writerlist")
	public ModelAndView writerlist(String writer) {
		
		List<BoardVo>  writerList = boardMapper.getWriter(writer);
		System.out.println( writerList );		
		ModelAndView mv = new ModelAndView();
		mv.addObject("wList", writerList);
		mv.setViewName("board/board");
		return mv;
	}
	
	@RequestMapping("/rest2")
	public  ModelAndView  rest2() {
		ModelAndView mv  = new ModelAndView("board/board2");		
		return mv;
	} 
	
	@GetMapping("/writer")
	@ResponseBody
	public List<BoardVo>   writer_get(BoardVo vo) {
		
		List<BoardVo> boardList = boardMapper.getWriter( vo.getWriter() );
		System.out.println( boardList );
		return boardList;  // jsp 아님, 조회한 결과 문자열(javascript data로 json)
		
	}
	

}





