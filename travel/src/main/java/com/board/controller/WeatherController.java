package com.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WeatherController {

	@RequestMapping("/Weather")
	public ModelAndView Weather() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("tripInform/weatherView");
		return mv;

	}
	
	@RequestMapping("/testmap")
	public ModelAndView testmap() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("map/loadmap");
		return mv;
		
	}
	
	@RequestMapping("/parkmap")
	public ModelAndView parkmap() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("map/parkmap");
		return mv;
		
	}
	
	@RequestMapping("/restaurantmap")
	public ModelAndView restaurantmap() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("map/restaurantmap");
		return mv;
		
	}
	
	@RequestMapping("/localmap")
	public ModelAndView localmap() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("map/localmap");
		return mv;
		
	}
}
