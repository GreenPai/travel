<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
   integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
   crossorigin="anonymous">
<link rel="stylesheet" href="/css/main.css" />

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
   integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
   crossorigin="anonymous"></script>
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
   integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
   crossorigin="anonymous"></script>
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
   integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
   crossorigin="anonymous"></script>
   
</head>
<body>
   <div id="main">
      <h2>내용보기</h2>

      <div class="mb-3">
         <label for="formBno" class="form-label"><b style="color: red"></b>글번호</label>
         <input type="text" class="form-control" readonly name="bno"
            id="formBno" value="${ vo.bno }">
      </div>
      <div class="mb-3">
         <label for="formTitle" class="form-label"><b
            style="color: red"></b>제목</label> <input type="text" class="form-control"
            readonly name="bno" id="formTitle" value="${ vo.title }">
      </div>
      <div class="mb-3">
         <label for="formWriter" class="form-label"><b
            style="color: red">*</b>글쓴이</label> <input type="text" class="form-control"
            readonly name="writer" id="formWriter" value="${ vo.writer }">
      </div>
      <div class="mb-3">
         <label for="formRegdate" class="form-label"><b
            style="color: red">*</b>날짜</label> <input type="text" class="form-control"
            readonly name="regdate" id="formRegdate" value="${ vo.regdate }">
      </div>
      <div class="mb-3">
         <label for="formHit" class="form-label"><b style="color: red">*</b>조회수</label>
         <input type="text" class="form-control" readonly name="hit"
            id="formHit" value="${ vo.hit }">
      </div>
      <div class="mb-3">
         <label for="formContent" class="form-label">내용</label>
         <textarea class="form-control" id="formContent" name="content"
            readonly rows="5">${ vo.content }</textarea>
      </div>
      <div class="mb-3">
         <input type="button" class="btn btn-dark" id="formUpdate"
            value="수정하기"> <input type="button" class="btn btn-dark"
            id="formDelete" value="삭제하기""> <input type="button"
            class="btn btn-dark" id="formWrite" value="새글 쓰기"> <input
            type="button" class="btn btn-dark" id="formHome" value="Home">
      </div>

      <!-- 댓글 작성 -->
      <hr>
      <div class="mb-3">
         <label for="formCommentWriter" class="form-label"><b
            style="color: red">*</b>댓글작성자</label> 
         <input type="text" class="form-control"
             id="formCommentWriter" >
      </div>
      <div class="mb-3">
         <label for="formComment" class="form-label">댓글 입력</label>
         <textarea class="form-control" id="formComment" name="comment"
            rows="5" placeholder="댓글을 입력하세여"></textarea>
      </div>
      <div class="mb-3">
         <input type="button" class="btn btn-dark" id="commentAdd"
            value="댓글 작성">         
      </div>
      <hr>
      <div id="commentList">         
      </div>
   </div>
   <!-- div main end -->

   <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

   <script>
     const  btnEls = document.querySelectorAll('input[type="button"]');
      let    url    = '';
      btnEls.forEach( ( btn ) => {       // Array.from(tag).forEach()
       //  alert(btn.id);
         btn.addEventListener('click', () => {         
            switch(btn.id) {
            case "formUpdate": location.href = '/UpdateForm/${vo.bno}';  break;
            case "formDelete": location.href = '/Delete/${vo.bno}';  break;
            case "formWrite":  location.href = '/WriteForm';         break;
            case "formHome":   location.href = '/';                  break;
            default:  break;        
            }             
         } )         
      } );      
    </script>

   <script>
    // ajax 로 댓글 목록을 조회 출력
    axios.get('/comment', {
       params: {
         bno : ${ vo.bno }
       }
     })
     .then(function (response) {
       console.log(response.data);
       let  commentList = response.data;
       let  tag  = '';
       for(let comment of commentList) {
          tag  +=  '<div class="mb-3">'
          tag  +=  '<div><b>' + comment.writer   +  '</b>:(' + comment.wdate + ')</div>'
          tag  +=  '<div>'    + comment.content  +  '</div>'
          tag  +=  '<input type="button" class="btn btn-secondary btn-sm" data-idx="' + comment.cno + '" '
          tag  +=  ' name="formCommentDelete" value="댓글 삭제"">'
       }
       
       const  commentListEl = document.querySelector('#commentList');       
       commentListEl.innerHTML = tag;
       
       
       const  formCommentDeleteEls = document.querySelectorAll('[name="formCommentDelete"]')
        for(let i=0; i < formCommentDeleteEls.length;i++ ) {
           let delBtn = formCommentDeleteEls[i];
           delBtn.onclick = function(e) {  
              console.dir(this)
              alert(this.dataset.idx)
           }
        }
       
     })
     .catch(function (error) {
    	 console.log(click);
     })
     .finally(function () {
       // 항상 실행되는 영역
     });
    
     //------------------------------------------------------
     // 댓글 작성을 클릭하면 댓글 추가
     // axios 에서 post 방식으로 값을 controller 전달할때
     // 1. axios.post(`/comment`, null, params : {}           // 두번째 파라미터 null 추가
     // 2. axios.post(`/comment`, new URLSearchParams( {} )   // new URLSearchParams
      
     const  commentAddEl = document.querySelector('#commentAdd');
     commentAddEl.addEventListener('click', () => {
    
        const commentEl   = document.querySelector('#formComment')
        let content = commentEl.value;
        const comWriterEl = document.querySelector('#formCommentWriter')
        let   comWriter   = comWriterEl.value        
       
    //    axios.post(`/comment`, null, {
    //          params: {
    //                  writer  : comWriter, 
    //                content : content,
    //                bno     : ${ vo.bno }
    //         } 
    //        })
    // ajax 로 서버에 값을 전달하여 저장하고 결과를 돌려받는다.
    
        axios.post(`/comment`, new URLSearchParams( {              
                      writer  : comWriter, 
                    content : content,
                    bno     : ${ vo.bno }             
              })
             )
            .then(function (response) {
              let  commentList = response.data;
              let  tag  = '';
              for(let comment of commentList) {
                 tag  +=  '<div class="mb-3">'
                 tag  +=  '<div><b>' + comment.writer   +  '</b>:(' + comment.wdate + ')</div>'
                 tag  +=  '<div>'    + comment.content  +  '</div>'
                 tag  +=  '<input type="button" class="btn btn-dark-sm" \
                   id="formDelete" value="댓글 삭제"">'
              }              
              
              const  commentListEl = document.querySelector('#commentList');              
              commentListEl.innerHTML = tag;
               
              // 추가된 댓글 삭제 버튼에 이벤트 연결
              const  formCommentDeleteEls = document.querySelectorAll('[name="formCommentDelete"]')
               for(let i=0; i < formCommentDeleteEls.length;i++ ) {
                  let delBtn = formCommentDeleteEls[i];
                  delBtn.onclick = function(e) {   
                     console.dir(this)
                     // tag 없는 속성을 추가할때 data-속성명 - 새로운 속성을 만들수있다
                     // js 에서 추가된 속성을 조작
                     // console.dir(this) : dataset 속성안에 저정된다.
                     // this.dataset.cno
                     let cno = this.idx;
                     alert(cno)
                     
                     //서버에 가서 삭제한 후 돌아온다
                     axios.delete('/comment?cno='+ cno)
                        .then((res) => {
                           console.dir(res.data);
                           alert('삭제')
                           let  commentList = res.data;
	     		      		 let  tag  = '';
	     		      		 for(let comment of commentList) {
	     		      		    	tag  +=  '<div class="mb-3">'
	     		      		    	tag  +=  '<div><b>' + comment.writer   +  '</b>:(' + comment.wdate + ')</div>'
	     		      		    	tag  +=  '<div>'    + comment.content  +  '</div>'
	     		      		    	tag  +=  '<input type="button" class="btn btn-dark-sm" \
	     		      					id="formDelete" value="댓글 삭제"">'
	     		      		 }    	
	     		      		 const  commentListEl = document.querySelector('#commentList');    		    
	     	    		     commentListEl.innerHTML = tag;   
   		    		   })
   		    		   .catch((err) => { alert(err) })
                  }
               }
              
            })
            .catch(function (error) {
              console.log(error);
            })
            .finally(function () {
              // 항상 실행되는 영역
            });
     })
     
     //--------------------------
     
   
    </script>

</body>
</html>




























