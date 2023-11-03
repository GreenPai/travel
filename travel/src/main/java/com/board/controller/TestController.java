package com.board.controller;

import java.util.List;

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
	
	
	// http://localhost
	@RequestMapping("/")
	public  ModelAndView   home( String name) {
		//String  name = "안유진";
		ModelAndView  mv = new ModelAndView();
		mv.addObject("irum", name);
		mv.setViewName("home");
		return mv;   // /WEB-INF/views/ home .jsp
	}
	
	
	// http://localhost/test?str=hello
	@RequestMapping("/test")
	@ResponseBody
	public  String  test(String str) {
		String header = str;
		return "<h2>" + header + "</h2>";		
	}
	
	//---------------------------------
	// 페이지 이동
	@RequestMapping("/rest")
	public  ModelAndView  rest() {
		ModelAndView  mv = new ModelAndView();
		mv.setViewName("board/board");  // /WEB-INF/views/ board/board .jsp
		return mv;
	}
	
	// 조회한 결과 출력 
	@RequestMapping("/writerlist")
	public ModelAndView writerlist(String writer) {
		
		// 조회
		List<BoardVo>  writerList = boardMapper.getWriter(writer);
		System.out.println( writerList );		
		ModelAndView mv = new ModelAndView();
		mv.addObject("wList", writerList);
		mv.setViewName("board/board");
		return mv;
	}
	
	// rest2 : ajax 방식
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
	
	
	
		
	// 조회
	
	// 사용자중복확인 페이지이동
	//@RequestMapping("/")
	
}





