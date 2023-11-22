<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel</title>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<style>
    /* 레이블의 스타일을 변경합니다. */
    label {
        font-size: 32px; 
        font-family: 'Arial', sans-serif; 
        font-weight: bold;   
        color: #595959;     
    }
    
    .container{
      height: 300px;
      border-bottom: 1px solid #d4d4d4;
    
    }
    #plantitle {
        font-size: 18px; 
        font-family: Arial, sans-serif; 
        font-weight: bold;   
        color: #595959;   
    }
    
        #title {
        width: 300px; /* 입력 필드의 너비를 300px로 조정합니다. */
        height: 30px;
        font-size: 16px; /* 글꼴 크기를 16px로 변경합니다. */
        /* 추가적인 스타일을 필요에 따라 여기에 추가합니다. */
    }
    
    #time1{
     height: 25px;
    }
    
    #cont{
     height: 25px;
     width: 200px;
    
    }
      #submitButton {
        background-color: #4CAF50; /* Green */
        border: none;
        color: white;
        padding: 10px 25px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        cursor: pointer;
        border-radius: 10px;
    }
</style>
</head>
<body>

<%
    int dateListSize = (int) request.getAttribute("dateListSize");
%>
<br><br>



<% for (int i = 1; i <= dateListSize; i++) { %>
    <form id="form<%= i %>" action="/Plan" method="post" enctype="multipart/form-data">
        <div class="container">
            <label for="date<%= i %>">Date <%= i %> :</label>
            <br>
            <input type="button" value="지역 검색" onclick="openNewWindow()" id="submitButton">
            <br><br>
            <div class="form-group">
                <label for="title<%= i %>" id="plantitle">일정 이름:</label><br>
               <input type="hidden" name="num" value="<%= i %>">
               <input type="text" id="title" name="title" placeholder="예) 서면 여행">
               <br><br>
               <label for="title<%= i %>" id="plantitle">일정:</label><br>
                <label for="title<%= i %>" id="plantitle">STEP1:  </label>
               <input type="text" id="time1" name="time1" placeholder="예) 09:00">
               <input type="text" id="cont1" name="cont1" placeholder="예) 9:00 부산역 - 9:30 차이나타운 ~~"> <br>
            </div>
        </div>
        <br>
    </form>
<% } %>
<input type="submit" value="Submit" onclick="submitForms()">

<script>
function submitForms() {
    for (let i = 1; i <= <%= dateListSize %>; i++) {
    	let form = document.getElementById("form" + i);
        let formData = new FormData(form);
        
        axios.post('/Plan', formData)
        .then(function (response) {
            console.log(response);
        })
        .catch(function (error) {
            console.log(error);
        });
    }
}

    function openNewWindow() {
        // 새 창을 엽니다.
        window.open("QNA", "_blank","width=1000, height=800");
      }
</script>

<% for (int i = 1; i <= dateListSize; i++) { %>
    <form id="form<%= i %>" action="/Plan" method="post" enctype="multipart/form-data">
        <!-- form 내용 -->
    </form>
<% } %>

    


</body>
</html>