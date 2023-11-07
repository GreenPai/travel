package com.trip.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.trip.domain.TripVo;
import com.trip.mapper.TripMapper;

@Controller
public class TripController {
	
	
	  @Autowired
	  private TripMapper tripMapper;
	 
	
	// 여행지 목록
	@RequestMapping("/Trip")
	public ModelAndView trip() {
		List<TripVo> tripList = tripMapper.tripList();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("tripList", tripList);
		mv.setViewName("/trip");
		return mv;
		
	}

}
