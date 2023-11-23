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
    String li1 = (String) request.getAttribute("li1");
    String li2 = (String) request.getAttribute("li2");
    String li3 = (String) request.getAttribute("li3");
    String li4 = (String) request.getAttribute("li4");
%>
<br><br>

<% if (li1 != null) { %>
     <form id="form1" action=/UpdatePlanList method="post" enctype="multipart/form-data">
        <div class="container">
            <label for="date1">Date 1 :</label>
            <br>
            <input type="button" value="지역 검색" onclick="openNewWindow()" id="submitButton">
            <input type="button" value="맛집 검색" onclick="openNewWindow2()" id="submitButton">
            <input type="button" value="명소 보기" onclick="openNewWindow3()" id="submitButton">
            <br><br>
            <div class="form-group">
                <label for="title1" id="plantitle">일정 이름:</label><br>
               <input type="hidden" name="num" value="1">
               <input type="hidden" name="tno" value=${ list1.tno }>
               <input type="text" id="title" name="titles" placeholder="예) 서면 여행"  value=${ list1.titles}>
               <br><br>
               <label for="title1" id="plantitle">일정:</label><br>
               <div id=step>
               <label for="title1" id="plantitle">STEP1:  </label>
               <input type="text" id="time1" name="time1" placeholder="예) 09:00" value=${ list1.time1 }>
               <input type="text" id="cont1" name="cont1" value=${ list1.cont1} placeholder="예) 9:00 부산역 - 9:30 차이나타운 ~~" ><br>
               </div>
               
               <div id=step>
               <label for="title1" id="plantitle">STEP2:  </label>
               <input type="text" id="time1" name="time2" value=${ list1.time2} placeholder="예) 09:00">
               <input type="text" id="cont1" name="cont2" value=${ list1.cont2} placeholder="예) 9:00 부산역 - 9:30 차이나타운 ~~"> <br>
               </div>
               
               <div id=step>
               <label for="title1" id="plantitle">STEP3:  </label>
               <input type="text" id="time1" name="time3" value=${ list1.time3} placeholder="예) 09:00">
               <input type="text" id="cont1" name="cont3" value=${ list1.cont3} placeholder="예) 9:00 부산역 - 9:30 차이나타운 ~~"> <br>
               </div>
               
               <div id=step>
               <label for="title1" id="plantitle">STEP4:  </label>
               <input type="text" id="time1" name="time4" value=${ list1.time4} placeholder="예) 09:00">
               <input type="text" id="cont1" name="cont4" value=${ list1.cont4} placeholder="예) 9:00 부산역 - 9:30 차이나타운 ~~"> <br>
               </div>
               
               <div id=step>
               <label for="title1" id="plantitle">STEP5:  </label>
               <input type="text" id="time1" name="time5" value=${ list1.time5} placeholder="예) 09:00">
               <input type="text" id="cont1" name="cont5" value=${ list1.cont5} placeholder="예) 9:00 부산역 - 9:30 차이나타운 ~~"> <br>
               </div>
               
               <div id=step>
               <label for="title1" id="plantitle">STEP6:  </label>
               <input type="text" id="time1" name="time6" value=${ list1.time6} placeholder="예) 09:00">
               <input type="text" id="cont1" name="cont6" value=${ list1.cont6} placeholder="예) 9:00 부산역 - 9:30 차이나타운 ~~"> <br>
               </div>

               <div id=step>
               <label for="title1" id="plantitle">세부 일정:  </label><br>
               <textarea class="form-control" id="plan"  name="plan"  rows="7"   placeholder="예) 이번 여행은 해운대에서 가서 노는거야. 더베이~" >${ list1.plan}</textarea>
               </div>
            </div>
        </div>
        <br>
    </form>
     
<% } %>

