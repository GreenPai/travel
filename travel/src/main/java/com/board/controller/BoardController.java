package com.board.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.board.domain.BoardVo;
import com.board.domain.CommentVo;
import com.board.domain.DailyVo;
import com.board.domain.FileVo;
import com.board.mapper.BoardMapper;

import lombok.NonNull;

@Controller
public class BoardController {
   
   @Autowired
   private  BoardMapper   boardMapper;
   
   // 목록
   //@RequestMapping("/List")
   @GetMapping("/List")
   public  ModelAndView  list(@RequestParam(defaultValue="1") int page, Model model, 
		                      @RequestParam("menu_id") String menuid) {
      
	   // 페이지 사이즈 
	   int pageSize = 10;
       // page      -> 현재 페이지
	   // start     -> 현재 페이지의 BNO 시작 부분
	   // end       -> 현재 페이지의 BNO 끝 부분
	   // totalPage -> 전체 페이지
	   
      // 전체 게시물 수 조회
      int totalCount = boardMapper.getBoardCount(menuid);
      
      // 총 페이지 수 계산
      int totalPage = (int) Math.ceil((double) totalCount/pageSize);
      
      // 현재 페이지의 시작 레코드 인덱스
      int start = (((page -1) * pageSize) +1) ;
      
      Map<String, Object> params = new HashMap<>();
      params.put("start", start);
      params.put("end", page * pageSize);
      params.put("menuid", menuid);
      
      // 현재 페이지에 페이지에 해당하는 게시물 목록 조회
      List<BoardVo> boardList = boardMapper.pageBoardList(params);
      // 현재 페이지 MENU번호에 따른 목차이름 
      String menuname=boardMapper.getBoardName(menuid);
      String menutext=boardMapper.getBoardText(menuid);
      //List<BoardVo>  boardList = boardMapper.boardList();      
      //System.out.println(boardList);
      
      ModelAndView mv = new ModelAndView();
      mv.addObject("menuid",menuid);
      mv.addObject("brdList", boardList);
      mv.addObject("currentPage", page);
      mv.addObject("totalPages", totalPage);
      mv.addObject("menuname", menuname);
      mv.addObject("menutext", menutext);
      mv.setViewName("list");
      return mv;
   }
   
   // 새글 쓰기
   @RequestMapping("/WriteForm")
   public  ModelAndView   writeForm(@RequestParam("menu_id") String menuid) {
      System.out.println(menuid);
      // write.jsp
      ModelAndView  mv  = new ModelAndView();
      mv.addObject("menuid",menuid);
      mv.setViewName("write");      
      return mv;
   }
   
   // 새글저장 /Write?title=새 글쓰기&writer=글쓰니&content=내욘
   @RequestMapping("/Write")
   public  ModelAndView  write(MultipartHttpServletRequest request, 
		                       BoardVo vo, 	
		                       HttpServletRequest loginrequest,
		                       @RequestParam("menu_id") String menuid
		                       ) {
	   HttpSession session = loginrequest.getSession();
	   String username = (String) session.getAttribute("username");
	   String userid = (String) session.getAttribute("userid");
	   String nickname = (String) session.getAttribute("nickname");
       String menu_id= menuid;
       
       vo.setMenu_id(menu_id);
   //    System.out.println(vo.getMenu_id());
	   
       // DB에 저장
	   boardMapper.boardInsert(vo);

	   FileVo fileVo = new FileVo();
	   String writer = vo.getWriter() ;
	   String title  = vo.getTitle();
	   BoardVo   boardVo = boardMapper.getBno(vo);
	   int idx    = boardVo.getBno();
	
       for( int i = 0; i <=9; i++) {
    	   
    	   MultipartFile file = request.getFile("upfile" + i);
       
       // 파일 저장
       if (file != null && !file.isEmpty()) {
           String fileName = saveFile(file); // 파일 저장 로직
       
           // 확장자 추출
           int lastIndex = fileName.lastIndexOf(".");
           if (lastIndex != -1) {
               String fileExtension = "."+ fileName.substring(lastIndex + 1);
           fileVo.setFILEEXT(fileExtension);
           }
           fileVo.setFILENAME(fileName);
           fileVo.setSFILENAME(fileName);
           fileVo.setWRITER(writer);
           fileVo.setTITLE(title);
           fileVo.setIDX(idx);
           fileVo.setWRITER(writer);
           fileVo.setTITLE(title);
           boardMapper.insertFile(fileVo);
           
           }
       }
               
      // 이미지파일 저장
       for( int i = 0; i <=9; i++) {
    	         
       MultipartFile imgfile = request.getFile("imgupfile"+ i);
       
       // 이미지파일 저장
       if (imgfile != null && !imgfile.isEmpty()) {
           String fileName = saveImgFile(imgfile); // 파일 저장 로직
       
           // 확장자 추출
           int lastIndex = fileName.lastIndexOf(".");
           if (lastIndex != -1) {
               String fileExtension = "."+ fileName.substring(lastIndex + 1);
           fileVo.setFILEEXT(fileExtension);
           }
           fileVo.setFILENAME(fileName);
           fileVo.setSFILENAME(fileName);
           fileVo.setWRITER(writer);
           fileVo.setTITLE(title);
           fileVo.setIDX(idx);
           fileVo.setWRITER(writer);
           fileVo.setTITLE(title);
           boardMapper.insertImgFile(fileVo);
           
           }
       }
      // 저장후 이동할 페이지
      ModelAndView  mv = new ModelAndView();
      mv.addObject("menu_id",menu_id);
      mv.setViewName("redirect:/List" );
      //mv.setViewName("redirect:/List?menu_id=" + menu_id);
      return mv;
      
   }
   

