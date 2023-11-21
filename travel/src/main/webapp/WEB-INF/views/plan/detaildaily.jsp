<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<c:forEach var="index" begin="1" end="${dateListSize}">
  <label>Day ${index}</label>
  <input type="text" name="day${index}" placeholder="입력하세요">
</c:forEach>

</body>
</html>