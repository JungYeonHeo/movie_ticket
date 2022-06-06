<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file = "head.jsp" %>
    <link type="text/css" rel="stylesheet" href="resources/css/index.css">
    <title>대체로 맑음</title>
</head>
<body>
    <div id="wrap">
        <%@ include file = "header.jsp" %>
        <div id="banner">
            <div>
                <img class="img_box" src="resources/images/banner1.png" style="display: none">
                <img class="img_box" src="resources/images/banner2.png" style="display: block">
                <img class="img_box" src="resources/images/banner3.png" style="display: none">
            </div>
            <div class="main_center">
                <div class="a_box">
                    <a id="black" style="display: none;" href="#"></a>
                    <a id="black" style="display: none;" href="#"></a>
                    <a id="black" style="display: none;" href="#"></a>
                </div>
                <input type="hidden" id="bannerIndex" value="0">
                <input type="hidden" id="find" value="0">
            </div>
        </div>
        <script>changeBanner();</script>
        
        <div class="contents-main">
        	<div class="contents-contrainer">
	            <div class="contents-titles">
	                <div id="showing" class="selectitem">현재상영작</div>
	                <div id="notshowing" class="noselectitem">개봉예정작</div>
				</div>
				<div class="contents-items-all" onclick="moveMovie()">전체보기 +</div>
				<div class="contents-items">
					<div class="contents-items-hidden">
						<div class="contents-items-showing" style="transform: translate3d(0px, 0px, 0px); transition-duration: 0ms;">
							<c:forEach items="${movieShowingList}" var="list" varStatus="status">
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
					                	<div class="contents-item-ranking">${status.count}</div>
				                	</div>
				                	<div class="contents-item-title">${list.title_ko}</div>
				                	<div class="contents-item-review">
					                	<img class="contents-item-review-img" src="resources/images/ic-star-small-on.png" alt="별모양">
					                	<div class="contents-item-review-member">일반</div>
					                	<div class="contents-item-review-score">${list.gen_avg_rate}</div>
				                	</div>
				                	<button class="contents-item-btn" onclick="makingReservation(${list.movie_id})">예매하기 →</button>
				                </div>
			                </c:forEach>
						</div>
						<div class="contents-items-notshowing">
							<c:forEach items="${movieNotShowingList}" var="list" varStatus="status">
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
					                	<div class="contents-item-ranking">${status.count}</div>
				                	</div>
				                	<div class="contents-item-title">${list.title_ko}</div>
				                	<div class="contents-item-review">
					                	<img class="contents-item-review-img" src="resources/images/ic-star-small-on.png" alt="별모양">
					                	<div class="contents-item-review-member">일반</div>
					                	<div class="contents-item-review-score">${list.gen_avg_rate}</div>
				                	</div>
				                	<button class="contents-item-btn" onclick="makingReservation(${list.movie_id})">예매하기 →</button>
				                </div>
			                </c:forEach>
						</div>
					</div>
					<img class="prev" src="resources/images/ico_prev.png" alt="이전방향화살표" onclick="moviePrev()">
					<img class="next" src="resources/images/ico_next_white.png" alt="다음방향화살표" onclick="movieNext()">
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

function moveMovie() {
	location.href = "movie";
}

function makingReservation(movieID) {
	location.href = "ticket?movie=" + movieID;
}

var value1 = 0;
var value2 = 0;
var prev1 = 0;
var prev2 = 0;
var next1 = 5;
var next2 = 5;
function moviePrev() {
	if (selectBool == 1 && prev1 != 0) {
		prev1 -= 1
		next1 += 1
		value1 += 210.8
		$(".contents-items-showing").css("transform", "translate3d(" + value1 + "px, 0px, 0px)");
	} else if (selectBool == 2 && prev2 != 0){
		prev2 -= 1
		next2 += 1
		value2 += 210.8
		$(".contents-items-notshowing").css("transform", "translate3d(" + value2 + "px, 0px, 0px)");
	}
}

function movieNext() {
	if (selectBool == 1 && next1 != 0) {
		prev1 += 1
		next1 -= 1
		value1 -= 210.8
		$(".contents-items-showing").css("transform", "translate3d(" + value1 + "px, 0px, 0px)");
	} else if (selectBool == 2 && next2 != 0){
		prev2 += 1
		next2 -= 1
		value2 -= 210.8
		$(".contents-items-notshowing").css("transform", "translate3d(" + value2 + "px, 0px, 0px)");
	}
}
</script>
</html>


