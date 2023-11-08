<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>로그인</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- Customer 스타일 추가 -->
<link rel="stylesheet" href="/css/login.css">
</head>
<body class="">
	<div id="container">
		<!-- login Box -->
		<form action="/LoginCheck" method="POST">
			<div class="login-box">
				<div id="loginBoxTitle">Travel Login</div>
				<div class="form-group">
					<label>고객 아이디</label> <input type="text" name="userid" id="userid"
						class="form-control" value="" style="ime-mode: disabled">
				</div>
				<c:if test="${loginError == '사용자를 찾을 수 없습니다.'}">
					<div style="color: red;">사용자를 찾을 수 없습니다.</div>
				</c:if>
				<div class="form-group">
					<label>비밀번호</label> <input type="password" name="passwd"
						id="passwd" class="form-control" value="" autocomplete="off">
				</div>
				<c:if test="${loginError == '비밀번호가 일치하지 않습니다.'}">
					<div style="color: red;">비밀번호가 일치하지 않습니다.</div>
				</c:if>
				<div id="login-btn-box">
					<div style="margin-right: 10px;">
						<input type="submit" id="btnLogin" value="로그인"
							class="btn btn-danger btn-sm">
					</div>
					<div style="">
						<input type="button" id="btnNewLogin" value="회원가입"
							class="btn btn-danger">
					</div>
				</div>
				<div></div>
			</div>
			<!-- login Box //-->
		</form>
	</div>

	<!-- Bootstrap Bundle with Popper -->
	<script>
	/*
	// 회원가입으로 넘어가는  버튼
	const LoginEl = document.querySelector('#btnLogin');
	LoginEl.addEventListener('click',(e) => {
		location.href='LoginCheck';
	})
	*/
	
	// 회원가입으로 넘어가는 버튼
	const NewLoginEl = document.querySelector('#btnNewLogin');
	NewLoginEl.addEventListener('click',(e) => {
		location.href='LoginAgree';
	})
	
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>