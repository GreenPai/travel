<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/css/main.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<style>
  .button-container {
    display: flex;
    justify-content: center;
    align-items: center;
  }
  
  .button-container button {
    background-color: #ccc;
    color: #fff;
    padding: 5px 8px;
    border: none;
    border-radius: 10px;
    cursor: pointer;
    margin: 0 10px;
  }
  
  
#list {
    background-color: #808080; /* 원하는 배경색으로 변경 */	
}
    
 #main {
        padding: 0 150px; /* 좌우 여백을 200px로 설정 */
    }
  

.con_faq {
    overflow: hidden;
    border-top: 1px solid #111111;
}

.con_faq ul {
    overflow: hidden;
}

.con_faq ul li {
    transition: all 0.3s ease;
}

.con_faq ul li.nodata {
    padding: 20px 0 20px 0;
    font-family: "NotoSansKR Regular","Malgun Gothic","맑은 고딕";
    color: #555555;
    font-size: 15px;
    text-align: center;
    font-weight: normal;
    letter-spacing: -0.03em;
    border-bottom: 1px solid #d4d4d4;
}

.con_faq ul.faq_q {
    overflow: hidden;
    margin: 20px 0 0 0;
}

.con_faq ul.faq_q li {
}

.con_faq ul.faq_q li a {
    position: relative;
    display: block;
    padding: 18px 75px 18px 55px;
    background: #ffffff url("../images/faq_01.png") no-repeat 20px 15px;
    background-size: 25px;
    font-family: "NotoSansKR Medium","Malgun Gothic","맑은 고딕";
    color: #333333;
    font-size: 15px;
    font-weight: normal;
    line-height: 20px;
    letter-spacing: -0.03em;
    border: 1px solid #d8d8d8;
    border-top-left-radius: 4px;
    border-top-right-radius: 4px;
    word-break: keep-all;
    transition: all 0.3s ease;
}

.con_faq ul.faq_q li a:hover {
    background-color: #f5f5f5;
}

.con_faq ul.faq_q li span.arrow {
    position: absolute;
    right: 30px;
    top: 27px;
    display: inline-block;
    width: 10px;
    height: 6px;
    text-indent: -10000px;
    transition: all 0.3s ease;
}

.con_faq ul.faq_q li span.arrow.bg1 {
    background: url("../images/arrow_down.png") no-repeat 0 0;
}

.con_faq ul.faq_q li span.arrow.bg2 {
    background: url("../images/arrow_up.png") no-repeat 0 0;
}

.con_faq ul.faq_q li a:hover span.arrow.bg1 {
    transform: rotate(90deg);
}

.con_faq ul.faq_q li a:hover span.arrow.bg2 {
    transform: rotate(90deg);
}

.con_faq ul.faq_a {
    display: none;
}

.con_faq ul.faq_a li {
    padding: 20px 30px 40px 55px;
    background: #f9f9f9 url("../images/faq_02.png") no-repeat 20px 20px;
    background-size: 25px;
    font-family: "NotoSansKR Regular","Malgun Gothic","맑은 고딕";
    color: #666666;
    font-size: 15px;
    font-weight: normal;
    line-height: 23px;
    letter-spacing: -0.03em;
    border: 1px solid #d8d8d8;
    border-width: 0 1px 1px 1px;
    border-bottom-left-radius: 4px;
    border-bottom-right-radius: 4px;
}

.con_faq ul.faq_a li img {
    margin: 10px 0 10px 0;
    border: 1px solid #d8d8d8;
}



</style>

 <script>
 window.addEventListener('DOMContentLoaded', function() {
     var questions = document.getElementsByClassName('faq_q');
     for (var i = 0; i < questions.length; i++) {
         questions[i].addEventListener('click', function() {
             var answer = this.nextElementSibling;
             if (answer.style.display === 'block') {
                 answer.style.display = 'none';
             } else {
                 answer.style.display = 'block';
             }
         });
     }
 });
    </script>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
