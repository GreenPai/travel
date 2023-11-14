package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.domain.PlanVo;
import com.board.service.PlanService;

@Controller
@RequestMapping("/")
public class PlanController {
	
	@Autowired
	private PlanService planService;

	public String todo(Model model, @PageableDefault(sort="id", direction = Direction.DESC)Pageable pageable, Todo todo) {
		model.addAttribute("planlist", planService.todo목록(pageable));
		return "todo";
	}
	
}