   // 파일 저장 로직
   private String saveFile(MultipartFile file) {
       try {
           // 저장할 경로 설정 (D:\\dev\\data에 저장되도록 설정)
           String uploadDir = "D:\\dev\\data";
           File uploadPath = new File(uploadDir);

           if (!uploadPath.exists()) {
               uploadPath.mkdirs(); // 디렉토리가 없으면 생성
           }

           // 파일명 생성 (여기서는 원본 파일명을 그대로 사용)
           String fileName = file.getOriginalFilename();
           String filePath = uploadDir + File.separator + fileName;

           // 파일 저장
           File saveFile = new File(filePath);
           file.transferTo(saveFile);

           return fileName; // 파일명 반환
       } catch (IOException e) {
           e.printStackTrace();
           return null;
       }
   }

   // 이미지 파일 저장 로직
   private String saveImgFile(MultipartFile imgfile) {
	   try {
		   // 저장할 경로 설정 (D:\\dev\\data에 저장되도록 설정)
		   String uploadDir = "C:\\Users\\GGG\\git\\travel\\travel\\src\\main\\resources\\static\\download_img";
		   File uploadPath = new File(uploadDir);
		   
		   if (!uploadPath.exists()) {
			   uploadPath.mkdirs(); // 디렉토리가 없으면 생성
		   }
		   
		   // 파일명 생성 (여기서는 원본 파일명을 그대로 사용)
		   String fileName = imgfile.getOriginalFilename();
		   String filePath = uploadDir + File.separator + fileName;
		   
		   // 파일 저장
		   File saveFile = new File(filePath);
		   imgfile.transferTo(saveFile);
		   
		   return fileName; // 파일명 반환
	   } catch (IOException e) {
		   e.printStackTrace();
		   return null;
	   }
   }

// /View?bno=3
   @RequestMapping("/View")
   public  ModelAndView   view(BoardVo vo) {
      
      // 조회수 증가 (hit = hit + 1)
      boardMapper.boardHitUpdate( vo );
      List<FileVo> filevoList = boardMapper.boardFileList(vo);
      System.out.println(" 파일리스트 "+filevoList);
      // bno 으로  view.jsp 필요한 정보를 조회
      BoardVo       boardVo =  boardMapper.boardView( vo ); 
      
	  // 파일 이름 들고오기. PNG
      List<FileVo> sfile = boardMapper.getFileName( vo );
      System.out.println("sfile" +sfile);
      // filename 이름 배열로 분리
      List<String> filenames = new ArrayList<>();
      for (FileVo filesVo : sfile) {
          filenames.add(filesVo.getSFILENAME());
      }
      
      String menuid=boardVo.getMenu_id();

      
      ModelAndView  mv      =  new ModelAndView();
      mv.addObject("vo", boardVo);
      mv.addObject("fileList",filevoList);
      mv.addObject("filepath",filenames);
      mv.addObject("menuid",menuid);
      mv.setViewName("view");
      return mv;
   }
   
