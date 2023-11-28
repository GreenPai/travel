# TRAVEL
부산 여행 사이트 웹개발

# 개발 주제
당일치기 부산 여행을 위한 여행 플래너
부산을 여행하기 위한 정보를 제공하는 사이트를 개발하고자 했습니다. 
여행할 때 필요한 여행지, 축제, 기상정보, 주차장 정보등을 제공하며 사용자가 직접 계획을 세울 수 있도록 계획했습니다. 


# 기획의도
기존 여행 일정 사이트의 경우에는 전국이나 세계적으로 정보를 제공하기 때문에 부산에 대한 세부적인 정보가 부족
하다고 생각했습니다. 저희는 부산을 여행할 때 필요한 여행지, 축제, 기상정보, 주차장 정보, 맛집정보,
편의 시설등의 정보를 제공하여 사용자가 자유롭게 계획을 세울 수 있도록 계획 했습니다.

# 개발 일정
2023-11-03 ~ 2023-11-28 

# 팀원
- 우상호(팀장): 로그인, 회원가입, CRUD, 일정관리, 캘린더API, 데이터베이스
- 홍지원(팀원): 명소, 도보여행, 공영주차장, 편의시설, 문화재등 다양한 API 제공, 전체적인 화면 디자인 구현
- 고상현(팀원): 지도 , 날씨, 철도 API 활용 및 관련 디자인 데이터베이스작업.


# 기술 스택
- Front-end: HTML, CSS, JavaScript, jQuery, bootstrap, Ajax
- Back-end: Springboot(STS3), JAVA
- DB: Oracle, mybatis
- Tool: gradle, github, kakao oven
  
# ERD

![ERD](https://github.com/GreenPai/travel/assets/145432813/66c66c29-d1b9-4342-80a3-a1bed7f37020)

# 주요 기능
### 부산 여행 정보
- 부산의 주요 관광 명소, 도보여행지 및 맛집정보 제공
- 지도에 표시하여 위치 확인
- 부산의 테마 일정 정보 제공
  
  예) 옛백제병원 - 남선창고터 - 초량교회 - 168계단 -김민부 전망대 - 이바구공작소 - 장기려더나눔센터 - 유치환우체통 전망대
- 공영주차장에 대한 정보, 부산 편의시설, 문화재 정보 제공
- 부산의 실시간 날씨 정보와 6시간 간격으로 날씨정보를 제공

### 일자 세우기
- 원하는 일자에 일정 추가
- 선택된 일자의 날씨 정보 제공(최저, 최고온도, 날씨)
- Form 형식으로 된 일정 작성양식 (일자에 따라 Day1, Day2, Day3 증가 )
- 지도 API를 통해서 일정 세울 때 주변의 맛집정보, 명소정보 제공
- 각 지역의 부산행 열차 시간대를 볼 수 있도록 테이블을 제공

### 게시판
 - 페이징을 통해서 페이지를 나눔
 - 새글, 수정, 삭제, 댓글(수정, 삭제) 구현
 - Q&A 게시판 구현. 자주 물어보는 질문의 경우에는 자주하는 질문 게시판을 따로 만들어 관련 질문을 눌렀을때 정보가 보이도록 구현

### 회원가입/ 로그인
 - 회원가입은 부트스트랩을 이용하여 구현
 - 로그인은 세션을 로그인 여부 판단




# 일정 세우기(사진)

### 캘린더
![일정잡기2](https://github.com/GreenPai/travel/assets/145432813/c5196717-6486-4d02-8d82-1a420da22eac)

### 날씨정보
![일정잡기3](https://github.com/GreenPai/travel/assets/145432813/9116db94-d41e-4516-b3c0-34095828acee)

### 일정 폼
![일정잡기4](https://github.com/GreenPai/travel/assets/145432813/c4688d81-c6ad-4caa-b07a-030ca2e2d3c4)

### 일정 세부 페이지
![일정잡기 5](https://github.com/GreenPai/travel/assets/145432813/dfe135fa-597a-46d3-acb0-7664de691cfc)


# 지도 

### 지도 검색
![image](https://github.com/GreenPai/travel/assets/145432813/731b18bc-1739-4988-a670-489b84340c4a)

### 명소정보
![명소정보](https://github.com/GreenPai/travel/assets/145432813/0cc84040-862b-45a0-8f10-39018b28e11a)

### 구 검색기능
![구 검색기능](https://github.com/GreenPai/travel/assets/145432813/05f20977-26a7-45a6-9f4c-490a33b9f7c0)




# 열차 정보 
![열차정보](https://github.com/GreenPai/travel/assets/145432813/fae3d445-0d0b-4983-b5e1-fe093f5fe6b2)



# 정보 출력 (맛집정보, 도보여행)

### 맛집정보

![맛집정보](https://github.com/GreenPai/travel/assets/145432813/c31db06f-77c8-4675-8f5c-350433d8e329)

### 도보여행
![도보여행](https://github.com/GreenPai/travel/assets/145432813/3f362a83-4282-41bc-b9a8-ce87836bb75b)

### 상세페이지
![image](https://github.com/GreenPai/travel/assets/145432813/499d092d-a320-431b-9acd-01e0f65b707d)





