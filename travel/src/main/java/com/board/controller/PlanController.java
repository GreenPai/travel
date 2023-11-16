package com.board.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.board.domain.PlanVo;
import com.board.mapper.PlanMapper;
import com.board.service.PlanService;

@RestController
@Controller
public class PlanController {
	
	@Autowired
	private PlanService planService;
	
	@Autowired
	private PlanMapper planMapper;
    
	@RequestMapping(value = "/select/planList", method = RequestMethod.POST)
	@ResponseBody
	private HashMap<String, Object> getPlanList(HttpServletRequest req, @RequestParam int searchType) {
		
		System.out.println("searchType " + searchType);
		
		HttpSession session = req.getSession();
		String userid = String.valueOf(session.getAttribute("userid"));
		
		List<PlanVo> planList = planService.getPlanList(searchType, userid);
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("planList", planList);
		
		return data;
	}
	
	@RequestMapping(value = "/insert/planList", method = RequestMethod.GET)
	@ResponseBody
	private HashMap<String, Object> addTodoList(HttpServletRequest req, @RequestParam String contents, @RequestParam int searchType) {
		
		HttpSession session = req.getSession();
		String userid = String.valueOf(session.getAttribute("userid"));
		
		int isSuccess = planService.addPlanList(contents, userid);
		System.out.println(isSuccess > 0 ? "성공" : "실패");
		
		HashMap<String, Object> data = new HashMap<>();
		data.put("isSuccess", isSuccess);
		data.put("planList", planService.getPlanList(searchType, userid));
	
		return data;
	}
	
	@RequestMapping(value = "/update/planList", method = RequestMethod.GET)
	@ResponseBody
	private HashMap<String, Object> updateComYnOfTodoList(HttpServletRequest req, @RequestParam int searchType, @RequestParam int idx) {
		
		int result = planService.updateComYnOfPlanList(idx);
		System.out.println(result);
		
		HttpSession session = req.getSession();
		String userid = String.valueOf(session.getAttribute("userid"));
		
		HashMap<String, Object> data = new HashMap<>();
		data.put("PlanList", planService.getPlanList(searchType, userid));
		 
		return data;
	}
	
	@RequestMapping(value = "/delete/planList", method = RequestMethod.POST)
	@ResponseBody
	private HashMap<String, Object> deleteTodo(HttpServletRequest req, @RequestParam int idx, @RequestParam int searchType) {
		
		
		HttpSession session = req.getSession();
		String userid = (String)session.getAttribute("userid");
		
		planService.deletePlan(idx, userid);

		List<PlanVo> planList = planService.getPlanList(searchType, userid);
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("planList", planList);
		
		return data;
	}
}