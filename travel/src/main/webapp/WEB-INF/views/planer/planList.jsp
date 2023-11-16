<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="static/css/plan.css" rel="stylesheet" type="text/css">
<script src="static/js/common.js"/></script>

</head>
<body>
	<div class="list_box">
		<div class="time_wrap">
			<div>
				<input type="date" id="currentDate">
			</div>
			<div class="time_wrap_box">
				<div id="box_hour1"></div>
				<div id="box_hour2"></div>
				<span></span>
				<div id="box_minite1"></div>
				<div id="box_minite2"></div>
			</div>
		</div>
		<div class="btn_box">
			<div class="subTab">
				<li class="active" value="0" onclick="changeType(0)">ALL</li>
				<li value="1" onclick="changeType(1)">ACTIVE</li>
				<li value="2" onclick="changeType(2)">COMPLETED</li>
				<div class="btnAdd" onclick="clickAddBtn()">
					Add
				</div>
			</div>
		</div>
		
		<div class="list">
			<c:choose>
				<c:when test="${fn:length(planList) == 0}">
					<span class="empty_notice">등록된 할 일이 없습니다.</span>
				</c:when>
				<c:otherwise>
					<c:forEach var="item" items="${ planList }">
						<li class="list${ item.idx } ${ item.complete_yn == 'Y' ? 'checked' : '' }">
							<input type="checkbox" value="${ item.idx }" id="middle${ item.idx }" ${ item.complete_yn == 'Y' ? 'checked' : ''}><label for="middle${ item.idx }">${ item.contents }</label>
							<button class="delBtn" onclick="deletePlan(${ item.idx })" style="display: none;">삭제</button>
						</li>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>