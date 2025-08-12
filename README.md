<h1 align="center"> ⚡ SparkTalk - Local Community Chat App 💬 </h1> 

<div align="center">
  
</div>
<br>

<h3 align="center"> [Flutter 숙련] GPS 기반 채팅 어플 </h3>
<p align="center"> 프로젝트 일정 [ 25/08/06 ~ 25/08/13 ] </p>
<br>
<br>
<br>




## 팀원 소개 및 담당 역할
| 이름   | 역할                                              | GitHub / Contact   |
|--------|---------------------------------------------------|--------------------|
| 조민우 | 팀장, 상품 목록 페이지 구성, 발표                 | @wackyturtle       |
| 유수현 | 상품 상세 페이지 구성, 발표 자료 제작             | @su-vely           |
| 윤한조 | 상품 등록 페이지 구성, ReadMe                     | @yunhanjo          |
| 동세진 | 장바구니 페이지 구성, 시연 영상 제작              | @HaeAhn00          |
| 공통 | SA 작성, 담당 UI 디자인, 스크럼 일지 정리, QnA 정리 등 |                    |
<br>

## 📂 프로젝트 바로가기 링크  
👊 Notion :  
https://www.notion.so/teamsparta/3-2292dc3ef51481f78278d05644de5569

👊 Figma :  
https://www.figma.com/design/cHLJc3lDYGpLKZ0A4eqj3Y/%EC%A3%BC%ED%8A%B9%EA%B8%B0-%EA%B8%B0%EC%B4%88_3%EC%A1%B0?node-id=0-1

👊 GitHub :  
https://github.com/wackyturtle/flutter_pxmarket_app  

👊 YouTube :  
https://www.youtube.com/watch?v=h_aDIZ1Qcy4  
<br>

## 🎯 주요 목표
- 💡 팀 프로젝트 필수 기능을 안정적으로 구현하는 데 집중  
- 🧱 과도한 확장보다는 핵심 기능을 제대로 작동시키는 것에 주력  
- 📦 프로젝트 전체 흐름이 끝까지 이어지는 완성형 구조를 목표로 설정  
<br>

## 🔍 프로젝트 개요
- 위치 기반 기술을 활용해 사용자의 근거리 지역(동 단위)을 중심으로  
  `이름이나 나이 등에 상관없이` 불특정 다수와 채팅 및 `소모임 참여`가 가능한 플랫폼
- 바쁜 현대 사회 속에서 `가벼운 만남이나 새로운 연결을 원하는 사람들`을 대상으로 제작
- 번거로운 가입 없이, `즉흥적이고 자연스러운 소통`을 추구하는 사람들을 위한 어플
<br>

## 프로젝트 구조
<div>
  <img width="745" height="292" alt="Screenshot 2025-08-12 at 8 49 16 PM" src="https://github.com/user-attachments/assets/9cf6b84e-2170-4452-ba79-3b78ec49ccb6" />
</div>
<pre>
  📁 lib/
├── main.dart
├── firebase_options.dart
├── 📁 common/
│   ├── color.dart
│   ├── 📁 models/
│   │   ├── chat_content.dart
│   │   ├── chat_room_info.dart
│   │   └── user.dart
│   └── 📁 repository/
│       ├── chat_content_repo.dart
│       ├── chat_room_info_repo.dart
│       └── user_repo.dart
└── 📁 pages/
    ├── 📁 welcome/
    │   ├── welcome_page.dart
    │   └── 📁 viewmodel/
    │       └── welcome_view_model.dart
    │
    ├── 📁 chatList/
    │   ├── chat_list.dart
    │   └── 📁 viewmodel/
    │       └── chat_list_view_model.dart
    │   
    ├── 📁 chatAdd/
    │   ├── chat_Add_page.dart
    │   └── 📁 viewmodel/
    │       └── chat_add_view_model.dart
    │  
    ├── 📁 chat/
    │   ├── chat_page.dart
    │   └── 📁 viewmodel/
    │       └── chat_view_model.dart
    │
    └── 📁 splash/
		    └── splash_page.dart
</pre><br>

## ⚙️ 핵심 기능
### 🕵️‍♂️ 익명성 보장
- 이름, 나이, 연락처 없이 닉네임만으로 채팅 참여 가능
- 개인정보 노출 최소화 → 자유로운 소통 환경 제공

### 🗺️ 위치 기반 채팅방 (생성 & 참여)
- 사용자의 현재 위치(예: "역삼동")를 기준으로 자동 생성된 채팅방에 참여하거나 직접 개설 가능
- 특정 장소 기반 이벤트/소모임 형성 용이  
<br>

## ✅ 완료한 필수 기능
### 1. HomePage
- AppBar의 title 속성에 TextField 위젯 배치
- onSubmitted 콜백을 통해 검색어 입력 시 지역 검색 수행
- 검색 결과는 ListView로 출력
- 각 아이템에는 title, category, roadAddress가 세로 정렬로 표시
- 검색 결과 아이템 클릭 시 ReviewPage로 이동
- Riverpod을 통해 상태관리 구현 완료
<br>

