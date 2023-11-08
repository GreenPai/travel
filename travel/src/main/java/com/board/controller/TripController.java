package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.board.domain.TripVo;
import com.board.mapper.TripMapper;

@Controller
public class TripController {
	
	
	  @Autowired
	  private TripMapper tripMapper;
	 
	
	// 여행지 목록
	@RequestMapping("/Trip")
	public ModelAndView trip() {
		//List<TripVo> tripList = tripMapper.tripList();
		
		ModelAndView mv = new ModelAndView();
		//mv.addObject("tripList", tripList);
		mv.setViewName("trip");
		return mv;
		
	}
	
	// 여행지 정보
	@RequestMapping("/TripInform")
	public ModelAndView tripInform() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("tripInform");
		return mv;
	}
	
}