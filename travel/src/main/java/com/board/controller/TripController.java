package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.board.domain.TripVo;
import com.board.mapper.TripMapper;

@Controller
public class TripController {

	@Autowired
	private TripMapper tripMapper;

	// 여행지 정보 카드형식
	@RequestMapping("/Trip")
	public ModelAndView trip() {

		// List<TripVo> tripList = tripMapper.tripList();

		ModelAndView mv = new ModelAndView();
		// mv.addObject("tripList", tripList);
		mv.setViewName("tripp/trip");
		return mv;

	}

	// 여행지 정보
	// 'tripInform?UC_SEQ=' + row.UC_SEQ + '&MAIN_TITLE=' + row.MAIN_TITLE;
	@RequestMapping("/TripInform")
	public ModelAndView tripInform() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("tripp/tripInform");

		return mv;
	}

	// 부산 맛집 카드형식
	@RequestMapping("/Food")
	public ModelAndView food() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("tripp/food");
		return mv;
	}

	// 테마여행 카드형식
	@RequestMapping("/Tema")
	public ModelAndView tema() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("plan/tema");
		return mv;
	}

	// 편의시설 정보
	@RequestMapping("/Handi")
	public ModelAndView handi() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("inform/handi");
		return mv;
	}
	
	// 도보여행 정보
	@RequestMapping("/Walk")
	public ModelAndView walk() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("tripp/walk");
		return mv;
	}
	
	// 도보여행 상세정보
	//http://localhost/walk?UC_SEQ=58&MAIN_TITLE=%EC%B4%88%EB%9F%89%EC%9D%B4%EB%B0%94%EA%B5%AC%EA%B8%B8
	@RequestMapping("/Walkform")
	public ModelAndView walkForm(int UC_SEQ, String MAIN_TITLE) {
		
		//String UC_SEQ = Integer.parseInt(String.valueOf(row.get("UC_SEQ")));
		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("walk?UC_SEQ=" + UC_SEQ + "&MAIN_TITLE=" + MAIN_TITLE );
		return mv;
	}
	
	// 부산축제 정보
		@RequestMapping("/Festa")
		public ModelAndView Festa() {

			ModelAndView mv = new ModelAndView();
			mv.setViewName("inform/festa");
			return mv;
		}
}































