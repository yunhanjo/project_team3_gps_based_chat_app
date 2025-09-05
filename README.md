<h1 align="center"> ⚡ SparkTalk - Local Community Chat App 💬 </h1> 

<div align="center">
  <img width="200" height="450" alt="splash" src="https://github.com/user-attachments/assets/d2c638dd-e4f0-419b-847a-0543b259cb9b" />
  <img width="200" height="450" alt="welcome1" src="https://github.com/user-attachments/assets/048d54ba-fce3-4286-872e-73730d16b7d9" />
  <img width="200" height="450" alt="welcome2" src="https://github.com/user-attachments/assets/78a67e6e-8e6e-4257-9d97-4687aac0f8a0" />
  <img width="200" height="450" alt="chatlist1" src="https://github.com/user-attachments/assets/1d20809c-ca1a-4be0-803b-7404bea10943" />
  <img width="200" height="450" alt="chatlist2" src="https://github.com/user-attachments/assets/c967c605-93b3-4d94-900a-1750a612e59c" />
  <img width="200" height="450" alt="chat" src="https://github.com/user-attachments/assets/999be9b0-ae83-483b-9fac-528858a4d634" />
  <img width="200" height="450" alt="chatadd" src="https://github.com/user-attachments/assets/edb1764c-4dea-4019-8ee0-890117810855" />
</div>
<br>

<h3 align="center"> [Flutter 숙련] GPS 기반 채팅 어플 </h3>
<p align="center"> 프로젝트 일정 [ 25/08/06 ~ 25/08/13 ] </p>
<br>
<br>
<br>




## 🚀 Our Crew
| 이름   | 역할                                              | 담당 페이지   |
|--------|---------------------------------------------------|--------------------|
| 김현수 | 팀장, 발표, Firebase                  | ChatPage       |
| 임초희 | 발표 자료 제작, Firebase             | ChatListPage           |
| 조민우 | 테스트 및 버그 수정, 시연 영상 제작, vworld API, 디바이스 좌표 생성                     | WelcomPage          |
| 윤한조 | ReadMe 및 SA 작성, QnA & 피드백 정리           | ChatAddPage          |
| 공통 | SA 작성, 담당 UI 디자인, 스크럼 일지 정리 |                    |
<br>