<%@include file="/WEB-INF/views/include/header.jsp"%>

	<br>
	<br>
 
	<!-- body start -->
	<div id="content">
		<div style="position: relative; width: 100%; height: 400px;">
			<img alt="back_img" src="img/beach.jpg"
				style="width: 100%; height: 100%;">
			<div
				style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); text-align: center;">
				<h1 style="color: #fff; font-size: 50px;">자주하는 질문</h1>
				<h2 style="color: black; font-size: 22px;">질문 리스트입니다</h2>
			</div>
		</div>
	</div>
  <br><br>
  <div id="main">
    <h2>Q&A</h2>
   <br>
   <div style="display: flex; gap: 10px;">
   <a href="/List?menu_id=MENU03" class="btn btn-dark">QNA 질문 게시판</a><br>
   <a href="/QNA" 	class="btn btn-dark">자주하는 질문</a><br>
   </div>
   <br>

 
  
 <div class="con_faq">
				
				
				
				
					<ul class="faq_q">
						<li>
							<a href="#none" title="어떤 웹 사이트인가요?">
								어떤 웹 사이트인가요?
								<span class="arrow bg1"></span>
							</a>
						</li>
					</ul>
					<ul class="faq_a">
						<li style="font-size:14px;">
								<span style="font-size:16px;"><strong>부산여행에 대한 정보를 알려주는 웹사이트 입니다.</strong></span>
						</li>
					</ul>
				
					<ul class="faq_q">
						<li>
							<a href="#none" title="날씨 정보는 어떻게 보나요?">
							   날씨 정보는 어떻게 보나요?
								<span class="arrow bg1"></span>
							</a>
						</li>
					</ul>
					<ul class="faq_a">
						<li style="font-size:14px;">
								<span style="font-size:16px;"><span style="font-family:맑은 고딕;">
								  <strong>
							    	메뉴에서 정보를 누르시면 부산 기상정보가 있습니다. &nbsp; <br>
							    	현재 기온, 체감온도, 풍속등의 정보를 확인할 수 있습니다.
							      </strong>
								</span></span>
						</li>
					</ul>
				
					<ul class="faq_q">
						<li>
							<a href="#none" title="공지사항에 글쓰기가 없어요">
							   공지사항에 글쓰기가 없어요
								<span class="arrow bg1"></span>
							</a>
						</li>
					</ul>
					<ul class="faq_a">
						<li style="font-size:14px;">
								<span style="font-size:16px;"><span style="font-family:맑은 고딕;">
								  <strong>
							    	관리자만 작성할 수 있는게 되어있습니다.
							      </strong>
								</span></span>
						</li>
					</ul>
				
					<ul class="faq_q">
						<li>
							<a href="#none" title="축제 정보에는 어떤게 있나요?">
							   축제 정보에는 어떤게 있나요?
								<span class="arrow bg1"></span>
							</a>
						</li>
					</ul>
					<ul class="faq_a">
						<li style="font-size:14px;">
								<span style="font-size:16px;"><span style="font-family:맑은 고딕;">
								  <strong>
							    	부산에서 진행하는 축제들의 정보가 들어있습니다.  &nbsp; <br>
							    	축제이름, 주소와 같이 필요한 정보들을 적어놨습니다.
							      </strong>
								</span></span>
						</li>
					</ul>
				
					<ul class="faq_q">
						<li>
							<a href="#none" title="건의사항이 있는데 어떻게 하나요??">
							   권의사항이 있는데 어떻게 하나요?
								<span class="arrow bg1"></span>
							</a>
						</li>
					</ul>
					<ul class="faq_a">
						<li style="font-size:14px;">
								<span style="font-size:16px;"><span style="font-family:맑은 고딕;">
								  <strong>
							    	QNA 질문 게시판을 통해서 건의사항을 주시면 됩니다.
							      </strong>
								</span></span>
						</li>
					</ul>
				
				<br><br><br>
				
			</div>
 
</body>
</html>





