<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel</title>
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
   integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
   crossorigin="anonymous">
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
<link rel="stylesheet" href="/css/main.css" />
<link rel="stylesheet" href="/css/new_main.css" />
<style>
.fileplus {
  border: 1px solid #ced4da; /* 테두리 설정 */
  border-radius: 10px; /* 테두리의 모서리를 둥글게 설정 */
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 그림자 설정 */
  padding: 5px; /* 내부 여백 설정 */
}

  #main {
        padding: 0 200px; /* 좌우 여백을 200px로 설정 */
        background: #fff;
        padding-bottom: 20px;
        border: 3px solid #999999; /* 검정색 선 추가 */
        border-radius: 20px; /* 모서리를 둥글게 설정 */
        margin: 20px auto; /* 주변 여백 추가 및 가운데 정렬 */
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 그림자 설정 */
        width: 1400px; /* 가로 크기 설정 */
        height: auto; /* 세로 크기 설정 */
    }


/* Shape Container */
.shape-container {
    display: flex;
    flex-wrap: wrap;
    gap: 60px;
    justify-content: center; /* 가로 방향으로 중앙 정렬 */
}

/* 각 Shape */
.shape {
    border: 1px solid #ccc;
    padding: 10px;
    border-radius: 5px;
    width: 200px;
    text-align: center;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    border-bottom: 1px solid #ccc;
}

/* 시간 스타일 */
.time {
    font-weight: bold;
    margin-bottom: 5px;
      border-right: 1px solid #ccc;
}

.plan {
text-decoration: underline;
text-align: left;
font-weight: bold;
}
/* 내용 스타일 */
.content {
    margin-bottom: 8px;
    font-weight: bold;
     border-right: 1px solid #ccc;
    /* 내용 스타일 지정 */
}

.buttons{
  display: flex;
    justify-content: flex-end;
    gap: 10px; 
    margin-right: 250px; 
    margin-bottom: 30px; 
}
</style>
</head>
<body>
   <%@include file="/WEB-INF/views/include/header.jsp" %>
   <br>
	<div id="content">
		<div style="position: relative; width: 100%; height: 400px;">
			<img alt="back_img" src="img/beach.jpg"
				style="width: 100%; height: 100%;">
			<div
				style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); text-align: center;">
				<h1 style="color: #fff; font-size: 50px;">일정</h1>
				<h2 style="color: black; font-size: 22px;">여러분의 자유로운 여행기를 보세요</h2>
			</div>
		</div>
	</div>
  <br><br>
   <br>
   <br>
   <br>
   <br>
   
    <div class = buttons>  
      <a href="/PlanDelete?tno=${tno}" 	class="btn btn-dark">삭제</a>
      <a href="/UpdatePlan" 	class="btn btn-dark">수정</a>
      <a href="/" 	class="btn btn-dark">홈</a>   
   </div>
   <c:forEach var="plan" items="${ planList }">
   
  <div id="main">

<br><br>	  
  <h1>Day ${plan.num}</h1>
    <div class="mb-3">
        <label for="formTitle" class="form-label"><b style="color: red"></b>제목:</label>
        <input type="text" class="form-control" readonly name="bno" id="formTitle" value="${ plan.titles }">
    </div>
<div class="mb-3" style="display: flex; gap: 20px; justify-content: space-between;">
 
    <div style="flex: 1;">
        <label for="formWriter" class="form-label"><b style="color: red"></b>글쓴이:</label>
        <input type="text" class="form-control" readonly name="writer" id="formWriter" value="${ plan.userid }">
    </div>
    <div style="flex: 1;">
        <label for="formRegdate" class="form-label"><b style="color: red"></b>작성일:</label>
        <input type="text" class="form-control" readonly name="regdate" id="formRegdate" value="${ plan.today_date }">
    </div>
    <div style="flex: 1;">
        <label for="formRegdate" class="form-label"><b style="color: red"></b>여행날짜:</label>
        <input type="text" class="form-control" readonly name="regdate" id="formRegdate" value="${ plan.plan_date }">
    </div>
</div>
 <br>
 
 <div class="shape-container">
   
    <c:choose>
    <c:when test="${not empty plan.time1}">
    <div class="shape">
        <div class="plan">Plan1:</div>
        <div class="time">시간: ${ plan.time1 }</div>
        <div class="content">여행지: ${ plan.cont1 }</div>
    </div>
         </c:when>
    <c:otherwise>
    </c:otherwise>
</c:choose>
    <c:choose>
    <c:when test="${not empty plan.time2}">
    <div class="shape">
        <div class="plan">Plan2:</div>
        <div class="time">시간: ${ plan.time2 }</div>
        <div class="content">여행지: ${ plan.cont2 }</div>
    </div>
        </c:when>
    <c:otherwise>
    </c:otherwise>
</c:choose>

    <c:choose>
    <c:when test="${not empty plan.time3}">
    <div class="shape">
        <div class="plan">Plan3:</div>
        <div class="time">시간: ${ plan.time3 }</div>
        <div class="content">여행지: ${ plan.cont3 }</div>
    </div>
      </c:when>
    <c:otherwise>
    </c:otherwise>
</c:choose>
   </div>
   <br>
   <div class="shape-container">   
   <c:choose>
    <c:when test="${not empty plan.time4}">
    <div class="shape">
        <div class="plan">Plan4:</div>
        <div class="time">시간: ${ plan.time4 }</div>
        <div class="content">여행지: ${ plan.cont4 }</div>
    </div>
     </c:when>
    <c:otherwise>
    </c:otherwise>
</c:choose>

 <c:choose>
    <c:when test="${not empty plan.time5}">
    <div class="shape">
        <div class="plan">Plan5:</div>
        <div class="time">시간: ${ plan.time5 }</div>
        <div class="content">여행지: ${ plan.cont5 }</div>
    </div>
   </c:when>
    <c:otherwise>
    </c:otherwise>
</c:choose>

  <c:choose>
    <c:when test="${not empty plan.time6}">
        <div class="shape">
            <div class="plan">Plan6:</div>
            <div class="time">시간: ${plan.time6}</div>
            <div class="content">여행지: ${plan.cont6}</div>
        </div>
    </c:when>
    <c:otherwise>
    </c:otherwise>
</c:choose>
</div>
 
    <br>
    <div class="mb-3">
        <label for="formContent" class="form-label">상세일정:</label>
        <textarea class="form-control" id="formContent" name="content" readonly rows="10">${ plan.plan }</textarea>
        
    </div>
    
       
   </div>
   <br><br>
     </c:forEach>
   
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

          tag += '<input type="button" class="btn btn-secondary btn-sm" data-idx="' + comment.cno + '" ';
          tag += 'name="formCommentDelete" value="댓글 삭제" style="margin-right: 3px;">';
          tag += '<input type="button" class="btn btn-secondary btn-sm" ';
          tag += 'name="formCommentReply" value="댓글 달기" style="margin-left: 3px;">';

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
                     let cno = this.dataset.idx;
                     //let cno = this.idx;
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
     
    // 대댓글
    </script>

</body>
</html>




























