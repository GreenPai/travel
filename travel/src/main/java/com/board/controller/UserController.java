package com.board.controller;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
public class UserController {

	@Autowired
	private BoardMapper boardMapper;
	@Autowired
	private UserMapper userMapper;

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
		userMapper.loginForm(vo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/");
		return mv;

	}

	// 로그인창에서 로그인 정보 확인하기
	// 로그인 아이디랑 비밀번호 확인
	@RequestMapping("/LoginCheck")
	public ModelAndView loginCheck(UserVo vo , HttpServletRequest request) {
		
		//System.out.println(vo);
        UserVo uservo = userMapper.loginCheck(vo);
        ModelAndView mv = new ModelAndView();
      
        //비밀번호 확인
        String userwd = vo.getPasswd();
        String wd     = uservo.getPasswd();
      
      
        if(uservo == null)
        {
        	mv.addObject("loginError","사용자를 찾을 수 없습니다.");
        	mv.setViewName("user/login");
        return mv;
        }      
          
        if(wd.equals(userwd)) {
        	
        	HttpSession session = request.getSession();
        	session.setAttribute("userid", uservo.getUserid());     // 아이디
 	        session.setAttribute("userpw", wd);                     // 비밀번호
 	        session.setAttribute("username", uservo.getUsername()); // 유저이름
 	        session.setAttribute("useremail", uservo.getEmail());   // 이메일      
 	        session.setAttribute("nickname", uservo.getNickname()); // 닉네임
            session.setAttribute("admin", uservo.getAdmin());       // 관리자권한
                  
        	mv.setViewName("redirect:/");
    		return mv;
        }      
        else{
        	mv.addObject("loginError","비밀번호가 일치하지 않습니다.");
        	mv.setViewName("user/login");
        return mv;
        }
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
	
	@RequestMapping("/Logout")
	public String logout(HttpServletRequest request) {
	    HttpSession session = request.getSession();
	    if (session != null) {
	        session.invalidate(); // 세션 무효화
	    }
	    return "/home"; 
	}	
	
	@RequestMapping("/User/MyPage")
	public ModelAndView Mypage(UserVo vo) {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/mypage");
		return mv;

	}
	
	

}
