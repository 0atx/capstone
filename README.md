# #36 Capstone HJJH Trip Team_ README FILE
### 한성대학교 컴퓨터공학부 2021년도 캡스톤 디자인 


  <caption><b> TEAM MEMBERS</b></caption><br>
  
| 이름 | 학번 |
|:-:|---|
| 박윤하(팀장)  | 1771360  |
| 강지윤  | 1771005  |
| 김유진  | 1771051  |
| 서승희  | 1771371  |
<br>

## 1. 프로젝트 수행 목적 

### 1.1 프로젝트 이름

<b> HJJH TRIP</b>

### 1.2 프로젝트 정의

<p>
카카오 API를 이용한 사용자 맞춤 여행 일정 관리 서비스로, 여행 일정 플래너 기능을 사용자에게 제공한다.
</p>

### 1.3 프로젝트 목표

<p>

카카오 api를 기반으로 spring 프레임워크를 이용한 웹 서비스로,
여행일정관리 서비스 웹 어플리케이션을 목표로 하였다.

웹 페이지에 접근한 사용자가 여행 목적지, 여행 날짜를 선택하고 여행장소, 호텔을 선택하면 모든 여행일정을 관리할 수 있는 서비스를 제공한다.

</p>

## 2. 프로젝트 결과물의 개요

### 2.1 프로젝트 개요 및 설명

<p>
최근 코로나19로 인해서 국내여행의 인기가 높아지고 있고, 현재에는 패키지상품을 제외하고, 사용자가 직접 모든 일정을 관리할 수 있는 웹페이지는 많지 않다.
이러한 점을 보완하여 웹 사용자에게 서비스를 제공하기 위해 프로젝트를 제작하였다.<br><br>
웹페이지에서 가고자 하는 장소를 선택한 후, 이동된 페이지에서 여행 날짜를 입력하고 장소를 입력하면, 관광 명소 등의 장소를 몇 일차 일정에 갈 것인지 선택할 수 있다.(총 여행일수 까지만 가능) 이후 일정 생성 버튼을 누르게 되면 사용자의 email address를 입력받아 이를 이용하여 데데이터 베이스에 SQL문을 이용하여 저장된다. 이동되는 완성된 일정을 보여주는 여행일정 관리페이지에서 생성된 일정을 확인하고 삭제 등 일정을 관리할 수 있다.<br>
저장된 후 메인화면 메뉴바 옵션을 통해서 나의 여행일정관리 불러오기에서 입력된 사용자의 이메일을 통해 db에 저장되어있는 개인의 여행일정을 확인가능하다.
</p>

### 2.2 프로젝트 구조


<figure>
    <img src="https://lh3.googleusercontent.com/WIwkt5LLGlfGC21wswZpVdm-PjCXLZBE3ChEAj7DXnimZHD0z-7RHmWHq_cvBC9Omz9ZfQ1eEFmDW_VTtLLvoVGsrnn2HfgnH_WA7oJm" title="프로젝트 구조도"> <figcaption><b><프로젝트 구조도></b></figcaption>
</figure><br><br>
  
데이터베이스에 SQL을 이용해 CRUD 작업을 진행한다.<br>
KAKAO map API를 이용해 지역의 정보와 장소 등을 가져온다.<br>
Tomcat Server를 이용한 Web Application을 사용자들에게 제공한다.<br>


### 2.3 시나리오

  <figure>
  <img src="https://lh5.googleusercontent.com/KdxEzK4w7-DG3H7d62oqx_PGanIDqQSgMoe2_qEYATHlEDcZfT53IPYioEYg2ecjS9hHAiWbmfTL9JrFstkIR4eg2hrc0cUx6_I18U0YqC9kjDC1GGhRrVWBN2Z4MlECvP9_y-pt" title="전체 시나리오 구조도">
    <figcaption><b><시나리오 구조도></b></figcaption>
  </figure>
    <br><br>
       
