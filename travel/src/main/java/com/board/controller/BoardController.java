package com.board.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.board.domain.BoardVo;
import com.board.domain.CommentVo;
import com.board.mapper.BoardMapper;
import com.board.mapper.UserMapper;
import com.board.domain.UserVo;

@Controller
public class BoardController {

	@Autowired
	private BoardMapper boardMapper;
	@Autowired
    private UserMapper  userMapper;
	
	// 목록
	@RequestMapping("/List")
	public ModelAndView list() {
		List<BoardVo> boardList = boardMapper.boardList();
		System.out.println(boardList);

		ModelAndView mv = new ModelAndView();
		mv.addObject("brdList", boardList);
		mv.setViewName("list");
		return mv;
	}

	// 새글 쓰기
	@RequestMapping("/WriteForm")
	public ModelAndView writeForm() {

		// write.jsp
		ModelAndView mv = new ModelAndView();
		mv.setViewName("write");
		return mv;
	}

	// 새글저장 /Write?title=새 글쓰기&writer=글쓰니&content=내욘
	@RequestMapping("/Write")
	public ModelAndView write(BoardVo vo) {
		// public ModelAndView write(String GTitle, String writer, String content) {

		// db 저장 (title, writer, content)
		boardMapper.boardInsert(vo);

		// 저장후 이동할 페이지
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/List");
		return mv;

	}

	// /View?bno=3
	@RequestMapping("/View")
	public ModelAndView view(BoardVo vo) {

		// 조회수 증가 (hit = hit + 1)
		boardMapper.boardHitUpdate(vo);

		// bno 으로 view.jsp 필요한 정보를 조회
		BoardVo boardVo = boardMapper.boardView(vo);

		// System.out.println( boardVo );

		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", boardVo);
		mv.setViewName("view");
		return mv;
	}

	@RequestMapping("/Delete/{bno}")
	public ModelAndView delete(@PathVariable("bno") int bno) {

		boardMapper.boardDelete(bno);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/List");
		return mv;
	}

	@RequestMapping("/UpdateForm/{bno}")
	public ModelAndView updateForm(@PathVariable("bno") int bno) {

		// 수정할 Vo 를 검색
		BoardVo vo = new BoardVo();
		vo.setBno(bno);
		BoardVo boardVo = boardMapper.boardView(vo);

		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", boardVo);
		mv.setViewName("update"); // update.jsp
		return mv;
	}

	@RequestMapping("/Update")
	public ModelAndView update(BoardVo vo) {

		boardMapper.boardUpdate(vo);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/List");
		return mv;
	}

	// 댓글목록조회 : ajax 처리
	@GetMapping("/comment")
	@ResponseBody
	public List<CommentVo> commentList(CommentVo vo) {

		List<CommentVo> commentList = boardMapper.commentList(vo);
		// System.out.println(commentList);

		return commentList;

	}

	// 댓글추가 : ajax 처리
	@PostMapping("/comment")
	@ResponseBody
	public List<CommentVo> commentAdd(CommentVo vo) {

		System.out.println("comment:" + vo);
		// 넘어온 정보를 댓글로 저장
		boardMapper.commentAdd(vo);

		// 저장된 전체 댓글 목록 조회
		List<CommentVo> commentList = boardMapper.commentList(vo);
		// System.out.println(commentList);

		return commentList;

	}

	// 댓글 삭제 : ajax
	@DeleteMapping("/comment")
	@ResponseBody
	public void commentDelete(CommentVo vo) {

		boardMapper.commentDelete(vo);
	}

	
	
	/*
	@RequestMapping("/Login")
	public ModelAndView login() {

		// login.jsp
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/login");
		return mv;
	}

	@RequestMapping("/LoginWrite")
	public ModelAndView loginWrite() {

		// login.jsp
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/loginwrite");
		return mv;
	}

	@RequestMapping("LoginAgree")
	public ModelAndView loginAgree() {

		// login.jsp
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/agree");
		return mv;
	}

	// 회원가입 /User/WriteForm
	@RequestMapping("/User/WriteForm")
	public String writeform(@RequestParam(value = "agree", defaultValue = "false") Boolean agree) throws Exception {
		if (!agree) {
			return "redirect:/";
		} else {
			return "/user/loginwrite";
		}
	}

	// 회원가입폼에서 정보 들고오기
	@RequestMapping("/Login/Form")
	public ModelAndView loginForm(@ModelAttribute UserVo vo, Model model) {
		LocalDate indate = LocalDate.now();
		vo.setIndate(indate.toString());
		System.out.println(vo);
		userMapper.loginForm(vo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/");
		return mv;
		
	}
	
	// 회원중복체크
	
	@RequestMapping("/User/DupCheck")
	public ModelAndView dupCheck(UserVo vo) {
		
		int cnt = userMapper.dupCheck(vo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("cnt", cnt);
		mv.setViewName("user/dupcheck");
		return mv;
		
	}
	
	*/
	/*

	// 닉네임중복체크
	@RequestMapping("/User/NickDupCheck")
	public String nicDupCheck(UserVo vo, Model model) {
		int cnt = userService.nickDupCheck(vo);
		model.addAttribute("cnt", cnt);
		return "user/nickdupcheck";
	}

*/	
	
	
}
