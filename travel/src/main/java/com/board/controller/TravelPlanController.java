package com.board.controller;
		
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
		import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.board.domain.BoardVo;
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
			
			//일정 잡기 초기화면
			@RequestMapping("/TravelPlan")
			public ModelAndView travelPlan() {
			
				
				   // OpenWeatherMap API 호출
			    RestTemplate restTemplate = new RestTemplate();
			    String url = "https://api.openweathermap.org/data/2.5/forecast?lat=35.1578&lon=129.0600&lang=en&appid=32c9e2ef977a4ebfaedd69cc117bb42a";
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
			            String main = node.path("weather").get(0).path("main").asText();

			            if (weatherMapper.countByDtTxt(dt_txt) == 0) {
			                WeatherVo weather = new WeatherVo(dt_txt, description, temp_max, temp_min, main);
			                weatherMapper.insertWeather(weather);
			            }
			        }
			    } catch (JsonProcessingException e) {
			        e.printStackTrace();
			    }
		
			    
			    List<DailyVo> planList = userMapper.GetPlanList();
			    
			    for (DailyVo daily : planList) {
				       
					 String day = daily.getToday_date();
					 String[] parts = day.split(" "); // 공백을 기준으로 문자열 분할
					 String datePart = parts[0]; // 날짜 부분
					 daily.setToday_date(datePart);
				
			         String username = userMapper.getName(daily.getUserid()); 
			         daily.setUserid(username);
			    }
			    
			    
				ModelAndView mv = new ModelAndView();
				mv.addObject("planList", planList);
				mv.setViewName("plan/travel_plan");
				return mv;
			}


			//일정 잡기 나의 페이지
			@RequestMapping("/TravelMyPlan")
			public ModelAndView travelMyPlan(HttpServletRequest request) {
			
				HttpSession session = request.getSession();
		        String userid = (String) session.getAttribute("userid");
		        
			    List<DailyVo> planList = userMapper.GetUserPlanList(userid);
			    
			    for (DailyVo daily : planList) {
				       
					 String day = daily.getToday_date();
					 String[] parts = day.split(" "); // 공백을 기준으로 문자열 분할
					 String datePart = parts[0]; // 날짜 부분
					 daily.setToday_date(datePart);
				
			         String username = userMapper.getName(daily.getUserid()); 
			         daily.setUserid(username);
			    }
			    
			    
				ModelAndView mv = new ModelAndView();
				mv.addObject("planList", planList);
				mv.setViewName("plan/travel_plan");
				return mv;
			}

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
			
			@RequestMapping("/PlanView")
			public ModelAndView planView(HttpServletRequest request, DailyVo vo) {
				
 				List<DailyVo> dailyVo = userMapper.GetTnoPlanList(vo); 
                int num= 0;				
				  for (DailyVo daily : dailyVo) {
				       
						 String day = daily.getPlan_date();
						 String[] parts = day.split(" "); // 공백을 기준으로 문자열 분할
						 String datePart = parts[0]; // 날짜 부분
						 daily.setPlan_date(datePart);
					
						 String today = daily.getToday_date();
						 String[] todayparts = today.split(" "); // 공백을 기준으로 문자열 분할
						 String todatePart = todayparts[0]; // 날짜 부분
						 daily.setToday_date(todatePart);
						 num = daily.getTno();
				         String username = userMapper.getName(daily.getUserid()); 
				         daily.setUserid(username);
				    }
				
				
				ModelAndView mv = new ModelAndView();
			    mv.addObject("planList", dailyVo);
			    mv.addObject("tno", num);
			    mv.setViewName("plan/view");
			    
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
				
				//날씨 넣기
				List<DailyVo> dayList = userMapper.dailyGet(dailyVo);
				WeatherVo weatherVo = weatherMapper.weatherGet(date);
				// WeatherVo weatherVo = new WeatherVo() ;
				
				// System.out.println(weatherVo);

				if (weatherVo != null) {
					dailyVo.setDescription(weatherVo.getDescription());
					dailyVo.setTempMax(Double.toString(weatherVo.getTemp_max()));
					dailyVo.setTempMin(Double.toString(weatherVo.getTemp_min()));
					dailyVo.setMain(weatherVo.getMain());
				}
				else {
					dailyVo.setDescription("정보 없음");
					dailyVo.setTempMax("정보 없음");
					dailyVo.setTempMin("정보 없음");
					dailyVo.setMain("정보 없음");
					
				}
				
								
				 for (DailyVo daily : dayList) {
				       
					 String day = daily.getPlan_date();
					 String[] parts = day.split(" "); // 공백을 기준으로 문자열 분할
					 String datePart = parts[0]; // 날짜 부분
					 String timePart = parts[1]; // 시간 부분

				 }

				 // dayList의 형태가 시, 분, 초가 나옴으로서 
				// dateList에서 일까지 자름
				List<String> dateList2 = new ArrayList<>(); // 새로운 배열을 저장할 리스트 생성
				
				String day= "";
				String[] parts = null;
				String datePart = "";
				
				 for (DailyVo daily : dayList) {
				   					 			 
					day = daily.getPlan_date();
					parts = day.split(" "); // 공백을 기준으로 문자열 분할
					datePart = parts[0]; // 날짜 부분
					
					 if (date.equals(datePart)) {
				
						 userMapper.dailyDateDelete(date);	
						
						 dayList = userMapper.dailyGet(dailyVo);
				
						 for (DailyVo daily2 : dayList) {
							 day = daily2.getPlan_date();
							 parts = day.split(" "); // 공백을 기준으로 문자열 분할
							 datePart = parts[0]; // 날짜 부분
						     daily2.setPlan_date(datePart);
						//	 dateList2.add(datePart); // 새로운 배열에 날짜 부분을 추가
						 }
						 
						 ModelAndView mv = new ModelAndView();
			             mv.addObject("date", date);
			             mv.addObject("dayList", dayList);
			             mv.addObject("dateList", dateList2);
			             mv.setViewName("plan/daily");
			             return mv;
					 }

				 }
						
		        userMapper.dailyInsert(dailyVo);
		        
		        dayList = userMapper.dailyGet(dailyVo);
                
		        for (DailyVo daily2 : dayList) {
					 day = daily2.getPlan_date();
					 parts = day.split(" "); // 공백을 기준으로 문자열 분할
					 datePart = parts[0]; // 날짜 부분
					 daily2.setPlan_date(datePart);
				//	 dateList2.add(datePart); // 새로운 배열에 날짜 부분을 추가
				 }
		        
                ModelAndView mv = new ModelAndView();
                mv.addObject("date", date);
                mv.addObject("dayList", dayList);
                mv.addObject("dateList", dateList2);
                mv.setViewName("plan/daily");
                return mv;
		    }
			
			// 데일리의 날짜 정보를 등록 
						@RequestMapping("/UpdateWeather")
						public ModelAndView UpdateWeather(HttpServletRequest request,
								@RequestParam("date") String date,
                                @RequestParam("tempMax") String tempMax,
                                @RequestParam("tempMin") String tempMin,
                                @RequestParam("description") String description) {
							
							HttpSession session = request.getSession();
					        DailyVo dailyVo = new DailyVo();
					        String userid = (String) session.getAttribute("userid");
					        dailyVo.setUserid(userid);
					        dailyVo.setPlan_date(date);
					        dailyVo.setTempMax(tempMax);
					        dailyVo.setTempMin(tempMin);
					        dailyVo.setDescription(description);

							// 날씨 정보 추가
							WeatherVo weatherVo = weatherMapper.weatherGet(date);

							session.setAttribute("selectedDate", date);

							List<DailyVo> dayList = userMapper.dailyGet(dailyVo);

							// dayList의 형태가 시, 분, 초가 나옴으로서 
							// dateList에서 일까지 자름
							List<String> dateList2 = new ArrayList<>(); // 새로운 배열을 저장할 리스트 생성
							
							String day= "";
							String[] parts = null;
							String datePart = "";
							
							 for (DailyVo daily : dayList) {
							   					 			 
								day = daily.getPlan_date();
								parts = day.split(" "); // 공백을 기준으로 문자열 분할
								datePart = parts[0]; // 날짜 부분
								
								 if (date.equals(datePart)) {
									
									 userMapper.dailyDateDelete(date);	
									
									 dayList = userMapper.dailyGet(dailyVo);
							
									 for (DailyVo daily2 : dayList) {
										 day = daily2.getPlan_date();
										 parts = day.split(" "); // 공백을 기준으로 문자열 분할
										 datePart = parts[0]; // 날짜 부분
									
										 dateList2.add(datePart); // 새로운 배열에 날짜 부분을 추가
									 }
									 
									 ModelAndView mv = new ModelAndView();
						             mv.addObject("date", date);
						             mv.addObject("dayList", dayList);
						             mv.addObject("dateList", dateList2);
						             mv.setViewName("plan/daily");
						             return mv;
								 }

							 }
							 
							 
					        userMapper.dailyWeatherInsert(dailyVo);				        
					        dayList = userMapper.dailyGet(dailyVo);
			          //      System.out.println(dayList);
					        for (DailyVo daily2 : dayList) {
								 day = daily2.getPlan_date();
								 parts = day.split(" "); // 공백을 기준으로 문자열 분할
								 datePart = parts[0]; // 날짜 부분
							
								 dateList2.add(datePart); // 새로운 배열에 날짜 부분을 추가
							 }
					        
			                ModelAndView mv = new ModelAndView();
			                mv.addObject("date", date);
			                mv.addObject("dayList", dayList);
			                mv.addObject("dateList", dateList2);
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

			
			// 일정 세우기 눌렀을때 데이터를 넘기면서 이동 
			@RequestMapping("/DetailDaily")
			public ModelAndView DetailDaily(HttpServletRequest request) {
               				
				HttpSession session = request.getSession();
		        DailyVo dailyVo = new DailyVo();
		        String userid = (String) session.getAttribute("userid");
		        dailyVo.setUserid(userid);
		            				
		        List<DailyVo> dayList = userMapper.dailyGet(dailyVo);
				int num = userMapper.dailynumGet();
		        for (DailyVo daily : dayList) {
		        String plan =daily.getPlan_date();
		        String days =daily.getToday_date(); 
		        String user =daily.getUserid(); 
		        dailyVo.setPlan_date(plan);
		        dailyVo.setToday_date(days);
		        dailyVo.setUserid(userid);
		        dailyVo.setTno(num);
		          
		        userMapper.dailyListInsert(dailyVo);
		        }


		        List<DailyVo> dayListFinal = userMapper.dailyListGet(dailyVo);
		        
		        List<String> dateList2 = new ArrayList<>();
		        
		        for (DailyVo daily2 : dayListFinal) {
					 String day = daily2.getPlan_date();
					 
					 dateList2.add(day); // 새로운 배열에 날짜 부분을 추가
				 }
		        
		        System.out.println(dayListFinal.size());
		        
		        ModelAndView mv = new ModelAndView();
				mv.addObject( "dateList"  , dayListFinal);
				mv.addObject( "dateList2" , dateList2);
				mv.addObject("dateListSize", dayListFinal.size());
		        mv.setViewName("plan/detaildaily");

				return mv;
			}
			
	
			@RequestMapping("/Plan")
		    public ModelAndView Plan(HttpServletRequest request, 
		    		@RequestParam(value ="title") List<String> titles,
		    		@RequestParam(value ="cont1", defaultValue = " ") List<String>  cont1,
		    		@RequestParam(value ="time1", defaultValue = " ") List<String>  time1,
		    		@RequestParam(value ="cont2", defaultValue = " ") List<String>  cont2,
		    		@RequestParam(value ="time2", defaultValue = " ") List<String>  time2,	    	
		    		@RequestParam(value ="cont3", defaultValue = " ") List<String>  cont3,
		    		@RequestParam(value ="time3", defaultValue = " ") List<String>  time3,	    	
		    		@RequestParam(value ="cont4", defaultValue = " ") List<String>  cont4,
		    		@RequestParam(value ="time4", defaultValue = " ") List<String>  time4,	    	
		    		@RequestParam(value ="cont5", defaultValue = " ") List<String>  cont5,
		    		@RequestParam(value ="time5", defaultValue = " ") List<String>  time5,	    	
		    		@RequestParam(value ="cont6", defaultValue = " ") List<String>  cont6,
		    		@RequestParam(value ="time6", defaultValue = " ") List<String>  time6,	    	
		    		@RequestParam(value ="plan", defaultValue = " ") List<String>  plan,	    	
		    		@RequestParam("num")   List<Integer>  num
		    		
		    	) {
						
		        HttpSession session = request.getSession();
		        String userid = (String) session.getAttribute("userid");
		
    	        int tnum = userMapper.gettno(userid);
    	        List<DailyVo> volist = userMapper.getDaily(userid);   	        
    	        
    	        DailyVo dailyVo = new DailyVo();
    	 
		      	 // 데이터를 순서대로 매핑하여 DailyVo에 설정
		        for (int i = 0; i < titles.size(); i++) {
		        	int j = num.get(i) - 1;
		        	DailyVo vo = volist.get(j);
		        	System.out.println(vo);
		        	dailyVo.setPlan_date(vo.getPlan_date());
		        	dailyVo.setToday_date(vo.getToday_date());
		            dailyVo.setTitles(titles.get(i)); // title 설정
		            dailyVo.setNum(num.get(i));     // num 설정
		            dailyVo.setCont1(cont1.get(i)); // cont1 설정
		            dailyVo.setTime1(time1.get(i)); // time1 설정
		            dailyVo.setCont2(cont2.get(i)); // cont2 설정
		            dailyVo.setTime2(time2.get(i)); // time2 설정
		            dailyVo.setCont3(cont3.get(i)); // cont3 설정
		            dailyVo.setTime3(time3.get(i)); // time3 설정
		            dailyVo.setCont4(cont4.get(i)); // cont4 설정
		            dailyVo.setTime4(time4.get(i)); // time4 설정
		            dailyVo.setCont5(cont5.get(i)); // cont5 설정
		            dailyVo.setTime5(time5.get(i)); // time5 설정
		            dailyVo.setCont6(cont6.get(i)); // cont6 설정
		            dailyVo.setTime6(time6.get(i)); // time6 설정
		            dailyVo.setPlan(plan.get(i));
		            dailyVo.setUserid(userid);
		            dailyVo.setTno(tnum);
		
		            userMapper.planInsert(dailyVo);
		        }
		        
		        ModelAndView mv = new ModelAndView();
			    mv.setViewName("/plan/daily");
				return mv;

		    }

			
			// 플랜 삭제
			@RequestMapping("/PlanDelete")
			public ModelAndView PlanDelte(HttpServletRequest request, DailyVo vo) {
			
				userMapper.deletePlan(vo);
				
				ModelAndView mv = new ModelAndView();

			    mv.setViewName("redirect:/TravelPlan");
			    return mv;
			}
			
             // 플랜 수정
			
			// 일정 세우기 눌렀을때 데이터를 넘기면서 이동 
			@RequestMapping("/UpdatePlan")
			public ModelAndView UpdatePlan(HttpServletRequest request, DailyVo vo) {
               				
				HttpSession session = request.getSession();

		        String userid = (String) session.getAttribute("userid");
		        vo.setUserid(userid);
		            				
		        List<DailyVo> dayList = userMapper.GetTnoPlanList(vo);

		        List<String> dateList2 = new ArrayList<>();
		        
		        int num=0;
		        for (DailyVo daily : dayList) {
	            if(num< daily.getNum()) {
	            	num=daily.getNum();
	            }  
		        }
		        
	
		     // 새로운 리스트들을 만들어서 요소를 분배
		        DailyVo list1 = new DailyVo();
		        DailyVo list2 = new DailyVo();
		        DailyVo list3 = new DailyVo();
		        DailyVo list4 = new DailyVo();
		        

		        
		        // 각 리스트에 해당하는 요소를 추가
		        if (dayList.size() >= 4) {
		            list1=dayList.get(0);
		            list2=dayList.get(1);
		            list3=dayList.get(2);
		            list4=dayList.get(3);
		        } else if (dayList.size() >= 3) {
		            list1=dayList.get(0);
		            list2=dayList.get(1);
		            list3=dayList.get(2);
		        } else if (dayList.size() >= 2) {
		            list1=dayList.get(0);
		            list2=dayList.get(1);
		        } else if (dayList.size() >= 1) {
				    list1=dayList.get(0);
			}
              ModelAndView mv = new ModelAndView();
		        mv.addObject("list1", list1);
		        mv.addObject("list2", list2);
		        mv.addObject("list3", list3);
		        mv.addObject("list4", list4);
		        mv.addObject("li1", list1.getTime1());
		        mv.addObject("li2", list2.getTime1());
		        mv.addObject("li3", list3.getTime1());
		        mv.addObject("li4", list4.getTime1());
				mv.addObject( "dateList"  , dayList);
				mv.addObject("dateListSize", num);
		        mv.setViewName("plan/updatedaily");

				return mv;
			}
			
			
			@RequestMapping("/UpdatePlanList")
			public ModelAndView UpdatePlanList(HttpServletRequest request, DailyVo vo) {
			
			    System.out.println(vo);	
			    System.out.println("---------------------");	
				userMapper.dailyUpdate(vo);
	
    			ModelAndView mv = new ModelAndView();

			    mv.setViewName("redirect:/TravelPlan");
			    return mv;
			}
			
			
			
			
			
			}
		
			
		
