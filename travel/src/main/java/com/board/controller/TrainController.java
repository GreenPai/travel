package com.board.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController 
public class TrainController {
	
	@RequestMapping("/train")
	public ModelAndView Weather() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("train/train");
		return mv;

	}

}