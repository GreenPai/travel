# 🌴 TRAVEL - 부산 여행 일정 플래너

[👉 시연 영상 보러가기](https://www.youtube.com/watch?v=IwTeRRH26yo)  

---

## 🧭 프로젝트 개요

**⛳ 주제**  
당일치기 부산 여행을 위한 맞춤형 여행 플래너 웹사이트 개발

**📌 목적**  
기존 여행 일정 사이트는 전국 또는 세계 정보를 위주로 제공하여 부산에 특화된 정보가 부족하다고 느꼈습니다.  
이 프로젝트는 부산에 대한 관광지, 축제, 기상, 주차, 맛집, 편의시설 등 세부 정보를 통합 제공하여  
**사용자가 직접 일정을 자유롭게 계획할 수 있는 웹 플랫폼**을 만드는 것을 목표로 했습니다.

---

## 📅 개발 기간  
**2023.11.03 ~ 2023.11.28**

---

## 🧑‍🤝‍🧑 팀 구성

| 이름 | 역할 |
|------|------|
| **우상호 (팀장)** | 로그인, 회원가입, CRUD, 일정 관리, 캘린더 API 연동, DB 설계 |
| 홍지원 | 관광지·문화재·주차장 등 API 연동, 전체 UI 디자인 |
| 고상현 | 지도 API, 날씨·철도 API, 디자인 및 DB 연동 |

---

## 🛠️ 사용 기술

- **Front-end**: HTML, CSS, JavaScript, jQuery, Bootstrap, Ajax  
- **Back-end**: Java, Spring Boot (STS3)  
- **Database**: Oracle, MyBatis  
- **Tools**: Gradle, GitHub, Kakao Oven  

---

## 📌 주요 기능

### 🗺 부산 여행 정보
- 부산의 주요 관광 명소, 도보 여행지, 맛집 정보 제공
- 지도 기반 명소 위치 확인
- 공영주차장, 편의시설, 문화재 정보 표시
- 실시간 및 6시간 간격 날씨 정보 제공
- 테마형 코스 안내 (e.g. 초량이바구길 루트)

### 🗓 일정 관리
- 날짜별 일정 등록 (Day1, Day2, ...)
- 일정별 날씨 정보 자동 표시 (최저/최고기온, 상태 등)
- 지도 API로 명소·맛집 추천 연동
- 지역별 부산행 열차 시간표 확인 기능

### 📝 게시판 기능
- CRUD (글쓰기, 수정, 삭제)
- 페이징 처리
- 댓글 및 대댓글 기능
- FAQ 별도 게시판 구현

### 👤 회원 기능
- 부트스트랩 기반 회원가입 폼
- 세션 기반 로그인/로그아웃 처리

---

## 🗂 ERD

<img src="https://github.com/GreenPai/travel/assets/145432813/66c66c29-d1b9-4342-80a3-a1bed7f37020" width="700"/>

---

## 📷 주요 화면 캡처

### 📅 일정 관리 화면

#### 📌 캘린더 UI
<img src="https://github.com/GreenPai/travel/assets/145432813/c5196717-6486-4d02-8d82-1a420da22eac" width="600"/>

#### 🌦 날씨 정보 표시
<img src="https://github.com/GreenPai/travel/assets/145432813/9116db94-d41e-4516-b3c0-34095828acee" width="600"/>

#### 📝 일정 작성 폼
<img src="https://github.com/GreenPai/travel/assets/145432813/c4688d81-c6ad-4caa-b07a-030ca2e2d3c4" width="600"/>

#### 📄 일정 상세 페이지
<img src="https://github.com/GreenPai/travel/assets/145432813/dfe135fa-597a-46d3-acb0-7664de691cfc" width="600"/>

---

### 🗺 지도 및 명소 정보

#### 🔍 지도 검색 기능
<img src="https://github.com/GreenPai/travel/assets/145432813/731b18bc-1739-4988-a670-489b84340c4a" width="600"/>

#### 🏞 명소 정보
<img src="https://github.com/GreenPai/travel/assets/145432813/0cc84040-862b-45a0-8f10-39018b28e11a" width="600"/>

#### 📍 구 단위 검색 기능
<img src="https://github.com/GreenPai/travel/assets/145432813/05f20977-26a7-45a6-9f4c-490a33b9f7c0" width="600"/>

---

### 🚆 교통 & 맛집 정보

#### 🚄 부산행 열차 시간표
<img src="https://github.com/GreenPai/travel/assets/145432813/fae3d445-0d0b-4983-b5e1-fe093f5fe6b2" width="600"/>

#### 🍴 맛집 정보
<img src="https://github.com/GreenPai/travel/assets/145432813/c31db06f-77c8-4675-8f5c-350433d8e329" width="600"/>

#### 🚶 도보 여행 추천
<img src="https://github.com/GreenPai/travel/assets/145432813/3f362a83-4282-41bc-b9a8-ce87836bb75b" width="600"/>

#### 📌 상세정보 보기
<img src="https://github.com/GreenPai/travel/assets/145432813/499d092d-a320-431b-9acd-01e0f65b707d" width="600"/>

---

## 🙌 마무리

이 프로젝트는 공공데이터와 다양한 외부 API를 활용하여 여행의 모든 과정을 사용자 중심으로 통합 관리할 수 있도록 기획하고 구현한 의미 있는 경험이었습니다. 사용자 편의성과 실시간 데이터 연동에 집중하여 실제로 사용할 수 있는 서비스를 만드는 데 초점을 맞췄습니다.

