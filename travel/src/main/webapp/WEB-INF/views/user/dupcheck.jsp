<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>List</title>
<link rel="shortcut icon" href="favicon.ico">
<link rel="stylesheet" href="/css/common.css" />
</head>
<body>

    <div id="main" style="text-align: center; margin-top: 50px;" >
        <c:choose>
            <c:when test="${cnt eq 1}">
                <img class="NONONO" src="/img/nonono.gif"><br>
                <b  style="color:red;">사용 중인</b><b> 아이디입니다.</b>
            </c:when>
            <c:otherwise>
                <img class="NONONO" src="/img/yesyesyes.gif"><br>
                <b  style="color:green;">사용가능한</b><b> 아이디입니다.</b>
            </c:otherwise>
        </c:choose>

        <p><a href="#" onclick="window.close();">창 닫기</a></p>
    </div>
</body>
</html>