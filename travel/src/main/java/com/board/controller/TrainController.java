package com.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


import com.board.mapper.TrainMapper;


@RestController 
public class TrainController {
	
    @Autowired
    private TrainMapper trainMapper;
	
	@RequestMapping("/train")
	public ModelAndView train() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("train/train");
		return mv;
	}
		

}