## 📂 프로젝트 바로가기 링크  
👊 Notion :  
[https://www.notion.so/teamsparta/3-2292dc3ef51481f78278d05644de5569](https://www.notion.so/teamsparta/23a2dc3ef514811b8979de9fcadb0019)

👊 Figma :  
[https://www.figma.com/design/cHLJc3lDYGpLKZ0A4eqj3Y/%EC%A3%BC%ED%8A%B9%EA%B8%B0-%EA%B8%B0%EC%B4%88_3%EC%A1%B0?node-id=0-1](https://www.figma.com/design/9nId9948y9pN9VVlCxoiKV/Flutter-%EC%88%99%EB%A0%A8-3%EC%A1%B0?node-id=0-1&p=f&t=kWcywHbjgo9txEfj-0)

👊 GitHub :  
[https://github.com/hyun471/project_team3_gps_based_chat_app]

👊 YouTube :  
[https://www.youtube.com/watch?v=h_aDIZ1Qcy4](https://www.youtube.com/watch?v=aaIQROUmzg4)  
<br>

## 🔍 프로젝트 개요
- 위치 기반 기술을 활용해 사용자의 근거리 지역(동 단위)을 중심으로  
  `이름이나 나이 등에 상관없이` 불특정 다수와 채팅 및 `소모임 참여`가 가능한 플랫폼
- 바쁜 현대 사회 속에서 `가벼운 만남이나 새로운 연결을 원하는 사람들`을 대상으로 제작
- 번거로운 가입 없이, `즉흥적이고 자연스러운 소통`을 추구하는 사람들을 위한 어플
<br>

## 🎯 프로젝트 구조
<br>
<div>
  <img width="745" height="292" alt="Screenshot 2025-08-12 at 8 49 16 PM" src="https://github.com/user-attachments/assets/9cf6b84e-2170-4452-ba79-3b78ec49ccb6" />
</div>
<br>
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

## 📱 App Screens & Features
| 화면                | 설명                 | 핵심 요소                  | 미리보기                                                                                                                                                                                                                                                                                                                  																																																																																						  |
| --------------------- | ------------------------------ | ----------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Splash Page**    | 앱 실행 시 로고 노출                   | 로고                                  | <img width="200" height="400" alt="splash" src="https://github.com/user-attachments/assets/d2c638dd-e4f0-419b-847a-0543b259cb9b" />                                                                                                                                                                                     |
| **Welcome Page**   | 로그인 없이 익명 닉네임 입력,<br>GPS 사용 여부 체크 | 닉네임 입력창,<br>저장 버튼,<br>GPS로 지역(동)명 불러오기 | <div><img width="200" height="400" alt="welcome1" src="https://github.com/user-attachments/assets/048d54ba-fce3-4286-872e-73730d16b7d9" /><img width="200" height="400" alt="welcome2" src="https://github.com/user-attachments/assets/78a67e6e-8e6e-4257-9d97-4687aac0f8a0" /></div>   |
| **Chat List Page** | 위치 기반 채팅방 목록 표시           | 동 이름,<br>채팅방 카드,<br>필터 버튼                 | <div><img width="200" height="400" alt="chatlist1" src="https://github.com/user-attachments/assets/1d20809c-ca1a-4be0-803b-7404bea10943" /><img width="200" height="400" alt="chatlist2" src="https://github.com/user-attachments/assets/c967c605-93b3-4d94-900a-1750a612e59c" /></div> |
| **Chat Page**      | 실시간 채팅 UI                      | 메시지 목록,<br>입력창,<br>전송 버튼                  | <img width="200" height="400" alt="chat" src="https://github.com/user-attachments/assets/999be9b0-ae83-483b-9fac-528858a4d634" />                                                                                                                                                                                       |
| **Chat Add Page**  | 사용자 위치 기준<br>새로운 채팅방 생성           | 주소 확인,<br>제목 입력,<br>등록 버튼                 | <img width="200" height="400" alt="chatadd" src="https://github.com/user-attachments/assets/edb1764c-4dea-4019-8ee0-890117810855" />                                                                                                                                                                                    |


<br>

## ⚙️ 핵심 기능
- 이름, 나이, 연락처 없이 닉네임만으로 채팅 참여 가능
- 개인정보 노출 최소화 → 자유로운 소통 환경 제공
- 사용자의 현재 위치(예: "역삼동")를 기준으로 자동 생성된 채팅방에 참여하거나 직접 개설 가능
- 특정 장소 기반 이벤트/소모임 형성 용이  
<br>

## 🛠 Technologies & 💻 Development Tools
- Flutter 3.32.7
- Dart 3.8.1
- Riverpod - 상태 관리 라이브러리  
- Firebase - 백엔드 서비스 연동  
- uuid – 사용자 고유 ID 및 데이터 식별자 생성
- google_fonts – 구글 폰트를 통한 UI 타이포그래피 개선
- Visual Studio Code – 전체 프로젝트 개발 IDE  
- iOS Simulator / Android Emulator – 기능 테스트 및 UI 시뮬레이션  
- Figma – UI/UX 화면 설계 및 와이어프레임 제작  
- GitHub – 형상 관리 및 협업
<br>

## 🤝 커밋 컨벤션
- ✨ : 새로운 기능 추가
- 🐛  : 버그 수정
- 📝 : 문서 관련 변경 (예: README, 주석 등)
- 🎨 : UI/스타일 수정
- ♻️ : 기능 변경 없이 코드 구조만 개선
- 🎉 : 프로젝트 시작
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

