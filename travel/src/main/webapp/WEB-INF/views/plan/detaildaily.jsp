<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel</title>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<style>

    label {
        font-size: 32px; 
        font-family: 'Arial', sans-serif; 
        font-weight: bold;   
        color: #595959;     
    }
    
    .container{
      height: auto;
      border-bottom: 1px solid #d4d4d4;
      margin: 4px 10px;
    
    }
    #plantitle {
        font-size: 18px; 
        font-family: Arial, sans-serif; 
        font-weight: bold;   
        color: #595959;   
        
    }
    
        #title {
        width: 300px; 
        height: 30px;
        font-size: 16px;      
    }
    
    #time1{
     height: 25px;
    }
    
    #cont1{
     height: 25px;
     width: 200px;
    
    }
      #submitButton {
        background-color: #4CAF50; 
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
    #submitButton:hover {
    background-color: #45a049;
    }
    
    #step {
        margin-bottom: 8px; 
    }
    
    #plan {
     height: 150px;
     width:  500px;
    }
    #submitbutton{
    text-align: right;
    width: 700px;
    }
    .styled-button {
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius: 5px;
}
    .home-styled-button {
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 8px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius: 5px;
}

.styled-button:hover {
  background-color: #45a049;
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
               <div id=step>
               <label for="title<%= i %>" id="plantitle">STEP1:  </label>
               <input type="text" id="time1" name="time1" placeholder="예) 09:00">
               <input type="text" id="cont1" name="cont1" placeholder="예) 9:00 부산역 - 9:30 차이나타운 ~~"> <br>
               </div>
               
               <div id=step>
               <label for="title<%= i %>" id="plantitle">STEP2:  </label>
               <input type="text" id="time1" name="time2" placeholder="예) 09:00">
               <input type="text" id="cont1" name="cont2" placeholder="예) 9:00 부산역 - 9:30 차이나타운 ~~"> <br>
               </div>
               
               <div id=step>
               <label for="title<%= i %>" id="plantitle">STEP3:  </label>
               <input type="text" id="time1" name="time3" placeholder="예) 09:00">
               <input type="text" id="cont1" name="cont3" placeholder="예) 9:00 부산역 - 9:30 차이나타운 ~~"> <br>
               </div>
               
               <div id=step>
               <label for="title<%= i %>" id="plantitle">STEP4:  </label>
               <input type="text" id="time1" name="time4" placeholder="예) 09:00">
               <input type="text" id="cont1" name="cont4" placeholder="예) 9:00 부산역 - 9:30 차이나타운 ~~"> <br>
               </div>
               
               <div id=step>
               <label for="title<%= i %>" id="plantitle">STEP5:  </label>
               <input type="text" id="time1" name="time5" placeholder="예) 09:00">
               <input type="text" id="cont1" name="cont5" placeholder="예) 9:00 부산역 - 9:30 차이나타운 ~~"> <br>
               </div>
               
               <div id=step>
               <label for="title<%= i %>" id="plantitle">STEP6:  </label>
               <input type="text" id="time1" name="time6" placeholder="예) 09:00">
               <input type="text" id="cont1" name="cont6" placeholder="예) 9:00 부산역 - 9:30 차이나타운 ~~"> <br>
               </div>

               <div id=step>
               <label for="title<%= i %>" id="plantitle">세부 일정:  </label><br>
               <textarea class="form-control" id="plan"  name="plan"  rows="7" placeholder="예) 이번 여행은 해운대에서 가서 노는거야. 더베이~" ></textarea>
               </div>
            </div>
        </div>
        <br>
    </form>
<% } %>
	<div id= submitbutton>
	<a href="/" class="home-styled-button">홈</a> <input type="submit" value="Submit" onclick="submitForms()" class="styled-button">
	</div>
<script>
function submitForms() {
	
	let requests = [];
	
	 for (let i = 1; i <= <%= dateListSize %>; i++) {
	        let form = document.getElementById("form" + i);
	        let formData = new FormData(form);

	        let request = axios.post('/Plan', formData);
	        requests.push(request);
	    }

	    // 모든 axios 요청이 완료된 후에 페이지 이동
	    axios.all(requests)
	        .then(axios.spread(function () {
	            // 여기에 이동을 위한 코드를 넣으세요.
	            // 예를 들어:
	            alert("데이터를 보냈습니다"); 	
	            location.href = "/TravelPlan"; // 이동할 페이지 URL
	        }))
	        .catch(function (errors) {
	        	alert("양식이 잘못되었습니다"); 
	        });
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