<div>
  <ul>
    <li>메인 화면 (Home)</li><br>
    <img src="https://lh5.googleusercontent.com/eNVDEo2PbAJHMv9ySLL9khcJi6ZFrNB6iFL9i2tZbjhVx0lya7foHKJ-0JHDYXF_XAv51v9aJ_A63eh0xTWRLfbu26a9WTaofmqgrPCF-g" title="메인화면">
       <br>사용자가 처음 접속하였을 때 보여지는 페이지 모습 👆<br><br>
      <ul>
        <li> "시작하기" 버튼 누른 후 스크롤 된 지역 목록 부분</li>
          <img src="https://lh6.googleusercontent.com/IOro9hb7u14QYn02R58g2Qb7EI_vtocnfPNcGGNh-sXjFezSzfzVcJarxakP_-f_9O52A53hUdODTuzdshdqSMtt4xRk_xdndhW7-Fi-_g" title="도시목록">
          <br>지역 목록에서는 각 지역의 유명 관광명소, 관련 영상, 날씨 정보를 제공<br>
         원하는 지역을 선택하면 그 지역으로 지도의 시점이 이동된 일정 생성 페이지로 이동함.<br><br>
        <li>상단 메뉴바</li>
        <img src="https://lh6.googleusercontent.com/djDVEXhaU0OR4miDKnZ670m5KQMKPb7Lq54q0bK8mNLDmSzuI7riYB4CLt_-wjM22shUdsRmDSMftbOc3rMEHX8JdQIbCNOILtG8aoAB" title="홈 메뉴바">
       <br> HJJH TRIP 을 누르면 페이지를 리디렉션한다.
        <br>여행지를 누르면 여행지 목록 쪽으로 자동 스크롤이, TOP PAGE를 누르면 가장 상단으로 자동 스크롤이 된다.
        <br>일정 불러오기 에서는 사용자의 이메일을 통해 만들어진 일정을 불러온다.
        <br>이용방법 에는 간단한 사이트 이용방법이 안내된다.<br><br>
        <li>일정 불러오기</li>
        <img src="https://lh5.googleusercontent.com/Q-DpVXONieTlFzjQT9m42dutgxlet57xRGQFClD7cx8Fy2QymaZ3zqHluq1RZoH9wdxzbFkWEj7bImh-KzQt2ksXcKHv3iPrdbueqXOV" title="일정 불러오기 모달 창"><br>
        일정을 생성했을 때 사용한 email을 입력하면 일정 확인 창으로 넘어간다.<br><br>
      </ul>
    <li>일정 생성 화면 (Map)</li>
    <img src="https://lh3.googleusercontent.com/MQATVjpXzfIOhkKUghtFvP2_FkXH_7UHmjVQOm6VNTLUns3kzY5X-VZKO_viQqeAMbWQHRfm5vhy1Iv6qLXnK0Tme9sRrCsh65uBo5Pv" title="맵 화면">
    <br>좌측의 일정 선택에서 날짜를 지정해준다. 이후 우측의 검색 기능을 이용하여 일정에 넣고자 하는 장소를 클릭해 좌측 선택 목록에 추가한다. 선택 목록의 장소 별로 계획된 일자를 넣어준다.(DAY : 1 등) 일정을 다 추가한 후, 일정 생성 버튼을 누른다.<br><br>
    <ul>
      <li>일정 생성 페이지 상단 바</li>
      <img src="https://lh4.googleusercontent.com/ifWnDtCLzdaSSl6R11SsYCsYGWijXpfX_P81J2IdiugTNCCWrZGtPaHbPfnmBmoB4sHtL_Bpym69L0dyQxWjLIQGsWLPhXYEgi5H7MTV" title="map 네비바">
      <br>
      일정창을 누르면 좌측 일정창이, 장소창을 누르면 우측 장소창이 숨겨져 더 넓게 지도를 볼 수 있다.<br><br>
      <li>일정 생성 완료 버튼 클릭 후</li>
      <img src="https://lh5.googleusercontent.com/Kv0ENdTWcAUaRbRpiQCojN6u9Q8SNCYPEkoj4TkRL_NH4L0l5kZDHqnkcLdBcc5gs02Jlb5pznAeXsHLbDpl1Zs_TqKvina9-np1GAVF" title="일정 생성 모달창 ">
      <br>
      사용자의 이메일을 입력받아 데이터베이스에 일정을 저장. 이후, 자동으로 일정 확인 페이지로 넘어간다.
    </ul><br><br>
    <li>일정 확인 화면 (Show)</li>
    <img src="https://lh5.googleusercontent.com/96s56onibBILNLgq-uvf-rsKxt7DdXELWAWtzjpNxOt69XZIs6L1i02QWWy7z7WvsJiH3istGMepDgUskD3tnRkQV6gjC5P4-i92_Mtt" title="show 화면">
    <br>
    사용자가 선택한 장소와 일정에 따라 완성된 일정이 출력된다. 경로보기를 클릭하면 해당하는 장소의 경로를 보여주는 카카오 맵으로 연결된다.<br><br>
    <ul>
      <li>경로보기 이동</li>
      <img src="https://lh6.googleusercontent.com/XeDW11wHxnsjPClKiDw20p1Y4vniBhLxj0abSrwezj59NjIUf82Rwm7MZWNQKocrmYmnWvbv8ox3q5xNz2cTphiFr1h9GaN3-jXeDKvj" title="경로 카카오"><br>
      경로 보기 버튼을 클릭하면 해당되는 장소의 카카오맵 길찾기 페이지가 새로운 창에서 나타난다.
      <br><br>
      <li>일정 확인 페이지 메뉴바</li>
       <img src="https://lh5.googleusercontent.com/C-d-YML_eECvzBglLxVuJJN9jnaQNOLs9ydcbWLM5K0bRKrbdmUKxixStIhl-ZIoNWU3Fj4F3mBtPoSAsoDcofRoIZRKhIAk2gGpDwA" title="show 네비바"><br>
      일정 확인은 Main화면 에서의 일정확인 버튼과 같은 기능을 한다. 일정삭제 버튼을 누르면 삭제를 할 것이지 물어보는 창이 나타난다.
      <br><br>
      <li>일정 삭제 창</li>
       <img src="https://lh6.googleusercontent.com/-wqUdIyBkAX5yFum4dBs1j1F2zijYyfJgoORQjZwguJ83cj-0DHirpm_BREkVgXa9u4V6Xb-DrS_WAKXCldHXhefg98mD3LMI6I9F1F8" title="삭제 모달"><br>
      일정을 정말로 삭제할 것인지 사용자에게 한번더 물어본 후, 삭제 처리를 진행한다.
    </ul><br><br>
  </ul>
    </div>
    
    
### 2.4 기술 스택
    
    
| Tech Stack | Explication|
|:-:|---|
|  Kakao map API | 장소의 경로와 위치 핀 표시 등을 지도에 나타내기 위해 필요한 api|
| MySQL | RDBMS. 일정 관리에 사용|
| Tomcat  | 웹서버 구현|
| Java  | 개발 언어|
| Javascript  | 개발 언어 및 디자인|
| CSS  | 웹 디자인|
| Spring MVC  | opensource application framework|
| Hibernate  | 데이터베이스의 관계 mapping|
| Bootstrap5  | 웹 디자인 |
| Eclipse  | 개발 환경|
| JQuery  | 웹 기능 및 디자인|
| Ajax  | 데이터베이스 접근 및 사용 |
    
    
