package com.board.controller;
		
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
		import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.board.domain.DailyVo;
import com.board.domain.WeatherVo;
import com.board.mapper.DailyMapper;
import com.board.mapper.TripMapper;
import com.board.mapper.UserMapper;
import com.board.mapper.WeatherMapper;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
		
		@Controller
		public class TravelPlanController {
		
			@Autowired
			private TripMapper tripMapper;
			
			@Autowired
			private UserMapper userMapper;
		    
			@Autowired
			private DailyMapper dailyMapper;
			
			@Autowired
			private WeatherMapper weatherMapper;
			
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

			    // OpenWeatherMap API 호출
			    RestTemplate restTemplate = new RestTemplate();
			    String url = "https://api.openweathermap.org/data/2.5/forecast?lat=35.1578&lon=129.0600&lang=kr&appid=32c9e2ef977a4ebfaedd69cc117bb42a";
			    String response = restTemplate.getForObject(url, String.class);

			    try {
			        // JSON 파싱 및 DB 저장
			        ObjectMapper objectMapper = new ObjectMapper();
			        JsonNode root = objectMapper.readTree(response);
			        JsonNode list = root.path("list");
			        for (JsonNode node : list) {
			            String dt_txt = node.path("dt_txt").asText();
			            String description = node.path("weather").get(0).path("description").asText();
			            double temp_max = node.path("main").path("temp_max").asDouble();
			            double temp_min = node.path("main").path("temp_min").asDouble();

			            if (weatherMapper.countByDtTxt(dt_txt) == 0) {
			                WeatherVo weather = new WeatherVo(dt_txt, description, temp_max, temp_min);
			                weatherMapper.insertWeather(weather);
			            }
			        }
			    } catch (JsonProcessingException e) {
			        e.printStackTrace();
			    }

			    mv.setViewName("plan/daily");
			    return mv;
			}
			
			
			// 테이블에서 유저가 고른 날짜를 보여주기 위해서 
			// 테이블에 날짜를 저장하고 데이터를 들고오는것.
			// 같은 날짜를 눌렀을때 삭제
			@RequestMapping(value = "/DailyUpdate", method = RequestMethod.GET)
		    public ModelAndView handleDailyUpdate(@RequestParam("date") String date, HttpServletRequest request) {
		        				
				HttpSession session = request.getSession();
		        DailyVo dailyVo = new DailyVo();
		        String userid = (String) session.getAttribute("userid");
		        dailyVo.setUserid(userid);
		        dailyVo.setPlan_date(date);
			        
				session.setAttribute("selectedDate", date);

				List<DailyVo> dayList = userMapper.dailyGet(dailyVo);
				
				 for (DailyVo daily : dayList) {
				       
					 String day = daily.getPlan_date();
					 String[] parts = day.split(" "); // 공백을 기준으로 문자열 분할
					 String datePart = parts[0]; // 날짜 부분
					 String timePart = parts[1]; // 시간 부분

					 if (date.equals(datePart)) {
						 userMapper.dailyDateDelete(date);	
						
						 dayList = userMapper.dailyGet(dailyVo);
						 
						 ModelAndView mv = new ModelAndView();
			             mv.addObject("date", date);
			             mv.addObject("dayList", dayList);
			             mv.setViewName("plan/daily");
			             return mv;
					 }

				 }
		        userMapper.dailyInsert(dailyVo);
		        
		        dayList = userMapper.dailyGet(dailyVo);
//                System.out.println(dayList);
                
                ModelAndView mv = new ModelAndView();
                mv.addObject("date", date);
                mv.addObject("dayList", dayList);
                mv.setViewName("plan/daily");
                return mv;
		    }
			
			
			
			// 임시 데일리 테이블의 일자를 최종 데일리 테이블로 옭기면서 임시는 지움
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
		        String plan =daily.getPlan_date();
		        String days =daily.getToday_date(); 
		        String user =daily.getUserid(); 
		        dailyVo.setPlan_date(plan);
		        dailyVo.setToday_date(days);
		        dailyVo.setUserid(userid);
		          
		        userMapper.dailyListInsert(dailyVo);
		        }

				ModelAndView mv = new ModelAndView();
				mv.setViewName("plan/detaildaily");
				return mv;
			}
			
		}
