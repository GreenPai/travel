<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 #myTable{
    margin: 10px;
    padding: 5px;
    border: 1px solid white;
    border-radius: 3px;
    background-color: aliceblue;
    width: 95%;
         }
 table {
    width: 100%;
    border-collapse: collapse;
}

th, td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: center;
}

tr:nth-child(even) {
    background-color: white;
    width: 100%;
}

th {
    background-color: #87A8FD;
    color: white;
} 
</style>
<script>
function removeHyphen() {
    var date = document.getElementById("depPlandTimeHidden").value;
    date = date.replace(/-/g, '');
    document.getElementById("depPlandTime").value = date;
}
</script>
</head>
<body>
    <form id="myForm" action="https://apis.data.go.kr/1613000/TrainInfoService/getStrtpntAlocFndTrainInfo" method="get" onsubmit="event.preventDefault(); removeHyphen(); submitForm();">
        <input type="hidden" id="serviceKey" name="serviceKey" value="SzE0s8qgIfXRCU2pazZYbpDltvTBu1pYI3ue6s1lZxIRfxHMD5fNARlFS36utceDSRAi8pjFN25W9AgH6iSO7w==">
        <input type="hidden" id="pageNo" name="pageNo" value="1">
        <input type="hidden" id="numOfRows" name="numOfRows" value="10">
        <input type="hidden" id="_type" name="_type" value="xml">
       
       
        <label for="depPlaceId">출발지:</label><br>
        <select id="depPlaceId" name="depPlaceId">
            <option value="NAT010000">--서울시--</option>
            <option value="NAT020040">상봉역</option>
            <option value="NAT130036">서빙고역</option>
            <option value="NAT130070">옥수역</option>
            <option value="NAT130104">왕십리역</option>
            <option value="NAT130126">청량리역</option>
            <option value="NAT130182">광운대역</option>
            <option value="NAT010000">서울역</option>
            <option value="NAT010032">용산역</option>
            <option value="NAT010058">노량진역</option>
            <option value="NAT010091">영등포역</option>
            <option value="NAT010106">신도림역</option>
            <option value="NATH30000">수서역</option>
            <option value="NAT011403">--세종시--</option>
            <option value="NAT011403">부강역</option>
            <option value="NAT011298">조치원역</option>
            <option value="NAT011079">소정리역</option>
            <option value="NAT011154">전의역</option>
            <option value="NAT013239">--대구--</option>
            <option value="NAT013239">대구역</option>
            <option value="NAT013271">동대구역</option>
            <option value="NAT013189">서대구역</option>
            <option value="NATC10580">--인천--</option>
            <option value="NATC10580">인천공항T1역</option>
            <option value="NATC30058">인천공항T2역</option>
            <option value="NAT060231">주안역</option>
            <option value="NATC10325">검암역</option>
            <option value="NAT883012">--광주--</option>
            <option value="NAT031857">광주송정역</option>
            <option value="NAT882904">효천역</option>
            <option value="NAT882936">서광주역</option>
            <option value="NAT883012">광주역</option>
            <option value="NAT883086">극락강역</option>
            <option value="NAT011668">--대전--</option>
            <option value="NAT011668">대전역</option>
            <option value="NAT030057">서대전역</option>
            <option value="NAT030173">흑석리역</option>
            <option value="NAT011524">신탄진역</option>
            <option value="NATH13717">--울산--</option>
            <option value="NAT750781">북울산역</option>
            <option value="NATH13717">울산(통도사)역</option>
            <option value="NAT750560">남창역</option>
            <option value="NAT750653">덕하역</option>
            <option value="NAT750726">태화강역</option>
            <option value="NAT750760">효문역</option>
            <option value="NAT020178">--경기도--</option>
            <option value="NAT020178">덕소역</option>
            <option value="NAT020471">아신역</option>
            <option value="NAT020524">양평역</option>
            <option value="NAT020641">용문역</option>
            <option value="NAT020677">지평역</option>
            <option value="NAT020717">석불역</option>
            <option value="NAT020760">일신역</option>
            <option value="NAT020803">매곡역</option>
            <option value="NAT020845">양동역</option>
            <option value="NAT020884">삼산역</option>
            <option value="NAT060121">부천역</option>
            <option value="NAT110147">행신역</option>
            <option value="NAT110165">능곡역</option>
            <option value="NAT110249">일산역</option>
            <option value="NAT110265">탄현역</option>
            <option value="NAT110407">파주역</option>
            <option value="NAT110460">문산v</option>
            <option value="NAT110497">운천역</option>
            <option value="NAT110520">임진강역</option>
            <option value="NAT110557">도라산역</option>
            <option value="NAT130312">의정부역</option>
            <option value="NAT130531">동두천역</option>
            <option value="NAT130556">소요산역</option>
            <option value="NAT130597">초성리역</option>
            <option value="NAT130627">한탄강역</option>
            <option value="NAT130652">전곡역</option>
            <option value="NAT130738">연천역</option>
            <option value="NAT130774">신망리역</option>
            <option value="NAT130844">대광리역</option>
            <option value="NAT130888">신탄리역</option>
            <option value="NAT140098">퇴계원역</option>
            <option value="NAT140133">사릉역역</option>
            <option value="NAT140214">평내호평역</option>
            <option value="NAT140277">마석역</option>
            <option value="NAT140362">대성리역</option>
            <option value="NAT140436">청평역</option>
            <option value="NAT140576">가평역</option>
            <option value="NAT010239">안양역</option>
            <option value="NAT010415">수원역</option>
            <option value="NAT010570">오산역</option>
            <option value="NAT010670">서정리역</option>
            <option value="NAT010754">평택역</option>
            <option value="NAT280090">가남역</option>
            <option value="NAT250428">부발역</option>
            <option value="NATH10219">광명역</option>
            <option value="NATH30326">동탄역</option>
            <option value="NATH30536">지제역</option>
            <option value="NATN10625">--강원도--</option>
            <option value="NAT020986">동화역</option>
            <option value="NAT021033">만종역</option>
            <option value="NAT021175">반곡역</option>
            <option value="NAT021357">신림역</option>
            <option value="NAT020864">서원주역</option>
            <option value="NAT020947">원주역</option>
            <option value="NAT130944">백마고지역</option>
            <option value="NAT140681">백양리역</option>
            <option value="NAT140701">강촌역</option>
            <option value="NAT140787">김유정역</option>
            <option value="NAT140840">남춘천역</option>
            <option value="NAT140873">춘천역</option>
            <option value="NAT600830">동점역</option>
            <option value="NAT600870">철암역역</option>
            <option value="NAT601122">도계역</option>
            <option value="NAT601275">신기역</option>
            <option value="NAT601485">동해역</option>
            <option value="NAT601545">묵호역</option>
            <option value="NAT601602">망상해변v</option>
            <option value="NAT601605">망상역역</option>
            <option value="NAT601774">정동진역</option>
            <option value="NAT601936">강릉역</option>
            <option value="NAT610064">별어곡역</option>
            <option value="NAT610137">선평역</option>
            <option value="NAT610226">정선역</option>
            <option value="NAT610326">나전역</option>
            <option value="NAT610387">아우라지역</option>
            <option value="NATN10230">횡성역</option>
            <option value="NATN10428">둔내역</option>
            <option value="NATN10625">평창역</option>
            <option value="NAT021549">--충청북도--</option>
            <option value="NAT011833">옥천역</option>
            <option value="NAT011916">이원역</option>
            <option value="NAT011972">지탄역</option>
            <option value="NAT012016">심천역</option>
            <option value="NAT012054">각계역</option>
            <option value="NAT012124">영동역</option>
            <option value="NAT012270">황간역</option>
            <option value="NAT012355">추풍령역</option>
            <option value="NAT021478">봉양역</option>
            <option value="NAT021549">제천역</option>
            <option value="NAT021723">도담역</option>
            <option value="NAT021784">단양역</option>
            <option value="NAT050044">오송역</option>
            <option value="NAT050114">청주역</option>
            <option value="NAT050215">오근장역</option>
            <option value="NAT050244">청주공항역</option>
            <option value="NAT050366">증평역</option>
            <option value="NAT050596">음성역</option>
            <option value="NAT050719">주덕역</option>
            <option value="NAT050827">충주역</option>
            <option value="NAT050881">목행역</option>
            <option value="NAT051006">삼탄역</option>
            <option value="NAT280212">감곡장호원역</option>
            <option value="NAT280358">양성온천역</option>
            <option value="NAT650050">장락역</option>
            <option value="NAT030508">--충청남도--</option>
            <option value="NAT030254">계릉역</option>
            <option value="NAT030396">연산역</option>
            <option value="NAT030508">논산역</option>
            <option value="NAT030607">강경역</option>
            <option value="NAT080045">아산역</option>
            <option value="NAT080147">온양온천역</option>
            <option value="NAT080216">신창역</option>
            <option value="NAT080309">도고온천역</option>
            <option value="NAT080353">신례원역</option>
            <option value="NAT080402">예산역</option>
            <option value="NAT080492">삽교역</option>
            <option value="NAT080622">홍성역</option>
            <option value="NAT080749">광천역</option>
            <option value="NAT080827">청소역</option>
            <option value="NAT080952">대천역</option>
            <option value="NAT081240">판교역</option>
            <option value="NAT081318">장항역</option>
            <option value="NAT081343">서천역</option>
            <option value="NAT340090">연무대역</option>
            <option value="NAT010848">성환역</option>
            <option value="NAT010971">천안역</option>
            <option value="NATH10960">천안아산역</option>
            <option value="NATH20438">공주역</option>
            <option value="NAT081099">신웅천역</option>
            <option value="NAT030667">전라북도역</option>
            <option value="NAT030667">용동역</option>
            <option value="NAT030718">함열역</option>
            <option value="NAT030879">익산역</option>
            <option value="NAT031056">김제역</option>
            <option value="NAT031179">신태인역</option>
            <option value="NAT031314">정읍역</option>
            <option value="NAT040133">삼례역</option>
            <option value="NAT040173">동산역</option>
            <option value="NAT040257">전주역</option>
            <option value="NAT040352">신리역</option>
            <option value="NAT040496">관촌역</option>
            <option value="NAT040536">임실역</option>
            <option value="NAT040667">오수역</option>
            <option value="NAT040868">남원역</option>
            <option value="NAT081388">군산역</option>
            <option value="NAT320131">대야역</option>
            <option value="NAT031486">--전라남도--</option>
            <option value="NAT031486">백양사역</option>
            <option value="NAT031638">장성역</option>
            <option value="NAT031998">나주역</option>
            <option value="NAT032099">다시역</option>
            <option value="NAT032273">무안역</option>
            <option value="NAT032313">몽탄역</option>
            <option value="NAT032422">일로역</option>
            <option value="NAT032489">임성리역</option>
            <option value="NAT032563">목포역</option>
            <option value="NAT041072">곡성역</option>
            <option value="NAT041285">구례구역</option>
            <option value="NAT041595">순천역</option>
            <option value="NAT041710">율촌역</option>
            <option value="NAT041866">여천역</option>
            <option value="NAT041993">여수EXPO역</option>
            <option value="NAT032212">함평역</option>
            <option value="NAT881538">진상역</option>
            <option value="NAT881584">옥곡역</option>
            <option value="NAT881708">광양역</option>
            <option value="NAT882034">벌교역</option>
            <option value="NAT882141">조성역</option>
            <option value="NAT882194">예당역</option>
            <option value="NAT882237">특량역</option>
            <option value="NAT882328">보성역</option>
            <option value="NAT882416">명봉v</option>
            <option value="NAT882544">이양역</option>
            <option value="NAT882666">능주역</option>
            <option value="NAT882755">화순역</option>
            <option value="NAT882847">남평역</option>
            <option value="NAT012546">--경상북도--</option>
            <option value="NAT012546">김천역</option>
            <option value="NAT012700">아포역</option>
            <option value="NAT012775">구미역</option>
            <option value="NAT012821">사곡역</option>
            <option value="NAT012903">약목역</option>
            <option value="NAT012968">왜관역</option>
            <option value="NAT013067">신동역</option>
            <option value="NAT013395">경산역</option>
            <option value="NAT013542">남성현역</option>
            <option value="NAT013629">청도역</option>
            <option value="NAT022053">풍기역</option>
            <option value="NAT022188">영주역</option>
            <option value="NAT022844">의성역</option>
            <option value="NAT022961">탑리역</option>
            <option value="NAT023127">화본역</option>
            <option value="NAT023279">신녕역</option>
            <option value="NAT023424">북영천역</option>
            <option value="NAT023449">영천역</option>
            <option value="NAT023601">아화역</option>
            <option value="NAT023821">서경주역</option>
            <option value="NAT300200">옥산역</option>
            <option value="NAT300271">청리역</option>
            <option value="NAT300360">상주역</option>
            <option value="NAT300558">함창역</option>
            <option value="NAT300600">점촌역</option>
            <option value="NAT300669">용궁역</option>
            <option value="NAT300733">개포역</option>
            <option value="NAT300850">예천역</option>
            <option value="NAT600147">봉화역</option>
            <option value="NAT600257">봉성역</option>
            <option value="NAT880345">--경상남도--</option>
            <option value="NAT013747">상동역</option>
            <option value="NAT013841">밀양역</option>
            <option value="NAT013967">삼랑진역</option>
            <option value="NAT014058">원동역</option>
            <option value="NAT014150">물금역</option>
            <option value="NAT880099">한림정역</option>
            <option value="NAT880177">진영역</option>
            <option value="NAT880179">진례역</option>
            <option value="NAT880281">창원중앙역</option>
            <option value="NAT880310">창원역</option>
            <option value="NAT880345">마산역</option>
            <option value="NAT880408">중리역</option>
            <option value="NAT880520">함안역</option>
            <option value="NAT880608">군북역</option>
            <option value="NAT880644">원북역</option>
            <option value="NAT880702">평촌역</option>
            <option value="NAT880766">반성역</option>
            <option value="NAT880825">진성역</option>
            <option value="NAT881014">진주역</option>
            <option value="NAT881168">완사역</option>
            <option value="NAT881269">북천역</option>
            <option value="NAT881323">양보역</option>
            <option value="NAT881386">횡천역</option>
            <option value="NAT881460">하동역</option>
            <option value="NAT810048">신창원역</option>
            <option value="NAT810195">진해역</option>
        </select><br><br>

        <label for="arrPlaceId">도착지: </label><br>
        <select id="arrPlaceId" name="arrPlaceId">
            <option value="NAT014244">화명역</option>
            <option value="NAT014281">구포역</option>
            <option value="NAT014331">사상역</option>
            <option value="NAT014445">부산역</option>
            <option value="NAT750046">부전역</option>
            <option value="NAT750106">동래역</option>
            <option value="NAT750161">센텀역</option>
            <option value="NAT750189">신해운대역</option>
            <option value="NAT750254">송정역</option>
            <option value="NAT750329">기장역</option>
            <option value="NAT750412">좌천역</option>
        </select><br><br>

        <label for="depPlandTimeHidden">출발날짜:</label><br>
        <input type="date" id="depPlandTimeHidden"><br>
        <input type="hidden" id="depPlandTime" name="depPlandTime">

        <label for="trainGradeCode">열차종류:</label><br>
        <select id="trainGradeCode" name="trainGradeCode">
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
    <table id="myTable">
        <!-- 테이블 헤더 -->
        <tr>
            <th>열차번호</th>
            <th>기차명</th>
            <th>출발역</th>
            <th>출발시간</th>
            <th>도착역</th>
            <th>도착시간</th>
        </tr>
    </table>

    <script>
        function formatDateTime(dtString) {
            var year = dtString.substring(0, 4);
            var month = dtString.substring(4, 6);
            var day = dtString.substring(6, 8);
            var hour = dtString.substring(8, 10);
            var minute = dtString.substring(10, 12);

            var date = new Date(year, month-1, day, hour, minute);
            return date.toLocaleDateString('ko-KR') + ' ' + date.toLocaleTimeString('ko-KR', {hour: '2-digit', minute:'2-digit'});
        }

        function submitForm() {
            var xhr = new XMLHttpRequest();
            xhr.open('GET', document.getElementById('myForm').action + '?' + new URLSearchParams(new FormData(document.getElementById('myForm'))), true);
            xhr.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    var parser = new DOMParser();
                    var xmlDoc = parser.parseFromString(this.responseText, "text/xml");
                    var items = xmlDoc.getElementsByTagName('item');
                    var table = document.getElementById('myTable');

                    for (var i = 0; i < items.length; i++) {
                        var row = table.insertRow(-1);
                        var cell1 = row.insertCell(0);
                        var cell2 = row.insertCell(1);
                        var cell3 = row.insertCell(2);
                        var cell4 = row.insertCell(3);
                        var cell5 = row.insertCell(4);
                        var cell6 = row.insertCell(5);

                        cell1.innerHTML = items[i].getElementsByTagName('trainno')[0].textContent;  // 기차번호
                        cell2.innerHTML = items[i].getElementsByTagName('traingradename')[0].textContent;  // 기차명
                        cell3.innerHTML = "출발지: " + items[i].getElementsByTagName('depplacename')[0].textContent;  // 출발지
                        cell4.innerHTML = formatDateTime(items[i].getElementsByTagName('depplandtime')[0].textContent);  // 출발시간
                        cell5.innerHTML = "도착지: " + items[i].getElementsByTagName('arrplacename')[0].textContent;  // 도착지
                        cell6.innerHTML = formatDateTime(items[i].getElementsByTagName('arrplandtime')[0].textContent);  // 도착시간
                    }
                }
            };
            xhr.send();
        }
    </script>
</body>
</html>