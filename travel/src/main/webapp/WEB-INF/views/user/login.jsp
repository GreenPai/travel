<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- Customer 스타일 추가 -->
    <link rel="stylesheet" href="/css/login.css">
  </head>
  <body class="">
    <div id="container">
      <!-- login Box -->
      <div class="login-box">
        <div id="loginBoxTitle">Travel Login</div>
        <div class="form-group">
            <label>고객 아이디</label>
            <input type="text" name="uid" id="uid" class="form-control" value="" style="text-transform:uppercase;ime-mode:disabled">
        </div>
        <div class="form-group">
            <label>비밀번호</label>
            <input type="password" name="upw" id="upw" class="form-control" value="" autocomplete="off">
        </div>
        <div id="login-btn-box">
            <div style="margin-right: 10px;">

            <input type="button" id="btnLogin" value="로그인" class="btn btn-danger"></div>
            <a href="LoginAgree">
            <div style=""><input type="button" id="btnLogin" value="회원가입" class="btn btn-danger"></div>
            </a>
        </div>
      </div><!-- login Box //-->
    </div>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  </body>
</html>