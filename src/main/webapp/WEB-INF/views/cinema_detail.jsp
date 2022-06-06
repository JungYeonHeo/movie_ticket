<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>  
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file = "head.jsp" %>
    <link type="text/css" rel="stylesheet" href="resources/css/cinema_detail.css">
    <title>대체로 맑음</title>
</head>
<body>
    <div id="wrap">
        <%@ include file = "header.jsp" %>
        <div class="top-container">
        	<div class="cinema-name">${cinema.cinema_name}</div>
        	<img class="main-poster" src="${cinema.cinema_main_img}" alt="극장 포스터">
        </div>

        <div class="contents-main">
        	<div class="contents-contrainer">
        	
        		<div class="contents-header">
		            <div class="contents-titles">
		                <div id="showing" class="selectitem">현재상영작</div>
		                <div id="notshowing" class="noselectitem">개봉예정작</div>
					</div>
				</div>
				<hr color="grey">
				<div class="contents-items">
					<div class="contents-items-showing">
						<c:if test="${fn:length(cinemaShowingMovieList) == 0}">
							<div class="subtitle">현재 상영중인 영화가 없습니다.</div>
						</c:if>
						<c:if test="${fn:length(cinemaShowingMovieList) != 0}">
							<c:forEach items="${cinemaShowingMovieList}" var="list">
				                <div class="contents-item">
				                	<div class="contents-item-infor" onclick="moveMovieDetail(${list.movie_id})">
				                		<c:if test="${list.g_rate_id == 1}">
						                	<img class="contents-item-grate" src="resources/images/전체.png" alt="관람등급이미지">
				                		</c:if>
				                		<c:if test="${list.g_rate_id == 2}">
						                	<img class="contents-item-grate" src="resources/images/12.png" alt="관람등급이미지">
				                		</c:if>
				                		<c:if test="${list.g_rate_id == 3}">
						                	<img class="contents-item-grate" src="resources/images/15.png" alt="관람등급이미지">
				                		</c:if>
				                		<c:if test="${list.g_rate_id == 4}">
						                	<img class="contents-item-grate" src="resources/images/청불.png" alt="관람등급이미지">
				                		</c:if>
					                	<img class="contents-item-poster" src="${list.poster_img}" alt="영화 포스터">
				                	</div>
				                	<div class="contents-item-title">${list.title_ko}</div>
				                	<div class="contents-item-review">
					                	<img class="contents-item-review-img" src="resources/images/ic-star-small-on.png" alt="별모양">
					                	<div class="contents-item-review-member">일반</div>
					                	<div class="contents-item-review-score">${list.gen_avg_rate}</div>
				                	</div>
				                	<button class="contents-item-btn" onclick="makingReservation(${list.movie_id}, '${cinema.cinema_id}')">예매하기 →</button>
				                </div>
			                </c:forEach>
   						</c:if>
					</div>
					<div class="contents-items-notshowing">
						<c:if test="${fn:length(cinemaNotShowingMovieList) == 0}">
							<div class="subtitle">개봉예정인 영화가 없습니다.</div>
						</c:if>
						<c:if test="${fn:length(cinemaNotShowingMovieList) != 0}">
							<c:forEach items="${cinemaNotShowingMovieList}" var="list">
				                <div class="contents-item">
				                	<div class="contents-item-infor" onclick="moveMovieDetail(${list.movie_id})">
				                		<c:if test="${list.g_rate_id == 1}">
						                	<img class="contents-item-grate" src="resources/images/전체.png" alt="관람등급이미지">
				                		</c:if>
				                		<c:if test="${list.g_rate_id == 2}">
						                	<img class="contents-item-grate" src="resources/images/12.png" alt="관람등급이미지">
				                		</c:if>
				                		<c:if test="${list.g_rate_id == 3}">
						                	<img class="contents-item-grate" src="resources/images/15.png" alt="관람등급이미지">
				                		</c:if>
				                		<c:if test="${list.g_rate_id == 4}">
						                	<img class="contents-item-grate" src="resources/images/청불.png" alt="관람등급이미지">
				                		</c:if>
					                	<img class="contents-item-poster" src="${list.poster_img}" alt="영화 포스터">
				                	</div>
				                	<div class="contents-item-title">${list.title_ko}</div>
				                	<div class="contents-item-review">
					                	<img class="contents-item-review-img" src="resources/images/ic-star-small-on.png" alt="별모양">
					                	<div class="contents-item-review-member">일반</div>
					                	<div class="contents-item-review-score">${list.gen_avg_rate}</div>
				                	</div>
				                	<button class="contents-item-btn" onclick="makingReservation(${list.movie_id}, '${cinema.cinema_id}')">예매하기 →</button>
				                </div>
			                </c:forEach>
   						</c:if>
					</div>
				</div>

        		<div class="group">
	        		<div class="contents-header">
			            <div class="contents-titles">
			                <div class="title">영화관 소개</div>
						</div>
					</div>
					<hr color="grey">
					<div class="contents-items">
						<div class="cinema-infor">
							<img class="cinema-infor-img" src="${cinema.cinema_intro_img}" alt="영화관 대표소개이미지"/>
							<div class="cinema-infor-group">
								<div class="cinema-infor-title">${cinema.cinema_intro_title}</div>
								<div class="text">${fn:replace(cinema.cinema_intro, replaceChar, "<br/>")}</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="group">
	        		<div class="contents-header">
			            <div class="contents-titles">
			                <div class="title">위치 안내</div>
						</div>
					</div>
					<hr color="grey">
					<div class="contents-items">
						<div class="cinema-location">
							<div class="subtitle">오시는길</div>
							<div class="text">${cinema.address}</div>
							<div class="subtitle">연락처</div>
							<div class="text">${cinema.tel}</div>
							<div class="subtitle">주차안내</div>
							<div class="text">${fn:replace(cinema.parking_guidance, replaceChar, "<br/>")}</div>
						</div>
					</div>
				</div>
				
				<div class="group">
	        		<div class="contents-header">
			            <div class="contents-titles">
			                <div class="title">영화관 이미지</div>
						</div>
					</div>
					<hr color="grey">
					<div class="contents-items">
						<div class="cinema-images">
						<c:forEach items="${cinemaImages}" var="list">
			        		<div class="cinema-images-group">
			        			<img class="cinema-images-img" src="resources/images/${list.cinema_images}" alt="영화관내부이미지">
			        			<div class="detail-contents-subtitle">${list.cinema_images_comment}</div>
			        		</div>
		        		</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
        <%@ include file = "footer.jsp" %>
    </div>
</body>

<script type="text/javascript">
var selectBool = 1;
$("#showing").click(function () {
    $("#showing").attr("class", "selectitem");
    $("#notshowing").attr("class", "noselectitem");
    $(".contents-items-showing").css("display", "flex");
    $(".contents-items-notshowing").css("display", "none");
    selectBool = 1;
});

$("#notshowing").click(function () {
    $("#showing").attr("class", "noselectitem");
    $("#notshowing").attr("class", "selectitem");
    $(".contents-items-showing").css("display", "none");
    $(".contents-items-notshowing").css("display", "flex");
    selectBool = 2;
});

function moveMovieDetail(movieID) {
	location.href = "movie_detail?no=" + movieID;
}

function makingReservation(movieID, cinemaID) {
	location.href = "ticket?movie=" + movieID + "&cinema=" + cinemaID;
}
</script>
</html>