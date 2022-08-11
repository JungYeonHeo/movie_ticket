<div align="center">

  # 🍿 영화 예매 풀스택 서비스
<p>
  <img src="https://img.shields.io/badge/html-de4b25?style=flat&logo=html5&logoColor=white"/>
  <img src="https://img.shields.io/badge/css3-2891ca?style=flat&logo=css3&logoColor=white"/>
  <img src="https://img.shields.io/badge/jquery-0766a8?style=flat&logo=jquery&logoColor=white"/>
  <img src="https://img.shields.io/badge/ajax-448fc5?style=flat&logo=jquery&logoColor=white"/>
  <img src="https://img.shields.io/badge/chart.js-fff000?style=flat&logo=javascript&logoColor=white"/>
  <img src="https://img.shields.io/badge/tomcat-d1a62d?style=flat&logo=Apache&logoColor=white"/>
  <img src="https://img.shields.io/badge/spring-67b945?style=flat&logo=spring&logoColor=white"/>
  <img src="https://img.shields.io/badge/mybatis-000000?style=flat&logo=spring&logoColor=white"/>
  <img src="https://img.shields.io/badge/MySQL-4479A1?style=flat&logo=MySQL&logoColor=white"/>
</p>
</div> 

<br/>

## DB 설계 스키마
![스키마](https://user-images.githubusercontent.com/94504613/184093546-e4f695db-512b-4a4a-9123-3b9ea5bd9558.png)
[DB 설계시 고려한 점 블로그 정리](https://golgol22.github.io/posts/movie-db-design/)

<br>

## 구현화면
#### **📌 메인페이지**
![main](https://user-images.githubusercontent.com/94504613/184093966-b7b03a08-15b6-4441-9840-4f5b1df0fdc1.png)
- [X] 배너 이미지 3개
- [X] 인기있는 영화순으로 Top10 나열
- [X] 영화관, 영화, 로그인, 회원가입, 마이페이지 빠른예매 메뉴
- [X] 모바일, 태블릿을 위한 반응형 레이아웃


#### **📌 영화관 메뉴**
![영화관_메뉴](https://user-images.githubusercontent.com/94504613/184094366-bdfab094-a250-452a-b42c-5506a858993d.png)
- [X] Ajax를 사용하여 비동기 검색 ⇒ 검색어 입력시 바로 검색결과 확인
- [X] 지역에 따른 영화관 확인

#### **📌 영화관 상세**
![영화관_상세1](https://user-images.githubusercontent.com/94504613/184094829-11e6022d-f9d9-4e27-b6ff-f7c586c69c07.png)
![영화관_상세2](https://user-images.githubusercontent.com/94504613/184094837-9aa6a802-c3e8-4dd5-9577-1991ca7af2e0.png)
- [X] 영화관에서 상영중인 영화와 개봉 예정중인 영화 확인
- [X] 영화관 정보(오시는 길, 전화번호, 주차정보, 내부이미지)확인 
- [X] 해당 페이지에서 예매하기 버튼을 누르면 영화관은 선택된 채로 예매창이 뜸

#### **📌 영화 메뉴**
![영화_매뉴](https://user-images.githubusercontent.com/94504613/184095280-c58a9789-2b31-437e-bad2-adf080d1706b.png)
- [X] 장르에 마우스 올리면 스크롤바가 나타나 모든 장르를 볼 수 있음
- [X] 장르를 선택하면 장르에 맞는 영화 종류만 볼 수 있음 
- [X] Ajax를 사용하여 비동기 검색 ⇒ 검색어 입력시 바로 검색결과 확인
- [X] 해당 페이지에서 예매하기 버튼을 누르면 영화는 선택된 채로 예매창이 뜸

#### **📌 영화 상세페이지**
![영화상세1](https://user-images.githubusercontent.com/94504613/184095682-cab79b1e-6da5-4ac2-bc67-dc770a30282b.png)
- [X] chart.js를 사용하여 연령별 예매율, 성별 예매율 그래프를 그림

![영화상세2](https://user-images.githubusercontent.com/94504613/184095688-697a8323-2995-4945-91d2-6e38af41a60b.png)
![영화상세3](https://user-images.githubusercontent.com/94504613/184095696-5ae3ab57-9371-4d63-b352-69158c8d3afb.png)
![영화상세4](https://user-images.githubusercontent.com/94504613/184095699-5b04eafb-3c17-4a5e-9764-60758c269e43.png)
- [X] 별점 분포에 퍼센트를 따른 프로그래스바로 나타냄
- [X] 공감 버튼을 누르면 공감수 증가

![영화상세5](https://user-images.githubusercontent.com/94504613/184095701-635f926f-52e3-42be-b9b0-3ceb09743871.png)
![영화상세6](https://user-images.githubusercontent.com/94504613/184095705-0192ab2c-aed3-4714-9cd5-cc7ffbab7df4.png)

#### **📌 예매**
![예매1](https://user-images.githubusercontent.com/94504613/184096162-df8710ad-a06d-4e6d-843b-1d99c68da023.png)
- [X] 영화, 영화관, 날짜를 선택하면 가능한 시간대를 불러옴
- [X] 영화, 영화관, 날짜, 시간대까지 모두 선택해야 버튼 활성화하여 다음 페이지로 이동

![예매2](https://user-images.githubusercontent.com/94504613/184105266-b0497088-b09a-4edf-9fbb-1d060e841d8b.png)
- [X] 인원을 먼저 지정하고 지정한 인원만큼 좌석을 클릭해야 결제 진행
- [X] 이미 예매된 좌석은 회색으로 표시
- [X] 아임포트를 이용한 카카오페이 결제를 진행 

#### **📌 로그인/회원가입**
![로그인](https://user-images.githubusercontent.com/94504613/184096175-9b05a034-d929-4a6c-8963-ea3fd1635513.png)
![회원가입](https://user-images.githubusercontent.com/94504613/184142176-f4819ae2-ae4f-4bd0-8e88-e30c857e7725.png)

#### **📌 마이페이지**
**예매 목록**
![예매목록](https://user-images.githubusercontent.com/94504613/184097174-651f35a3-4017-4182-8dbc-52547c71c612.png)

**리뷰 목록 및 리뷰 작성**
![리뷰목록](https://user-images.githubusercontent.com/94504613/184097181-3abf9a27-68ab-4cb8-a7f5-3d7f54e453c1.png)
![리뷰작성](https://user-images.githubusercontent.com/94504613/184097182-5db68547-3e2b-4810-afa4-2f8ab2bddc45.png)
- [X] 리뷰를 작성하면 DB의 트리거가 추가된 리뷰 점수를 포함하여 평점을 내어 `movie`테이블에 저장해주는 방식으로 구현

**Q&A**
![QA1](https://user-images.githubusercontent.com/94504613/184097204-46e3fc99-5fc9-4ee4-a230-476162c1b94f.png)
![QA2](https://user-images.githubusercontent.com/94504613/184097485-b2adcce8-c208-4aca-8fb8-4c48af6f7af5.png)
![QA3](https://user-images.githubusercontent.com/94504613/184097215-fd83f150-350f-4849-95b3-9b9bda59b6dc.png)
- [X] 문의글에 답변을 달면 DB의 트리거가 `답변완료`로 상태 변경해는 방식으로 구현

**회원정보 수정**
![회원정보수정](https://user-images.githubusercontent.com/94504613/184097218-d98297c8-3ba1-402d-9e5a-29e5e235bf3e.png)

<br>

## 프로젝트 후 작성한 블로그 링크
상세한 개발과정을 볼 수 있습니다.

- [jstl 사용법](https://golgol22.github.io/posts/jstl-tip/)
- [spring ajax 사용하기](https://golgol22.github.io/posts/spring-ajax/)
- [결제 api 사용하기](https://golgol22.github.io/posts/payment-api/)
- [이클립스 반영안될 때](https://golgol22.github.io/posts/spring-browser-update-error/)