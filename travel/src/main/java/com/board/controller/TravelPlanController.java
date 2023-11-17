package com.board.controller;
		
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
		import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.board.domain.BoardVo;
import com.board.domain.CommentVo;
import com.board.domain.DailyVo;
import com.board.domain.FileVo;
import com.board.domain.TripVo;
import com.board.mapper.DailyMapper;
import com.board.mapper.TripMapper;
import com.board.mapper.UserMapper;
		
		@Controller
		public class TravelPlanController {
		
			@Autowired
			private TripMapper tripMapper;
			
			@Autowired
			private UserMapper userMapper;
		    
			@Autowired
			private DailyMapper dailyMapper;
			
			// 경상남도 레저 상세정보
			@RequestMapping("/TravelPlan")
			public ModelAndView travelPlan() {
				
				ModelAndView mv = new ModelAndView();
				mv.setViewName("plan/travel_plan");
				return mv;
			}

			// 경상남도 레저 상세정보
			@RequestMapping("/PlanWriteForm")
			public ModelAndView planWriteForm(HttpServletRequest request) {
				
				ModelAndView mv = new ModelAndView();
				mv.setViewName("plan/writeplan");
				return mv;
			}

			@RequestMapping("/P3")
			public ModelAndView p3(HttpServletRequest request) {
				
				ModelAndView mv = new ModelAndView();
				mv.setViewName("plan/daily");
				return mv;
			}
			
			/*
			@RequestMapping("/DailyUpdate")
		    public String handleDailyUpdate(@RequestParam("date") String date) {
		        // 여기서 할 일: 전달된 날짜(date)를 이용한 작업 수행
		        // 예를 들어, 특정 작업을 수행하고 나중에 다른 페이지로 리디렉션할 수 있습니다.
                System.out.println(date);
		        // 리디렉션할 페이지의 URL을 반환
		        return "redirect:/P3";
		    }
			*/
				
			
			
			// 테이블에서 유저가 고른 날짜를 보여주기 위해서 
			// 테이블에 날짜를 저장하고 데이터를 들고오는것.
			
			@RequestMapping(value = "/DailyUpdate", method = RequestMethod.GET)
		    public ModelAndView handleDailyUpdate(@RequestParam("date") String date, HttpServletRequest request) {
		        				
				HttpSession session = request.getSession();
		        DailyVo dailyVo = new DailyVo();
		        String userid = (String) session.getAttribute("userid");
		        System.out.println(userid);
		        dailyVo.setUserid(userid);
		        dailyVo.setPlan_date(date);
			        
				session.setAttribute("selectedDate", date);

		        userMapper.dailyInsert(dailyVo);
                List<DailyVo> dayList = userMapper.dailyGet(dailyVo);
                System.out.println(dayList);
                
                ModelAndView mv = new ModelAndView();
                mv.addObject("date", date);
                mv.addObject("dayList", dayList);
                mv.setViewName("plan/daily");
                return mv;
		    }
			
			@RequestMapping("/DeleteDaily")
			public ModelAndView DeleteDaily(HttpServletRequest request) {
				
				HttpSession session = request.getSession();
				String userid = (String) session.getAttribute("userid");
				userMapper.dailyDelete(userid);
				ModelAndView mv = new ModelAndView();
				mv.setViewName("redirect:/P3");
				return mv;
			}

			@RequestMapping("/DetailDaily")
			public ModelAndView DetailDaily(HttpServletRequest request) {
				
				HttpSession session = request.getSession();
		        DailyVo dailyVo = new DailyVo();
		        String userid = (String) session.getAttribute("userid");
		        dailyVo.setUserid(userid);
		            				
		        List<DailyVo> dayList = userMapper.dailyGet(dailyVo);
				
		        for (DailyVo daily : dayList) {
		        //	userMapper.dailyListInsert(daily);
		        String plan =daily.getPlan_date();
		        String days =daily.getToday_date(); 
		        String user =daily.getUserid(); 
		        dailyVo.setPlan_date(plan);
		        dailyVo.setToday_date(days);
		        dailyVo.setUserid(userid);
		        
		        userMapper.dailyListInsert(dailyVo);
		        }
				// System.out.println("실험입니다"+dayList);
				
				//userMapper.dailyListInsert(dayList);
				//userMapper.dailyDelete(userid);
				ModelAndView mv = new ModelAndView();
				mv.setViewName("plan/detaildaily");
				return mv;
			}
			
		}