<% if (li2 != null) { %>
     <form id="form2" action="/UpdatePlanList" method="post" enctype="multipart/form-data">
        <div class="container">
            <label for="date2">Date 2 :</label>
            <br>
            <input type="button" value="지역 검색" onclick="openNewWindow()" id="submitButton">
            <input type="button" value="맛집 검색" onclick="openNewWindow2()" id="submitButton">
            <input type="button" value="명소 보기" onclick="openNewWindow3()" id="submitButton">
            <br><br>
            <div class="form-group">
                <label for="title1" id="plantitle">일정 이름:</label><br>
               <input type="hidden" name="num" value="2">
               <input type="hidden" name="tno" value=${ list2.tno }>
               <input type="text" id="title" name="titles" placeholder="예) 서면 여행" value=${ list2.titles}>
               <br><br>
               <label for="title1" id="plantitle">일정:</label><br>
               <div id=step>
               <label for="title1" id="plantitle">STEP1:  </label>
               <input type="text" id="time1" name="time1" placeholder="예) 09:00" value=${ list2.time1 }>
               <input type="text" id="cont1" name="cont1" value=${ list2.cont1} placeholder="예) 9:00 부산역 - 9:30 차이나타운 ~~" ><br>
               </div>
               
               <div id=step>
               <label for="title1" id="plantitle">STEP2:  </label>
               <input type="text" id="time1" name="time2" value=${ list2.time2} placeholder="예) 09:00">
               <input type="text" id="cont1" name="cont2" value=${ list2.cont2} placeholder="예) 9:00 부산역 - 9:30 차이나타운 ~~"> <br>
               </div>
               
               <div id=step>
               <label for="title1" id="plantitle">STEP3:  </label>
               <input type="text" id="time1" name="time3" value=${ list2.time3} placeholder="예) 09:00">
               <input type="text" id="cont1" name="cont3" value=${ list2.cont3} placeholder="예) 9:00 부산역 - 9:30 차이나타운 ~~"> <br>
               </div>
               
               <div id=step>
               <label for="title1" id="plantitle">STEP4:  </label>
               <input type="text" id="time1" name="time4" value=${ list2.time4} placeholder="예) 09:00">
               <input type="text" id="cont1" name="cont4" value=${ list2.cont4} placeholder="예) 9:00 부산역 - 9:30 차이나타운 ~~"> <br>
               </div>
               
               <div id=step>
               <label for="title1" id="plantitle">STEP5:  </label>
               <input type="text" id="time1" name="time5" value=${ list2.time5} placeholder="예) 09:00">
               <input type="text" id="cont1" name="cont5" value=${ list2.cont5} placeholder="예) 9:00 부산역 - 9:30 차이나타운 ~~"> <br>
               </div>
               
               <div id=step>
               <label for="title1" id="plantitle">STEP6:  </label>
               <input type="text" id="time1" name="time6" value=${ list2.time6} placeholder="예) 09:00">
               <input type="text" id="cont1" name="cont6" value=${ list2.cont6} placeholder="예) 9:00 부산역 - 9:30 차이나타운 ~~"> <br>
               </div>

               <div id=step>
               <label for="title1" id="plantitle">세부 일정:  </label><br>
               <textarea class="form-control" id="plan"  name="plan"  rows="7"   placeholder="예) 이번 여행은 해운대에서 가서 노는거야. 더베이~" >${ list2.plan}</textarea>
               </div>
            </div>
        </div>
        <br>
    </form>
     
<% } %>

<% if (li3 != null) { %>
     <form id="form3" action="/UpdatePlanList" method="post" enctype="multipart/form-data">
        <div class="container">
            <label for="date3">Date 3 :</label>
            <br>
            <input type="button" value="지역 검색" onclick="openNewWindow()" id="submitButton">
            <input type="button" value="맛집 검색" onclick="openNewWindow2()" id="submitButton">
            <input type="button" value="명소 보기" onclick="openNewWindow3()" id="submitButton">
            <br><br>
            <div class="form-group">
                <label for="title1" id="plantitle">일정 이름:</label><br>
               <input type="hidden" name="num" value="3">
               <input type="hidden" name="tno" value=${ list3.tno }>
               <input type="text" id="title" name="titles" placeholder="예) 서면 여행" value=${ list3.titles}>
               <br><br>
               <label for="title1" id="plantitle">일정:</label><br>
               <div id=step>
               <label for="title1" id="plantitle">STEP1:  </label>
               <input type="text" id="time1" name="time1" placeholder="예) 09:00" value=${ list3.time1 }>
               <input type="text" id="cont1" name="cont1" value=${ list3.cont1} placeholder="예) 9:00 부산역 - 9:30 차이나타운 ~~" ><br>
               </div>
               
               <div id=step>
               <label for="title1" id="plantitle">STEP2:  </label>
               <input type="text" id="time1" name="time2" value=${ list3.time2} placeholder="예) 09:00">
               <input type="text" id="cont1" name="cont2" value=${ list3.cont2} placeholder="예) 9:00 부산역 - 9:30 차이나타운 ~~"> <br>
               </div>
               
               <div id=step>
               <label for="title1" id="plantitle">STEP3:  </label>
               <input type="text" id="time1" name="time3" value=${ list3.time3} placeholder="예) 09:00">
               <input type="text" id="cont1" name="cont3" value=${ list3.cont3} placeholder="예) 9:00 부산역 - 9:30 차이나타운 ~~"> <br>
               </div>
               
               <div id=step>
               <label for="title1" id="plantitle">STEP4:  </label>
               <input type="text" id="time1" name="time4" value=${ list3.time4} placeholder="예) 09:00">
               <input type="text" id="cont1" name="cont4" value=${ list3.cont4} placeholder="예) 9:00 부산역 - 9:30 차이나타운 ~~"> <br>
               </div>
               
               <div id=step>
               <label for="title1" id="plantitle">STEP5:  </label>
               <input type="text" id="time1" name="time5" value=${ list3.time5} placeholder="예) 09:00">
               <input type="text" id="cont1" name="cont5" value=${ list3.cont5} placeholder="예) 9:00 부산역 - 9:30 차이나타운 ~~"> <br>
               </div>
               
               <div id=step>
               <label for="title1" id="plantitle">STEP6:  </label>
               <input type="text" id="time1" name="time6" value=${ list3.time6} placeholder="예) 09:00">
               <input type="text" id="cont1" name="cont6" value=${ list3.cont6} placeholder="예) 9:00 부산역 - 9:30 차이나타운 ~~"> <br>
               </div>

               <div id=step>
               <label for="title1" id="plantitle">세부 일정:  </label><br>
               <textarea class="form-control" id="plan"  name="plan"  rows="7"   placeholder="예) 이번 여행은 해운대에서 가서 노는거야. 더베이~" >${ list3.cont6}</textarea>
               </div>
            </div>
        </div>
        <br>
    </form>
     
<% } %>

