<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function removeHyphen() {
    var date = document.getElementById("depPlandTimeHidden").value;
    date = date.replace(/-/g, '');
    document.getElementById("depPlandTime").value = date;
}
</script>
</head>
<body>
    <form action="https://apis.data.go.kr/1613000/TrainInfoService/getStrtpntAlocFndTrainInfo" method="get" onsubmit="removeHyphen()">
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
            <option value="NAT031857">광주송정</option>
            <option value="NAT882904">효천</option>
            <option value="NAT882936">서광주</option>
            <option value="NAT883012">광주</option>
            <option value="NAT883086">극락강</option>
            <option value="NAT011668">--대전--</option>
            <option value="NAT011668">대전</option>
            <option value="NAT030057">서대전</option>
            <option value="NAT030173">흑석리</option>
            <option value="NAT011524">신탄진</option>
            <option value="NATH13717">--울산--</option>
            <option value="NAT750781">북울산</option>
            <option value="NATH13717">울산(통도사)</option>
            <option value="NAT750560">남창</option>
            <option value="NAT750653">덕하</option>
            <option value="NAT750726">태화강</option>
            <option value="NAT750760">효문</option>
            <option value="NAT020178">--경기도--</option>
            <option value="NAT020178">덕소</option>
            <option value="NAT020471">아신</option>
            <option value="NAT020524">양평</option>
            <option value="NAT020641">용문</option>
            <option value="NAT020677">지평</option>
            <option value="NAT020717">석불</option>
            <option value="NAT020760">일신</option>
            <option value="NAT020803">매곡</option>
            <option value="NAT020845">양동</option>
            <option value="NAT020884">삼산</option>
            <option value="NAT060121">부천</option>
            <option value="NAT110147">행신</option>
            <option value="NAT110165">능곡</option>
            <option value="NAT110249">일산</option>
            <option value="NAT110265">탄현</option>
            <option value="NAT110407">파주</option>
            <option value="NAT110460">문산</option>
            <option value="NAT110497">운천</option>
            <option value="NAT110520">임진강</option>
            <option value="NAT110557">도라산</option>
            <option value="NAT130312">의정부</option>
            <option value="NAT130531">동두천</option>
            <option value="NAT130556">소요산</option>
            <option value="NAT130597">초성리</option>
            <option value="NAT130627">한탄강</option>
            <option value="NAT130652">전곡</option>
            <option value="NAT130738<">연천</option>
            <option value="NAT130774">신망리</option>
            <option value="NAT130844">대광리</option>
            <option value="NAT130888">신탄리</option>
            <option value="NAT140098">퇴계원</option>
            <option value="NAT140133">사릉</option>
            <option value="NAT140214">평내호평</option>
            <option value="NAT140277">마석</option>
            <option value="NAT140362">대성리</option>
            <option value="NAT140436">청평</option>
            <option value="NAT140576">가평</option>
            <option value="NAT010239">안양</option>
            <option value="NAT010415">수원</option>
            <option value="NAT010570">오산</option>
            <option value="NAT010670">서정리</option>
            <option value="NAT010754">평택</option>
            <option value="NAT280090">가남</option>
            <option value="NAT250428">부발</option>
            <option value="NATH10219">광명</option>
            <option value="NATH30326">동탄</option>
            <option value="NATH30536">지제</option>
            <option value="NATN10625">--강원도--</option>
            <option value="NAT020986">동화</option>
            <option value="NAT021033">만종</option>
            <option value="NAT021175">반곡</option>
            <option value="NAT021357">신림</option>
            <option value="NAT020864">서원주</option>
            <option value="NAT020947">원주</option>
            <option value="NAT130944">백마고지</option>
            <option value="NAT140681">백양리</option>
            <option value="NAT140701">강촌</option>
            <option value="NAT140787">김유정</option>
            <option value="NAT140840">남춘천</option>
            <option value="NAT140873">춘천</option>
            <option value="NAT600830">동점</option>
            <option value="NAT600870">철암</option>
            <option value="NAT601122">도계</option>
            <option value="NAT601275">신기</option>
            <option value="NAT601485">동해</option>
            <option value="NAT601545">묵호</option>
            <option value="NAT601602">망상해변</option>
            <option value="NAT601605">망상</option>
            <option value="NAT601774">정동진</option>
            <option value="NAT601936">강릉</option>
            <option value="NAT610064">별어곡</option>
            <option value="NAT610137">선평</option>
            <option value="NAT610226">정선</option>
            <option value="NAT610326">나전</option>
            <option value="NAT610387">아우라지</option>
            <option value="NATN10230">횡성</option>
            <option value="NATN10428">둔내</option>
            <option value="NATN10625">평창</option>
            <option value="NAT021549">--충청북도--</option>
            <option value="NAT011833">옥천</option>
            <option value="NAT011916">이원</option>
            <option value="NAT011972">지탄</option>
            <option value="NAT012016">심천</option>
            <option value="NAT012054">각계</option>
            <option value="NAT012124">영동</option>
            <option value="NAT012270">황간</option>
            <option value="NAT012355">추풍령</option>
            <option value="NAT021478">봉양</option>
            <option value="NAT021549">제천</option>
            <option value="NAT021723">도담</option>
            <option value="NAT021784">단양</option>
            <option value="NAT050044">오송</option>
            <option value="NAT050114">청주</option>
            <option value="NAT050215">오근장</option>
            <option value="NAT050244">청주공항</option>
            <option value="NAT050366">증평</option>
            <option value="NAT050596">음성</option>
            <option value="NAT050719">주덕</option>
            <option value="NAT050827">충주</option>
            <option value="NAT050881">목행</option>
            <option value="NAT051006">삼탄</option>
            <option value="NAT280212">감곡장호원</option>
            <option value="NAT280358">양성온천</option>
            <option value="NAT650050">장락</option>
            <option value="34">충청남도</option>
            <option value="NAT030254">계릉</option>
            <option value="NAT030396">연산</option>
            <option value="NAT030508">논산</option>
            <option value="NAT030607">강경</option>
            <option value="NAT080045">아산</option>
            <option value="NAT080147">온양온천</option>
            <option value="NAT080216">신창</option>
            <option value="NAT080309">도고온천</option>
            <option value="NAT080353">신례원</option>
            <option value="NAT080402">예산</option>
            <option value="NAT080492">삽교</option>
            <option value="NAT080622">홍성</option>
            <option value="NAT080749">광천</option>
            <option value="NAT080827">청소</option>
            <option value="NAT080952">대천</option>
            <option value="NAT081240">판교</option>
            <option value="NAT081318">장항</option>
            <option value="NAT081343">서천</option>
            <option value="NAT340090">연무대</option>
            <option value="NAT010848">성환</option>
            <option value="NAT010971">천안</option>
            <option value="NATH10960">천안아산</option>
            <option value="NATH20438">공주</option>
            <option value="NAT081099">신웅천</option>
            <option value="NAT030667">전라북도</option>
            <option value="NAT030667">용동</option>
            <option value="NAT030718">함열</option>
            <option value="NAT030879">익산</option>
            <option value="NAT031056">김제</option>
            <option value="NAT031179">신태인</option>
            <option value="NAT031314">정읍</option>
            <option value="NAT040133">삼례</option>
            <option value="NAT040173">동산</option>
            <option value="NAT040257">전주</option>
            <option value="NAT040352">신리</option>
            <option value="NAT040496">관촌</option>
            <option value="NAT040536">임실</option>
            <option value="NAT040667">오수</option>
            <option value="NAT040868">남원</option>
            <option value="NAT081388">군산</option>
            <option value="NAT320131">대야</option>
            <option value="NAT031486">전라남도</option>
            <option value="NAT031486">백양사</option>
            <option value="NAT031638">장성</option>
            <option value="NAT031998">나주</option>
            <option value="NAT032099">다시</option>
            <option value="NAT032273">무안</option>
            <option value="NAT032313">몽탄</option>
            <option value="NAT032422">일로</option>
            <option value="NAT032489">임성리</option>
            <option value="NAT032563">목포</option>
            <option value="NAT041072">곡성</option>
            <option value="NAT041285">구례구</option>
            <option value="NAT041595">순천</option>
            <option value="NAT041710">율촌</option>
            <option value="NAT041866">여천</option>
            <option value="NAT041993">여수EXPO</option>
            <option value="NAT032212">함평</option>
            <option value="NAT881538">진상</option>
            <option value="NAT881584">옥곡</option>
            <option value="NAT881708">광양</option>
            <option value="NAT882034">벌교</option>
            <option value="NAT882141">조성</option>
            <option value="NAT882194">예당</option>
            <option value="NAT882237">특량</option>
            <option value="NAT882328">보성</option>
            <option value="NAT882416">명봉</option>
            <option value="NAT882544">이양</option>
            <option value="NAT882666">능주</option>
            <option value="NAT882755">화순</option>
            <option value="NAT882847">남평</option>
            <option value="NAT012546">경상북도</option>
            <option value="NAT012546">김천</option>
            <option value="NAT012700">아포</option>
            <option value="NAT012775">구미</option>
            <option value="NAT012821">사곡</option>
            <option value="NAT012903">약목</option>
            <option value="NAT012968">왜관</option>
            <option value="NAT013067">신동</option>
            <option value="NAT013395">경산</option>
            <option value="NAT013542">남성현</option>
            <option value="NAT013629">청도</option>
            <option value="NAT022053">풍기</option>
            <option value="NAT022188">영주</option>
            <option value="NAT022844">의성</option>
            <option value="NAT022961">탑리</option>
            <option value="NAT023127">화본</option>
            <option value="NAT023279">신녕</option>
            <option value="NAT023424">북영천</option>
            <option value="NAT023449">영천</option>
            <option value="NAT023601">아화</option>
            <option value="NAT023821">서경주</option>
            <option value="NAT300200">옥산</option>
            <option value="NAT300271">청리</option>
            <option value="NAT300360">상주</option>
            <option value="NAT300558">함창</option>
            <option value="NAT300600">점촌</option>
            <option value="NAT300669">용궁</option>
            <option value="NAT300733">개포</option>
            <option value="NAT300850">예천</option>
            <option value="NAT600147">봉화</option>
            <option value="NAT600257">봉성</option>
            <option value="38">경상남도</option>
            <option value="NAT013747">상동</option>
            <option value="NAT013841">밀양</option>
            <option value="NAT013967">삼랑진</option>
            <option value="NAT014058">원동</option>
            <option value="NAT014150">물금</option>
            <option value="NAT880099">한림정</option>
            <option value="NAT880177">진영</option>
            <option value="NAT880179">진례</option>
            <option value="NAT880281">창원중앙</option>
            <option value="NAT880310">창원</option>
            <option value="NAT880345">마산</option>
            <option value="NAT880408">중리</option>
            <option value="NAT880520">함안</option>
            <option value="NAT880608">군북</option>
            <option value="NAT880644">원북</option>
            <option value="NAT880702">평촌</option>
            <option value="NAT880766">반성</option>
            <option value="NAT880825">진성</option>
            <option value="NAT881014">진주</option>
            <option value="NAT881168">완사</option>
            <option value="NAT881269">북천</option>
            <option value="NAT881323">양보</option>
            <option value="NAT881386">횡천</option>
            <option value="NAT881460">하동</option>
            <option value="NAT810048">신창원</option>
            <option value="NAT810195">진해</option>
        </select><br><br>

        <label for="arrPlaceId">도착지: 부산</label><br>
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
</body>
</html>