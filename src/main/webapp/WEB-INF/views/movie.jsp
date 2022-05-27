<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file = "head.jsp" %>
    <link type="text/css" rel="stylesheet" href="resources/css/movie.css">
    <title>대체로 맑음</title>
</head>
<body>
    <div id="wrap">
        <%@ include file = "header.jsp" %>
        <div class="contents-main">
        	<div class="contents-contrainer">
        		<div class="contents-header">
		            <div class="contents-titles">
		                <div id="showing" class="selectitem">현재상영작</div>
		                <div id="notshowing" class="noselectitem">개봉예정작</div>
					</div>
					<div class="search-movie-box">
						<input type="text" class="movie-search-item" placeholder="영화검색"/>
					</div>
				</div>
				<hr color="grey">
				<div class="contents-genre">
					<button class="contents-genre-item g-on">전체</button>
					<c:forEach items="${genreList}" var="list">
						<button class="contents-genre-item">${list.genre_ko}</button>
					</c:forEach>
				</div>
				<div class="contents-items">
					<div class="contents-items-showing">
						<c:forEach items="${movieShowingList}" var="list">
			                <div class="contents-item" onclick="moveMovieDetail(${list.movie_id})">
			                	<div class="contents-item-infor">
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
			                	<button class="contents-item-btn">예매하기 →</button>
			                </div>
		                </c:forEach>
					</div>
					<div class="contents-items-notshowing">
						<c:forEach items="${movieNotShowingList}" var="list">
			                <div class="contents-item">
			                	<div class="contents-item-infor">
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
			                	<button class="contents-item-btn">예매하기 →</button>
			                </div>
		                </c:forEach>
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

$(document).on("propertychange change keyup paste input", ".movie-search-item", function(){ 
	$('.contents-genre-item').each(function(){
		if ($(this).hasClass('g-on') == 1) $(this).removeClass('g-on');
	});
    $('.contents-genre-item').first().addClass('g-on');
    var search = $.trim($(".movie-search-item").val());
	$.ajax ({
        method: 'GET',
        url: 'movie_title_search',
        data: {"search": search},
        contentType: "application/json; charset:UTF-8", 
        success: function(resultData) { 
        	var result = JSON.parse(resultData);
        	var now = JSON.parse(result.now);
        	var plan = JSON.parse(result.plan);
        	drawingShowingMovie(now);
        	drawingNotShowingMovie(plan);
       	} 
    })
});

$(document).on("click", ".contents-genre-item", function(){
    var search = $(this).text();
    $(".movie-search-item").val("");
    $('.contents-genre-item').each(function(){
  		if ($(this).hasClass('g-on') == 1) { $(this).removeClass('g-on'); }
   	});
  	$(this).addClass('g-on');
    $.ajax ({
        method: 'GET',
        url: 'movie_genre_search',
        data: {"search": search},
        contentType: "application/json; charset:UTF-8", 
        success: function(resultData) { 
        	var result = JSON.parse(resultData);
        	var now = JSON.parse(result.now);
        	var plan = JSON.parse(result.plan);
        	drawingShowingMovie(now);
        	drawingNotShowingMovie(plan);
        }
    })
});  

function drawingShowingMovie(resultData) {
   	$('.contents-items-showing').html('');
   	$('.contents-items-showing').append(drawingMovieList(resultData)); 
}

function drawingNotShowingMovie(resultData) {
   	$('.contents-items-notshowing').html('');
   	$('.contents-items-notshowing').append(drawingMovieList(resultData)); 
}

function drawingMovieList(resultData) {
	var addTag = "";
	
	$.each(resultData, function(index, data){
		var g_rate_image = "";
		if (data['g_rate_id'] == 1) g_rate_image = "resources/images/전체.png";
		if (data['g_rate_id'] == 2) g_rate_image = "resources/images/12.png";
		if (data['g_rate_id'] == 3) g_rate_image = "resources/images/15.png";
		if (data['g_rate_id'] == 4) g_rate_image = "resources/images/청불.png";
		
		addTag += "<div class='contents-item' onclick='moveMovieDetail(" + data['movie_id'] + ")'>"
   			+ "<div class='contents-item-infor'>"
       		+ "<img class='contents-item-grate' src='" + g_rate_image + "' alt='관람등급이미지'/>"
        	+ "<img class='contents-item-poster' src='" + data['poster_img'] + "' alt='영화 포스터'/></div>"
        	+ "<div class='contents-item-title'>" + data['title_ko'] + "</div>"
        	+ "<div class='contents-item-review'>"
        	+ "<img class='contents-item-review-img' src='resources/images/ic-star-small-on.png' alt='별모양'>"
        	+ "<div class='contents-item-review-member'>일반</div>"
        	+ "<div class='contents-item-review-score'>" + data['gen_avg_rate'] + "</div>"
/*         	+ "<div class='contents-item-review-member'>평론가</div>"
        	+ "<div class='contents-item-review-score'>" + data['critic_avg_rate'] + "</div>" */
        	+ "</div>"
        	+ "<button class='contents-item-btn'>예매하기 →</button></div>";
    })
    
    return addTag;
}

function moveMovieDetail(movieID) {
	location.href = "movie_detail?no=" + movieID;
}
</script>
</html>