<% if (li4 != null) { %>
     <form id="form4" action="/UpdatePlanList" method="post" enctype="multipart/form-data">
        <div class="container">
            <label for="date4">Date 4 :</label>
            <br>
            <input type="button" value="지역 검색" onclick="openNewWindow()" id="submitButton">
            <input type="button" value="맛집 검색" onclick="openNewWindow2()" id="submitButton">
            <input type="button" value="명소 보기" onclick="openNewWindow3()" id="submitButton">
            <br><br>
            <div class="form-group">
                <label for="title1" id="plantitle">일정 이름:</label><br>
               <input type="hidden" name="num" value="4">
                <input type="hidden" name="tno" value=${ list4.tno }>
               <input type="text" id="title" name="titles" placeholder="예) 서면 여행" value=${ list4.titles}>
               <br><br>
               <label for="title1" id="plantitle">일정:</label><br>
               <div id=step>
               <label for="title1" id="plantitle">STEP1:  </label>
               <input type="text" id="time1" name="time1" placeholder="예) 09:00" value=${ list4.time1 }>
               <input type="text" id="cont1" name="cont1" value=${ list4.cont1} placeholder="예) 9:00 부산역 - 9:30 차이나타운 ~~" ><br>
               </div>
               
               <div id=step>
               <label for="title1" id="plantitle">STEP2:  </label>
               <input type="text" id="time1" name="time2" value=${ list4.time2} placeholder="예) 09:00">
               <input type="text" id="cont1" name="cont2" value=${ list4.cont2} placeholder="예) 9:00 부산역 - 9:30 차이나타운 ~~"> <br>
               </div>
               
               <div id=step>
               <label for="title1" id="plantitle">STEP3:  </label>
               <input type="text" id="time1" name="time3" value=${ list4.time3} placeholder="예) 09:00">
               <input type="text" id="cont1" name="cont3" value=${ list4.cont3} placeholder="예) 9:00 부산역 - 9:30 차이나타운 ~~"> <br>
               </div>
               
               <div id=step>
               <label for="title1" id="plantitle">STEP4:  </label>
               <input type="text" id="time1" name="time4" value=${ list4.time4} placeholder="예) 09:00">
               <input type="text" id="cont1" name="cont4" value=${ list4.cont4} placeholder="예) 9:00 부산역 - 9:30 차이나타운 ~~"> <br>
               </div>
               
               <div id=step>
               <label for="title1" id="plantitle">STEP5:  </label>
               <input type="text" id="time1" name="time5" value=${ list4.time5} placeholder="예) 09:00">
               <input type="text" id="cont1" name="cont5" value=${ list4.cont5} placeholder="예) 9:00 부산역 - 9:30 차이나타운 ~~"> <br>
               </div>
               
               <div id=step>
               <label for="title1" id="plantitle">STEP6:  </label>
               <input type="text" id="time1" name="time6" value=${ list4.time6} placeholder="예) 09:00">
               <input type="text" id="cont1" name="cont6" value=${ list4.cont6} placeholder="예) 9:00 부산역 - 9:30 차이나타운 ~~"> <br>
               </div>

               <div id=step>
               <label for="title1" id="plantitle">세부 일정:  </label><br>
               <textarea class="form-control" id="plan"  name="plan"  rows="7"   placeholder="예) 이번 여행은 해운대에서 가서 노는거야. 더베이~" >${ list4.cont6}</textarea>
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

	        let request = axios.post('/UpdatePlanList', formData);
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
        window.open("testmap", "_blank","width=1000, height=800");
      }
    
    function openNewWindow2() {
        // 새 창을 엽니다.
        window.open("restaurantmap", "_blank","width=1000, height=800");
      }
    
    function openNewWindow3() {
        // 새 창을 엽니다.
        window.open("localmap", "_blank","width=1000, height=800");
      }
</script>


    


</body>
</html>