<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <form action="http://apis.data.go.kr/1613000/TrainInfoService" method="get">
        <label for="departure">출발지:</label><br>
        <select id="departure" name="departure">
            <option value="11">서울특별시</option>
            <option value="12">세종특별시</option>
            <option value="21">서울특별시</option>
            <option value="22">세종특별시</option>
            <option value="23">서울특별시</option>
            <option value="24">세종특별시</option>
            <option value="25">서울특별시</option>
            <option value="26">세종특별시</option>
            <option value="31">서울특별시</option>
            <option value="32">세종특별시</option>
            <option value="33">서울특별시</option>
            <option value="34">세종특별시</option>
            <option value="35">서울특별시</option>
            <option value="36">세종특별시</option>
            <option value="37">서울특별시</option>
            <option value="38">세종특별시</option>
        </select><br>

        <label for="destination">도착지: 부산</label><br>
        <input type="hidden" id="destination" name="destination" value="21"><br>

        <label for="date">출발날짜:</label><br>
        <input type="date" id="date" name="date"><br>

        <label for="trainType">열차종류:</label><br>
        <select id="trainType" name="trainType">
            <option value="00">KTX</option>
            <option value="01">새마을호</option>
            <option value="02">무궁화호</option>
            <option value="03">통근열차</option>
            <option value="04">누리로</option>
            <option value="06">AREX직통</option>
            <option value="07">KTX-산천(A-type)</option>
            <option value="08">ITX-새마을</option>
            <option value="09">ITX-청춘</option>
            <option value="10">KTX-산천(B-type)</option>
            <option value="16">KTX-이음</option>
            <option value="17">SRT</option>
            <option value="18">ITX-마음</option>
        </select><br>

        <input type="submit" value="Submit">
    </form>
</body>
</html>