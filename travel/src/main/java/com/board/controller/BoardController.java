package com.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.board.domain.BoardVo;
import com.board.domain.CommentVo;
import com.board.mapper.BoardMapper;

@Controller
public class BoardController {
   
   @Autowired
   private  BoardMapper   boardMapper;
   
   // 목록
   //@RequestMapping("/List")
   @GetMapping("/List")
   public  ModelAndView  list(@RequestParam(defaultValue="1") int page, Model model) {
      
	   // 페이지 사이즈 
	   int pageSize = 10;
       // page      -> 현재 페이지
	   // start     -> 현재 페이지의 BNO 시작 부분
	   // end       -> 현재 페이지의 BNO 끝 부분
	   // totalPage -> 전체 페이지
	   
      // 전체 게시물 수 조회
      int totalCount = boardMapper.getBoardCount();
      
      // 총 페이지 수 계산
      int totalPage = (int) Math.ceil((double) totalCount/pageSize);
      
      // 현재 페이지의 시작 레코드 인덱스
      int start = (((page -1) * pageSize) +1) ;
      
      Map<String, Object> params = new HashMap<>();
      params.put("start", start);
      params.put("end", page * pageSize);
      System.out.println("스타트"+start);
      // 현재 페이지에 페이지에 해당하는 게시물 목록 조회
      List<BoardVo> boardList = boardMapper.pageBoardList(params);
      
      //List<BoardVo>  boardList = boardMapper.boardList();      
      //System.out.println(boardList);
      
      ModelAndView mv = new ModelAndView();
      mv.addObject("brdList", boardList);
      mv.addObject("currentPage", page);
      mv.addObject("totalPages", totalPage);
      mv.setViewName("list");
      return mv;
   }
   
   // 새글 쓰기
   @RequestMapping("/WriteForm")
   public  ModelAndView   writeForm() {
      
      // write.jsp
      ModelAndView  mv  = new ModelAndView();
      mv.setViewName("write");      
      return mv;
   }
   
   // 새글저장 /Write?title=새 글쓰기&writer=글쓰니&content=내욘
   @RequestMapping("/Write")
   public  ModelAndView  write(BoardVo vo) {
   //public  ModelAndView  write(String GTitle, String writer, String content) {
      
      // db 저장 (title, writer, content)
      boardMapper.boardInsert(vo);
      
      // 저장후 이동할 페이지
      ModelAndView  mv = new ModelAndView();
      mv.setViewName("redirect:/List" );
      return mv;
      
   }
   
   // /View?bno=3
   @RequestMapping("/View")
   public  ModelAndView   view(BoardVo vo) {
      
      // 조회수 증가 (hit = hit + 1)
      boardMapper.boardHitUpdate( vo );
      
      // bno 으로  view.jsp 필요한 정보를 조회
      BoardVo       boardVo =  boardMapper.boardView( vo ); 
      
      //System.out.println( boardVo );
      
      ModelAndView  mv      =  new ModelAndView();
      mv.addObject("vo", boardVo);
      mv.setViewName("view");
      return mv;
   }
   
   @RequestMapping("/Delete/{bno}")
   public  ModelAndView   delete(@PathVariable("bno") int bno  ) {
      
      boardMapper.boardDelete( bno );
      
      ModelAndView  mv  = new ModelAndView();
      mv.setViewName("redirect:/List");
      return  mv;      
   }
   
   @RequestMapping("/UpdateForm/{bno}")
   public  ModelAndView  updateForm(@PathVariable("bno") int bno) {
               
      // 수정할 Vo 를 검색
      BoardVo  vo      = new BoardVo();
      vo.setBno(bno);
      BoardVo  boardVo = boardMapper.boardView( vo );
      
      ModelAndView  mv = new ModelAndView();
      mv.addObject("vo", boardVo);
      mv.setViewName("update");   // update.jsp
      return mv;
   }
   
   @RequestMapping("/Update")
   public  ModelAndView   update(BoardVo vo) {
      
      boardMapper.boardUpdate(vo);
      
      ModelAndView  mv  = new ModelAndView();      
      mv.setViewName("redirect:/List");
      return mv;
   }
   
   // 댓글목록조회 : ajax 처리
   @GetMapping("/comment")
   @ResponseBody
   public  List<CommentVo>  commentList(CommentVo vo) {
      
      List<CommentVo> commentList = boardMapper.commentList( vo );
      //System.out.println(commentList);
      
      return commentList;
      
   }
   
   // 댓글추가 : ajax 처리
   @PostMapping("/comment")
   @ResponseBody
   public  List<CommentVo>  commentAdd(CommentVo vo) {
      
      System.out.println("comment:" + vo);
      // 넘어온 정보를 댓글로 저장
      boardMapper.commentAdd( vo );
      
      // 저장된 전체 댓글 목록 조회
      List<CommentVo> commentList = boardMapper.commentList( vo );
      //System.out.println(commentList);
      
      return commentList;
      
   }
   
// 댓글 삭제 : ajax
	@DeleteMapping("/comment")
	@ResponseBody
	public  List<CommentVo>  commentDelete(CommentVo vo) {
		System.out.println("delete:"  + vo.getCno());
		boardMapper.commentDelete( vo );
				
		List<CommentVo> commentList = boardMapper.commentList( vo );				
		return commentList;
		
	}
   
	  @GetMapping("/search")
	  @ResponseBody
	   public  ModelAndView  boardSearch(@RequestParam("keyword") String keyword, Model model) {
	      
		    System.out.println("1"+keyword);
		    List<BoardVo> searchResult = boardMapper.boardSearch(keyword);
	        System.out.println("2" + searchResult);
	        int currentPage=1;
	        int totalPages=1;
	        ModelAndView mv = new ModelAndView();
	        mv.addObject("brdList", searchResult);
	        mv.addObject("currentPage", currentPage);
	        mv.addObject("totalPages", totalPages);
	        mv.setViewName("list");
	        return mv;
	   }
	
	
}














