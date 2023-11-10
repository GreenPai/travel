<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/new_main.css" />

</head>
<body>
	<%@include file="/WEB-INF/views/include/header.jsp" %>

	<br>
	<br>


	<div id="content">
		<div style="position: relative; width: 100%; height: 700px;">
			<img alt="back_img" src="img/busan.jpg"
				style="width: 100%; height: 100%;">
			<div
				style="position: absolute; top: 30%; left: 50%; transform: translate(-50%, -50%); text-align: center;">
				<h1 style="color: #fff; font-size: 50px;">내가 만드는 부산 이야기</h1>
				<h2 style="color: black; font-size: 20px;">
					대한민국 항구도시 부산!! <br> 이곳에서 좋은 추억 만들어 보세요
				</h2>
				<br> <br> <br> <br>
				<form action="/검색결과페이지" method="GET" style="display: flex;">
					<input type="text" name="q" placeholder="여행지를 입력하세요"
						style="flex: 1; padding: 10px; border-radius: 10px;">
					<button type="submit"
						style="padding: 10px 20px; border-radius: 10px;">검색</button>
				</form>
			</div>
		</div>
		<!-- 이미지끝 -->
		<br> <br>



		<div class="slideshow-container">
			<img class="slide" src="img/img1.jpg" alt="이미지 1"> <img
				class="slide" src="img/img2.jpg" alt="이미지 2"> <img
				class="slide" src="img/img3.jpg" alt="이미지 3"> <img
				class="slide" src="img/img4.jpg" alt="이미지 4"> <img
				class="slide" src="img/img5.jpg" alt="이미지 5">
		</div>





		<br> <br>
		<section class="section_popular" style="background-color: #E7F3FF">
			<div class="sec_inner">
				<div class="sec_popular_cnt" id="popularList">
					<div class="parent_box">
						<div class="child_box" tabindex="-1">
							<div class="item_box">
								<div class="photo">
									<a href="https://www.visitbusan.net/index.do?menuCd=DOM_000000201001001000&uc_seq=261&lang_cd=ko" style="width: 268px; height: 200px;"> <img
										alt="해동용궁사" src="/img/haedong.png"
										style="width: 268px; height: 200px;">
									</a>
								</div>
								<div class="info">
									<p class="tit">
										<a href="https://www.visitbusan.net/index.do?menuCd=DOM_000000201001001000&uc_seq=261&lang_cd=ko" > <span class="flag flag01">인기</span> <span
											class="sbj">해동 용궁사</span>
										</a>
									</p>
									<p class="location">부산광역시 기장군 기장읍 용궁길 86(시랑리)</p>
								</div>
							</div>
						</div>

						<div class="child_box" tabindex="-1">
							<div class="item_box">
								<div class="photo">
									<a href="https://www.visitbusan.net/index.do?menuCd=DOM_000000201001001000&uc_seq=365&lang_cd=ko" style="width: 260px; height: 200px;"> <img
										alt="감천문화마을	" src="/img/gamchun.png"
										style="width: 268px; height: 200px;">
									</a>
								</div>
								<div class="info">
									<p class="tit">
										<a href="https://www.visitbusan.net/index.do?menuCd=DOM_000000201001001000&uc_seq=365&lang_cd=ko"> <span class="flag flag01">인기</span> <span
											class="sbj">감천 문화마을</span>
										</a>
									</p>
									<p class="location">부산광역시 사하구 감천동</p>
								</div>
							</div>
						</div>

						<div class="child_box" tabindex="-1">
							<div class="item_box">
								<div class="photo">
									<a href="https://www.visitbusan.net/index.do?menuCd=DOM_000000201001001000&uc_seq=402&lang_cd=ko" style="width: 260px; height: 200px;"> <img
										alt="범어사	" src="/img/bum.png"
										style="width: 268px; height: 200px;">
									</a>
								</div>
								<div class="info">
									<p class="tit">
										<a href="https://www.visitbusan.net/index.do?menuCd=DOM_000000201001001000&uc_seq=402&lang_cd=ko"> <span class="flag flag01">인기</span> <span
											class="sbj">범어사</span>
										</a>
									</p>
									<p class="location">부산광역시 금정구 범어사로 250</p>
								</div>
							</div>
						</div>
						<div class="child_box" tabindex="-1">
							<div class="item_box">
								<div class="photo">
									<a href="https://www.visitbusan.net/kr/index.do?menuCd=DOM_000000201001001000&uc_seq=377&lang_cd=ko" style="width: 260px; height: 200px;"> <img
										alt="광안리	" src="/img/busan.jpg"
										style="width: 268px; height: 200px;">
									</a>
								</div>
								<div class="info">
									<p class="tit">
										<a href="https://www.visitbusan.net/kr/index.do?menuCd=DOM_000000201001001000&uc_seq=377&lang_cd=ko"> <span class="flag flag01">인기</span> <span
											class="sbj">광안리</span>
										</a>
									</p>
									<p class="location">부산광역시 수영구 광안2동에 위치한 해수욕장</p>
								</div>
							</div>
						</div>

						<div class="child_box" tabindex="-1">
							<div class="item_box">
								<div class="photo">
									<a href="https://www.visitbusan.net/index.do?menuCd=DOM_000000201001001000&uc_seq=255&lang_cd=ko" style="width: 260px; height: 200px;"> <img
										alt="흰여울 문화마을	" src="/img/youngdo.png"
										style="width: 268px; height: 200px;">
									</a>
								</div>
								<div class="info">
									<p class="tit">
										<a href="https://www.visitbusan.net/index.do?menuCd=DOM_000000201001001000&uc_seq=255&lang_cd=ko"> <span class="flag flag01">인기</span> <span
											class="sbj">흰여울 문화마을</span>
										</a>
									</p>
									<p class="location">부산광역시 영도구 영선동4가 1043</p>
								</div>
							</div>
						</div>

						<div class="child_box" tabindex="-1">
							<div class="item_box">
								<div class="photo">
									<a href="https://www.visitbusan.net/kr/index.do?menuCd=DOM_000000201003001000&uc_seq=399&lang_cd=ko" style="width: 260px; height: 200px;"> <img
										alt="국제시장	" src="/img/gukjae.png"
										style="width: 268px; height: 200px;">
									</a>
								</div>
								<div class="info">
									<p class="tit">
										<a href="https://www.visitbusan.net/kr/index.do?menuCd=DOM_000000201003001000&uc_seq=399&lang_cd=ko"> <span class="flag flag01">인기</span> <span
											class="sbj">국제시장</span>
										</a>
									</p>
									<p class="location">부산광역시 중구 국제시장2길 25</p>
								</div>
							</div>
						</div>

						<div class="child_box" tabindex="-1">
							<div class="item_box">
								<div class="photo">
									<a href="https://www.visitbusan.net/kr/index.do?menuCd=DOM_000000201001001000&uc_seq=373&lang_cd=ko" style="width: 260px; height: 200px;"> <img
										alt="해운대" src="/img/haeundae.png"
										style="width: 268px; height: 200px;">
									</a>
								</div>
								<div class="info">
									<p class="tit">
										<a href="https://www.visitbusan.net/kr/index.do?menuCd=DOM_000000201001001000&uc_seq=373&lang_cd=ko"> <span class="flag flag01">인기</span> <span
											class="sbj">해운대</span>
										</a>
									</p> 
									<p class="location">부산광역시 해운대구</p>
								</div>
							</div>
						</div>

						<div class="child_box" tabindex="-1">
							<div class="item_box">
								<div class="photo">
									<a href="https://www.visitbusan.net/index.do?menuCd=DOM_000000201001001000&uc_seq=368&lang_cd=ko" style="width: 268px; height: 200px;"> <img
										alt="용두산공원" src="/img/dragon.png"
										style="width: 268px; height: 200px;">
									</a>
								</div>
								<div class="info">
									<p class="tit">
										<a href="https://www.visitbusan.net/index.do?menuCd=DOM_000000201001001000&uc_seq=368&lang_cd=ko"> <span class="flag flag01">인기</span> <span
											class="sbj">용두산공원</span>
										</a>
									</p>
									<p class="location">부산광역시 중구 용두산길 37-55</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</section>



		<section class="movie">
			<!-- 부산여행 동영상 -->

			<div class="inner">
				<div class="yout_item">
					<ul class="yout_area">


						<li><a href="https://www.youtube.com/watch?v=3gugFrmfhlQ"
							target="_blank" rel="noopener noreferrer"
							title="스테이씨(STAYC)의 마지막 밤? 부산에 진심이었던 스테이씨크릿 다음에 또 만나!! | 스테이씨크릿 in 부산 EP.12 YouTube">
								<img src="https://img.youtube.com/vi/3gugFrmfhlQ/mqdefault.jpg"
								alt="스테이씨(STAYC)의 마지막 밤? 부산에 진심이었던 스테이씨크릿 다음에 또 만나!! | 스테이씨크릿 in 부산 EP.12"
								loading="lazy"> <strong>스테이씨(STAYC)의 마지막 밤? 부산에
									진심이었던 스테이씨크릿 다음에 또 만나!! | 스테이씨크릿 in 부산 EP.12</strong> <span class="date">2023-10-13</span>
						</a></li>


						<li><a
							href=" https://www.youtube.com/watch?v=QGrnMdi6wrQ&feature=youtu.be"
							target="_blank" rel="noopener noreferrer"
							title="스테이씨(STAYC)의 첫 낭만 캠핑! 이 조명, 온도, 습도,, 모두 완벽해!! | 스테이씨크릿 in 부산 EP.11 YouTube">
								<img src="https://img.youtube.com/vi/QGrnMdi6wrQ/mqdefault.jpg"
								alt="스테이씨(STAYC)의 첫 낭만 캠핑! 이 조명, 온도, 습도,, 모두 완벽해!! | 스테이씨크릿 in 부산 EP.11"
								loading="lazy"> <strong>스테이씨(STAYC)의 첫 낭만 캠핑! 이
									조명, 온도, 습도,, 모두 완벽해!! | 스테이씨크릿 in 부산 EP.11</strong> <span class="date">2023-10-06</span>
						</a></li>


						<li><a
							href="https://www.youtube.com/watch?v=NfdCTa3r1DA&feature=youtu.be"
							target="_blank" rel="noopener noreferrer"
							title="스테이씨 (STAYC)에 취한다... 찐친 바이브 풍기는 청마가옥 체험기! | 스테이씨크릿 in 부산 EP.10 YouTube">
								<img src="https://img.youtube.com/vi/NfdCTa3r1DA/mqdefault.jpg"
								alt="스테이씨 (STAYC)에 취한다... 찐친 바이브 풍기는 청마가옥 체험기! | 스테이씨크릿 in 부산 EP.10"
								loading="lazy"> <strong>스테이씨 (STAYC)에 취한다... 찐친
									바이브 풍기는 청마가옥 체험기! | 스테이씨크릿 in 부산 EP.10</strong> <span class="date">2023-10-04</span>
						</a></li>


						<li><a href="https://www.youtube.com/watch?v=W_XsSNYs9-A"
							target="_blank" rel="noopener noreferrer"
							title="[Behind EP.4] 밀착 취재!! 스테이씨(STAYC) 미공개 브이로그! 짱 귀여우니 많관부~ | 스테이씨크릿 in 부산  YouTube">
								<img src="https://img.youtube.com/vi/W_XsSNYs9-A/mqdefault.jpg"
								alt="[Behind EP.4] 밀착 취재!! 스테이씨(STAYC) 미공개 브이로그! 짱 귀여우니 많관부~ | 스테이씨크릿 in 부산 "
								loading="lazy"> <strong>[Behind EP.4] 밀착 취재!!
									스테이씨(STAYC) 미공개 브이로그! 짱 귀여우니 많관부~ | 스테이씨크릿 in 부산 </strong> <span
								class="date">2023-09-22</span>
						</a></li>


						<li><a
							href="https://www.youtube.com/watch?v=o6YYytqFENQ&feature=youtu.be"
							target="_blank" rel="noopener noreferrer"
							title="주문하신 스테이씨(STAYC) 외향즈 VLOG 나왔습니다! 근데 유죄 인간을 곁들인... | 스테이씨크릿 in 부산 EP.9  YouTube">
								<img src="https://img.youtube.com/vi/o6YYytqFENQ/mqdefault.jpg"
								alt="주문하신 스테이씨(STAYC) 외향즈 VLOG 나왔습니다! 근데 유죄 인간을 곁들인... | 스테이씨크릿 in 부산 EP.9 "
								loading="lazy"> <strong>주문하신 스테이씨(STAYC) 외향즈 VLOG
									나왔습니다! 근데 유죄 인간을 곁들인... | 스테이씨크릿 in 부산 EP.9 </strong> <span class="date">2023-09-15</span>
						</a></li>


						<li><a href="https://www.youtube.com/watch?v=ylHqf-2XTio"
							target="_blank" rel="noopener noreferrer"
							title="SNS 폭풍 업로드 각! 스테이씨(STAYC)가 알려주는 부산 핫플레이스 |  스테이씨크릿 in 부산 EP.8  YouTube">
								<img src="https://img.youtube.com/vi/ylHqf-2XTio/mqdefault.jpg"
								alt="SNS 폭풍 업로드 각! 스테이씨(STAYC)가 알려주는 부산 핫플레이스 |  스테이씨크릿 in 부산 EP.8 "
								loading="lazy"> <strong>SNS 폭풍 업로드 각!
									스테이씨(STAYC)가 알려주는 부산 핫플레이스 | 스테이씨크릿 in 부산 EP.8 </strong> <span
								class="date">2023-09-08</span>
						</a></li>


						<li><a href="https://www.youtube.com/watch?v=iqtwSVyfFuY"
							target="_blank" rel="noopener noreferrer"
							title="촬영 중 본격 회 먹방하는 아이돌? 회친자 스테이씨 (STAYC) 자갈치시장 뿌시기! | 스테이씨크릿 in 부산 EP.7 YouTube">
								<img src="https://img.youtube.com/vi/iqtwSVyfFuY/mqdefault.jpg"
								alt="촬영 중 본격 회 먹방하는 아이돌? 회친자 스테이씨 (STAYC) 자갈치시장 뿌시기! | 스테이씨크릿 in 부산 EP.7"
								loading="lazy"> <strong>촬영 중 본격 회 먹방하는 아이돌? 회친자
									스테이씨 (STAYC) 자갈치시장 뿌시기! | 스테이씨크릿 in 부산 EP.7</strong> <span class="date">2023-09-01</span>
						</a></li>


						<li><a href="https://www.youtube.com/watch?v=56yCxS3ob1s"
							target="_blank" rel="noopener noreferrer"
							title="[Behind EP.3] 스테이씨(STAYC) 멤버들 중 올해 대박 운의 주인공은 누구?  | 스테이씨크릿 in 부산 YouTube">
								<img src="https://img.youtube.com/vi/56yCxS3ob1s/mqdefault.jpg"
								alt="[Behind EP.3] 스테이씨(STAYC) 멤버들 중 올해 대박 운의 주인공은 누구?  | 스테이씨크릿 in 부산"
								loading="lazy"> <strong>[Behind EP.3] 스테이씨(STAYC)
									멤버들 중 올해 대박 운의 주인공은 누구? | 스테이씨크릿 in 부산</strong> <span class="date">2023-08-25</span>
						</a></li>

					</ul>
				</div>
				
			</div>

		</section>

		<div class="footer">
			<div class="inner">
				<div class="left">
					<h3 class="title">제공</h3>
					<p>개인정보보호방침</p>
					<p>저작권보호정책</p>
					<p>약관</p>
					<p>행정서비스현황</p>
					<p>뷰어다운로드</p>
					<p class="last">Copyright Busan Metropolitan City. All rights
						reserved.</p>
				</div>
				<div class="center">
					<h3 class="title">관광 문의</h3>
					<p style="font-size: 40px;">1331</p>
					<br>
				</div>
				<div class="right">
					<h3 class="title">민원대표전화</h3>
					<p>051-900-0000</p>
					<p>평일 09:00 - 18:00</p>
					<p>※야간/공휴일 등 근무시간외는 사무실로 전환.</p>
					<p>부산문화포탈 다봄</p>
					<p>여행 상담</p>
				</div>
			</div>
		</div>

	</div>

	<script>
    const slides = document.querySelectorAll('.slide');
    let currentSlide = 0;

    function showSlide() {
        slides.forEach((slide) => {
            slide.style.display = 'none';
        });

        slides[currentSlide].style.display = 'block';

        currentSlide++;
        if (currentSlide >= slides.length) {
            currentSlide = 0;
        }

        setTimeout(showSlide, 3000); // 3초마다 슬라이드 전환
    }

    showSlide();
</script>

</body>
</html>



