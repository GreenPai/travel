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
  
  #pageNumbers {
    font-size: 20px;
  }
  
  #profile{
  width:400px;
  height:1000px;
  
  }
  
/* 검색창에 대한 CSS 수정 */
form {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 20px; /* 아래 여백 추가 */
}

form input[type="text"] {
    padding: 8px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 4px;
    margin-right: 8px; /* 간격 조절 */
}

form button[type="submit"] {
    padding: 8px 16px;
    font-size: 16px;
    background-color: #007BFF;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
  
  
#list {
    background-color: #808080; /* 원하는 배경색으로 변경 */	
}
    
 #main {
        padding: 0 150px; /* 좌우 여백을 200px로 설정 */
    }
  
#wrapper {
    display: flex;
    justify-content: center;
    align-items: center; /* 세로 중앙 정렬을 위해 추가 */
}

.left-div, .right-div {
    flex: 1; /* 동일한 공간을 차지하도록 설정 */
    max-width: 50%; /* 최대 너비를 50%로 설정하여 중간에서 만나도록 */
}
</style>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
<%@include file="/WEB-INF/views/include/header.jsp"%>

	<br>
	<br>




<div id="wrapper" class="wrap naverid">
 
<header  class="left-div">
    <div class="header_subindex">

    <div class="gnb_area">
        <a href="/" >
            <span class="blind">TRAVEL</span>
        </a>    
    </div>

 

    <!--프로필-사진,아이디,메일주소,2단계인증알림-->
     <div>
        <div class="profile_inner">
            <a href="#" onclick="changeImage()" class="photo">
                <img src=/img/user.jpg width="84" height="84" alt="프로필 이미지">
                <span class="photo_edit"></span>
            </a>
            <div class="profile">
                <p class="useid">wsh</p>
                <p class="usemail">clsrntkdgh@naver.com</p>
            </div>         
        </div>
    </div>

    <div>

        <ul class="left_menu" role="menu">
            <li>
                <a href="/" class="left_item" >
                    <div class="menu_text on">내프로필</div>
                </a>
            </li>
            <li>
                <a href="/" class="left_item">
                    <div class="menu_text ">일정 관리</div>
                </a>
            </li>          
        </ul>
    
        <footer class="left_footer" role="contentinfo">
            <ul class="left_guide">
                <li><a href="/Logout" class="left_item">
                        <div class="footer_text">로그아웃</div>
                    </a></li>
             
            </ul>
        </footer>     
    </div>

    </div>

   
    <div id="container"  class="right-div">
        <!-- container -->
        <div id="content" class="content">
            <div class="subindex_wrap" role="main">

                <div class="subindex_item">
    <div class="subindex_greenbox">
        <div class="myprofile">
            <div class="info_title">
                <h3 class="title_text">기본정보</h3>
            </div>
            <ul class="myinfo_area">
                <li>
                    <div class="myphoto">
                        <img src="/img/user.jpg" width="56" height="56" alt="내 프로필 이미지">
                    </div>
                </li>
                <li>
                    <div class="myaccount">
                        <div class="myname">
                            <div class="name_text">우상호</div>
                            <button type="button" class="btn_edit" onclick="changeName()">
                                <span class="text">실명수정</span>
                            </button>
                        </div>
                        <div class="myaddress">clsrntkdgh@naver.com</div>
                    </div>
                </li>
            </ul>
        </div>

        <ul class="subindex_row">
            <li>
                <div id="phoneNoRegDiv" class="row_item phone ">
                    <span id="phoneNoRegSpan" class="item_text">+82 10-2***-0***</span>
                    <button type="button" id="phoneNoRegBtn" class="btn_edit" onclick="showPhoneNumberChangePopUp()">
                        <span id="phoneNoRegBtnTxt" class="text">수정</span>
                    </button>
                </div>
            </li>

            <li>
                <div class="row_item mail ">
                    <span id="myLetterEmailRegSpan" class="item_text">cl******@n*******.com</span>
                    <button type="button" class="btn_edit" onclick="showMyLetterEmailChangePopUp()">
                        <span class="text">수정</span>
                    </button>
                </div>
                <div id="pswdEmailRegDiv" class="row_item mail not">
                    <span id="pswdEmailRegSpan" class="item_text">본인확인 이메일 없음</span>
                    <button type="button" id="pswdEmailRegBtn" class="btn_accent" onclick="showPswdEmailChangePopUp()">
                        <span id="pswdEmailRegBtnTxt" class="text">등록</span>
                    </button>
                </div>               
            </li>
              <div class="drop_link">
        <a href="javascript:;" class="btn_link" onclick="goMemberDelete()">
            <span class="text">회원탈퇴</span>
        </a>
    </div>
        </ul>
    </div>
</div>
<!--//-->

</header>



   </div>
        <!-- //container -->






 </body>
</html>





