<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
$(document).ready(function() {
    var serviceKey = "SzE0s8qgIfXRCU2pazZYbpDltvTBu1pYI3ue6s1lZxIRfxHMD5fNARlFS36utceDSRAi8pjFN25W9AgH6iSO7w%3D%3D";
    var cityCodeListUrl = "https://apis.data.go.kr/1613000/TrainInfoService/getCtyCodeList?serviceKey=" + serviceKey + "&_type=json";
    var trainStationListUrl = "https://apis.data.go.kr/1613000/TrainInfoService/getCtyAcctoTrainSttnList?serviceKey=" + serviceKey;

    $.ajax({
        url: cityCodeListUrl,
        type: "GET",
        dataType: "json",
        success: function(cityCodeData) {
            // 도시 코드 데이터 처리
            console.log(cityCodeData);

            $.ajax({
                url: trainStationListUrl,
                type: "GET",
                dataType: "json",
                success: function(trainStationData) {
                    // 역 목록 데이터 처리
                    console.log(trainStationData);
                },
                error: function(error) {
                    console.log("Error:", error);
                }
            });
        },
        error: function(error) {
            console.log("Error:", error);
        }
    });
});
</script>
</body>
</html>