   @RequestMapping("/Delete/{bno}")
   public  ModelAndView   delete(@PathVariable("bno") int bno
		   ) {

	  String menu_id= boardMapper.getMenuid(bno);
      boardMapper.boardDelete( bno );
      ModelAndView  mv  = new ModelAndView();
      System.out.println("menuid" + menu_id);
      mv.addObject("menuid", menu_id);
      mv.setViewName("redirect:/List?menu_id=" + menu_id);
      //mv.setViewName("redirect:/List");
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
	   public  ModelAndView  boardSearch(
			   @RequestParam(defaultValue="1") int page, @RequestParam("keyword") String keyword, Model model) {
	        
		  // 페이지 사이즈 
		   int pageSize = 10;
	       // page      -> 현재 페이지
		   // start     -> 현재 페이지의 BNO 시작 부분
		   // end       -> 현재 페이지의 BNO 끝 부분
		   // totalPage -> 전체 페이지
		   
	       // 검색 게시물 수 조회
		    int totalCount = boardMapper.getSearchCount(keyword);

		    // 총 페이지 수 계산
		    int totalPage = (int) Math.ceil((double) totalCount/pageSize);
		      
		    // 현재 페이지의 시작 레코드 인덱스
		    int start = (((page -1) * pageSize) +1) ;
		      
		    Map<String, Object> params = new HashMap<>();
		    params.put("start", start);
		    params.put("end", page * pageSize);
		    params.put("keyword", keyword);
		    
		    List<BoardVo> searchResult = boardMapper.boardSearch(params);
		    String menuname="검색 결과";
		    String menutext="검색";		

	        ModelAndView mv = new ModelAndView();
	        mv.addObject("brdList", searchResult);
	        mv.addObject("currentPage", page);
	        mv.addObject("totalPages", totalPage);
	        mv.addObject("menuname", menuname);
	        mv.addObject("menutext", menutext);
	   //     mv.addObject("currentPage", currentPage);
	   //     mv.addObject("totalPages", totalPages);
	        mv.setViewName("list");
	        
	        return mv;
	   }
	
	  	  	  
	//---------------------------------------------------
	   // 다운로드
	   // type : external, internal
	   // 정규식
	   // {sfile}     - .jpg 와 같이 . 포함된 문자가 들어오면 문자를 무시 : .인식하지 않는다 : 사용금지
	   // {sfile:.+}  - .+ : . 이 한 개 이상
	   //               반드시 . 을 포함해야 한다
	   @RequestMapping(value  = "/download/{type}/{sfile:.+}",
	                 method = RequestMethod.GET )
	   public   void   downloadFile(
	         @PathVariable("type")   String type,
	         @PathVariable("sfile")  String sfile,
	         HttpServletResponse     response
	         ) throws IOException {
	      
	      String     INTERNAL_FILE         =  sfile;
	      String     EXTERNAL_FILE_PATH    =  "d:\\dev\\data\\" + sfile;
	            
	      File       file  =  null;
	      if ( type.equalsIgnoreCase("internal")  ) {
	         ClassLoader   classLoader = 
	            Thread.currentThread().getContextClassLoader();
	         file   = new File( classLoader.getResource(INTERNAL_FILE).getPath() ); 
	      } else {
	         file   = new File( EXTERNAL_FILE_PATH );
	      }
	      
	      if( !file.exists()  ) {
	         String errorMessage = "죄송합니다.파일이 없습니다";
	         System.out.println( errorMessage );
	         OutputStream  outputStream = response.getOutputStream();
	         outputStream.write(  errorMessage.getBytes(Charset.forName("UTF-8")) );
	         outputStream.close();
	         return;
	      }
	      
	      // 실제 다운로드
	     // String  mimeType = URLConnection.guessContentTypeFromName(file.getName());
	      String   mimeType   =  "application/octet-stream";   // 무조건 다운로드
	      
	      // 파일명의 한글처리 - 한글파일명이 깨지지 않도록 하기위해     
	      String   fname   = new String( 
	            file.getName().getBytes("UTF-8"), "ISO-8859-1" );
	      
	      response.setContentType( mimeType );
	      response.setHeader("Content-Disposition",
	          String.format("inline; filename=\"" + fname + "\"" ));
	      
	      response.setContentLength( (int) file.length() );
	      
	      InputStream   inputStream  = new BufferedInputStream(
	         new FileInputStream( file )   );
	      
	      FileCopyUtils.copy( inputStream, response.getOutputStream() );
	      
	      inputStream.close();
	      
	      
	   }
	  
	  
	   @RequestMapping("/QNA")
	   public  ModelAndView   qna() {
	      
	      ModelAndView  mv  = new ModelAndView();      
	      mv.setViewName("/board/qna");
	      return mv;
	   }
	  
	  

}














