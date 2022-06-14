<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="headers">
	<div id="header-body">
		<div id="header-contents">
			<div class="logo">
				<a href="index"><img src="resources/images/logo.png"/></a>
			</div>
			<div class="menu-contents">
				<a class="menu-item" onclick="findCinemaMenu()">영화관찾기</a>
				<a class="menu-item" href="movie">영화검색</a>
				<c:if test="${ sessionScope.myinfo == null }">
					<a class="menu-item" href="login">로그인</a>
					<a class="menu-item" href="signup">회원가입</a> 
				</c:if>
				<c:if test="${ sessionScope.myinfo != null }">
					<a class="menu-item" href="mypage" onclick="goMypage()">마이페이지</a>
					<a class="menu-item" href="logout">로그아웃</a> 
				</c:if>
				<a class="menu-item" id="quick-ticket" href="ticket">빠른예매</a>
			</div>
		</div>
	</div>
</div>

<div class="cinema">
	<div class="cinema-search">
		<div class="search-box">
			<input type="text" class="cinema-search-item" placeholder="영화관찾기"/>
			<button class="close-btn" onclick="closeCinemaMenu()">닫기</button>
		</div>
	</div>
	<div class="cinema-address">
		<div class="cinema-address-items">
			<a class="cinema-address-item on" onclick="searchAddress('address', '', 0)">전체</a>
			<a class="cinema-address-item" onclick="searchAddress('address', '서울', 1)">서울</a>
			<a class="cinema-address-item" onclick="searchAddress('address', '경기', 2)">경기</a>
			<a class="cinema-address-item" onclick="searchAddress('address', '인천', 3)">인천</a>
			<a class="cinema-address-item" onclick="searchAddress('address', '충남', 4)">충남</a>
			<a class="cinema-address-item" onclick="searchAddress('address', '대구', 5)">대구</a>
			<a class="cinema-address-item" onclick="searchAddress('address', '경북', 6)">경북</a>
			<a class="cinema-address-item" onclick="searchAddress('address', '경상남도', 7)">경남</a>
			<a class="cinema-address-item" onclick="searchAddress('address', '전북', 8)">전북</a>
			<a class="cinema-address-item" onclick="searchAddress('address', '광주', 9)">광주</a>
		</div>
		<div class="cinema-local-result">
			<c:forEach items="${cinemaList}" var="list">
				<a class="cinema-local-item" href="cinema_detail?no=${list.cinema_id}">${list.cinema_name}</a>
			</c:forEach>
		</div>
	</div>
</div>

<!-- MOBILE HEADER -->
<div id="mobile-headers">
	<div class="mobile_menu">
		<button type="button" class="menu-toggle" onclick="toggleMenu()">
			<span class="sr-only"></span>
		</button>
		<div class="logo">
			<a href="index"><img src="resources/images/logo.png"/></a>
		</div>
	</div>
	<div class="ticket_content">
		<img class="ico-m-mypage" src="resources/images/ico_m_mypage.png" />
		<img class="ico-m-ticket" src="resources/images/ico_m_ticket.png" />
	</div>
	<div class="menu-collapse" id="sidebar">
		<div class="menu-header">
			<button type="button" class="menu-toggle" onclick="toggleMenu()">
				<span class="sr-only"></span>
			</button>
		</div>
		<div class="menu-contents">
			<section class="menu-logo">
				<a href=""><img src="resources/images/logo.png"/></a>
			</section>
			<div class="menu-items">
				<div class="menu-items-img-text">
					<img class="menu-item-img" src="resources/images/ico_aside_menu1.png" /> 
					<a class="menu-item" id="side-home-menu" href="index">홈화면</a>
				</div>
				<div class="menu-items-img-text">
					<img class="menu-item-img" src="resources/images/ico_aside_menu2.png" /> 
					<a class="menu-item" onclick="findCinemaMobileMenu()">영화관찾기</a>
				</div>
				<div class="menu-items-img-text">
					<img class="menu-item-img" src="resources/images/ico_aside_menu3.png" /> 
					<a class="menu-item" href="movie">영화검색</a>
				</div>
				<c:if test="${ sessionScope.myinfo == null }">
					<div class="menu-items-img-text">
						<img class="menu-item-img" src="resources/images/ico_aside_menu5.png" /> 
						<a class="menu-item" href="login">로그인</a>
					</div>
					<div class="menu-items-img-text">
						<img class="menu-item-img" src="resources/images/ico_aside_menu6.png" /> 
						<a class="menu-item" href="signup">회원가입</a>
					</div>
				</c:if>
				<c:if test="${ sessionScope.myinfo != null }">
					<div class="menu-items-img-text">
						<img class="menu-item-img" src="resources/images/ico_aside_menu4.png" />
						<a class="menu-item" href="mypage" onclick="goMypage()">마이페이지</a>
					</div>
					<div class="menu-items-img-text">
						<img class="menu-item-img" src="resources/images/ico_aside_menu5.png" /> 
						<a class="menu-item" href="logout">로그아웃</a>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	<button type="button" class="menu-dim" onclick="toggleMenu()"></button>
</div>
<!-- //MOBILE HEADER -->
