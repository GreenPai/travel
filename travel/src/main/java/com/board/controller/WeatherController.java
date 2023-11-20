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
}
