		package com.board.controller;
		
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
		
			// 여행지 정보 카드형식
			@RequestMapping("/Trip")
			public ModelAndView trip() {
		
				ModelAndView mv = new ModelAndView();
				mv.setViewName("tripp/trip");
				return mv;
		
			}
		
			// 여행지 상세 정보
			@RequestMapping("/TripView")
			public ModelAndView tripView(TripVo vo) {
		
				TripVo tripVo = tripMapper.getTrip(vo);
		
				ModelAndView mv = new ModelAndView();
				mv.addObject("vo", tripVo);
				mv.setViewName("tripInform/tripView");
				return mv;
			}
		
			// 부산 맛집 카드형식
			@RequestMapping("/Food")
			public ModelAndView food() {
		
				ModelAndView mv = new ModelAndView();
				mv.setViewName("tripp/food");
				return mv;
			}
			
			// 부산 맛집 상세정보
			@RequestMapping("/FoodView")
			public ModelAndView foodView(TripVo vo) {
				

				TripVo tripVo = tripMapper.getTrip(vo);
		
				ModelAndView mv = new ModelAndView();
				mv.addObject("vo", tripVo);
				mv.setViewName("tripInform/foodView");
				return mv;
			}
			
		
			// 테마여행 카드형식
			// http://localhost/tema?UC_SEQ=58
			@RequestMapping("/Tema")
			public ModelAndView tema() {
		
				ModelAndView mv = new ModelAndView();
				mv.setViewName("plan/tema");
				return mv;
			}
		
			@RequestMapping("/TemaView")
			public ModelAndView temaView(TripVo vo) {
		
				TripVo tripVo = tripMapper.getTrip(vo);
		
				ModelAndView mv = new ModelAndView();
				mv.addObject("vo", tripVo);
				mv.setViewName("tripInform/temaView");
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
			@RequestMapping("/WalkView")
			public ModelAndView walkView(TripVo vo) {
		
				TripVo tripVo = tripMapper.getTrip(vo);
		
				ModelAndView mv = new ModelAndView();
				mv.addObject("vo", tripVo);
				mv.setViewName("tripInform/walkView");
				return mv;
			}
		
			// 부산축제 정보
			@RequestMapping("/Festa")
			public ModelAndView Festa() {
		
				ModelAndView mv = new ModelAndView();
				mv.setViewName("inform/festa");
				return mv;
			}
			
			// 부산 축제 상세정보
			@RequestMapping("/FestaView")
			public ModelAndView festaView(TripVo vo) {
		
				TripVo tripVo = tripMapper.getTrip(vo);
		
				ModelAndView mv = new ModelAndView();
				mv.addObject("vo", tripVo);
				mv.setViewName("tripInform/festaView");
				return mv;
			}
		
			@RequestMapping("/Park")
			public ModelAndView park() {
		
				ModelAndView mv = new ModelAndView();
				mv.setViewName("inform/park");
				return mv;
			}
		}