### 2. 네이버 검색 Open API 연동
- 네이버 검색 API 키 발급 후 요청 테스트 완료
- dio 패키지를 사용해 비동기 HTTP GET 요청 구현  
- 응답 데이터를 바탕으로 Location 모델 클래스 생성
- LocationRepository 클래스 생성 후 검색 메서드 구현
- flutter_riverpod으로 ViewModel 구성
- HomePage에서 ViewModel과 연결하여 검색 기능 실행
<br>

### 3. Firestore를 이용한 리뷰 저장 및 조회 기능
- 검색 결과 클릭 시 ReviewPage로 이동하여 해당 지역의 리뷰 확인 가능
- mapX, mapY 좌표 기준으로 리뷰 필터링
- 리뷰 작성 후 Firestore에 저장 및 실시간 반영
- Firebase 콘솔에서 프로젝트 생성 및 Firestore 활성화
<br>


## 🛠 Technologies & 💻 Development Tools
- Flutter – 크로스 플랫폼 앱 개발 프레임워크
- Dart – Flutter 앱 개발 언어
- Riverpod - 상태 관리 라이브러리  
- Firebase - 백엔드 서비스 연동  
- uuid – 사용자 고유 ID 및 데이터 식별자 생성
- google_fonts – 구글 폰트를 통한 UI 타이포그래피 개선
- Visual Studio Code – 전체 프로젝트 개발 IDE  
- iOS Simulator / Android Emulator – 기능 테스트 및 UI 시뮬레이션  
- Figma – UI/UX 화면 설계 및 와이어프레임 제작  
- GitHub – 형상 관리 및 협업
<br>


## 🔥 Trouble Shooting
### 1. 💬 채팅이 길어지면 프로필 위치가 아래로 내려가는 현상
[문제상황]  
- 채팅이 길어질수록 프로필 아이콘이 말풍선 하단으로 내려감

[원인분석]  
- Row로 프로필, 말풍선, 시간을 배치하고  
  시간이 하단에 위치하도록 `CrossAxisAlignment.end`를 사용  
- 이로 인해 프로필 박스까지 같이 아래로 정렬됨

[해결방법]  
- `CrossAxisAlignment.start`로 변경  
- 시간 `Text`를 `Column`으로 감싸고 `Spacer`로 아래로 밀어내는 방식 적용
<br>

---

### 2. ⏳ 시간 Text를 Spacer로 밀어내니 Flex 에러 발생
[문제상황]  
- 시간 텍스트를 말풍선 하단으로 보내려고 `Spacer` 사용 시 Flex 관련 에러 발생

[원인분석]  
- 채팅 페이지에서 `Expanded`로 `ListView`가 전체 공간 차지  
- Row 내부에서 Flexible 크기 계산 시 `Spacer`로 인해 높이 계산 불가

[해결방법]  
- 말풍선과 시간을 Row로 묶고  
  Row를 감싸는 Column을 `Expanded`로 감싸서 세로 높이 기준을 제공
<br>

---

### 3. 📱 Device Info Plus로 디바이스 키 조회 실패
[문제상황]  
- 재접속 시 Welcome Page를 건너뛰기 위해 Device Info Plus로 디바이스 키 조회 시도  
- 서로 다른 컴퓨터의 다른 에뮬레이터에서도 키값이 동일하게 나옴

[원인분석]  
- 에뮬레이터 환경에서 동일한 기기 정보가 반환됨 → 식별 불가능

[해결방법]  
- `uuid` + `shared_preferences` 활용  
- 앱 최초 실행 시 무작위 UUID 생성 후 로컬 저장  
- 이후 실행 시 로컬에서 UUID 불러와 동일 사용자로 인식
<br>

---

### 4. 🔍 Firestore 여러 컬럼 조건 조회 시 Error
[문제상황]  
- Firestore에서 여러 필드 조건으로 검색 시 에러 발생

[원인분석]  
- Firestore는 복합 조건 쿼리를 처리하기 위해 **복합 인덱스** 필요

[해결방법]  
- Firebase Console → Firestore 인덱스 설정에서  
  필요한 복합 필드 인덱스를 각각 생성
<br>

---

### 5. 🗺️ UI와 Firestore 저장 값 불일치
[문제상황]  
- UI에는 최신 GPS 주소(`userAddress`)가 보이지만  
  Firestore에는 최초 전달된 `widget.address`가 저장됨

[원인분석]  
- Firestore 저장 시 `userAddress`가 아니라  
  페이지 생성 시 전달된 `widget.address`를 그대로 사용

[해결방법]  
- 저장 로직에서 `widget.address` 대신 `userAddress` 사용

<br>
<br>
<br>

