<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<fmt:parseDate value="${movieInfor.opening_date}" var="date"
	pattern="yyyy-MM-dd" scope="page" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="head.jsp"%>
	<link type="text/css" rel="stylesheet" href="resources/css/movie_detail.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
	<title>대체로 맑음</title>
</head>
<body>
	<div id="wrap">
		<%@ include file="header.jsp"%>
		<div class="summary" id="poster"
			style="background-image: url(${movieInfor.poster_img});"></div>
		<div class="summary-contents">
			<img class="summary-main-poster" src="${movieInfor.poster_img}"
				alt="영화 포스터" />
			<div class="summary-contents-infor">
				<div class="summary-contents-title">
					<c:if test="${movieInfor.g_rate_id == 1}">
						<c:set var="grate" value="전체관람가" />
						<img class="summary-contents-title-grate-img"
							src="resources/images/전체.png" alt="관람등급이미지">
					</c:if>
					<c:if test="${movieInfor.g_rate_id == 2}">
						<c:set var="grate" value="12세이상관람가" />
						<img class="summary-contents-title-grate-img"
							src="resources/images/12.png" alt="관람등급이미지">
					</c:if>
					<c:if test="${movieInfor.g_rate_id == 3}">
						<c:set var="grate" value="15세이상관람가" />
						<img class="summary-contents-title-grate-img"
							src="resources/images/15.png" alt="관람등급이미지">
					</c:if>
					<c:if test="${movieInfor.g_rate_id == 4}">
						<c:set var="grate" value="청소년관람불가" />
						<img class="summary-contents-title-grate-img"
							src="resources/images/청불.png" alt="관람등급이미지">
					</c:if>
					<div class="summary-contents-title-ko-en">
						<div class="summary-contents-title-ko">${movieInfor.title_ko}</div>
						<div class="summary-contents-title-en">${movieInfor.title_en}</div>
					</div>
				</div>
				<c:forEach items="${movieGenreList}" var="list" varStatus="status">
					<c:choose>
						<c:when test="${status.count == 1}">
							<c:set var="genre" value="${list}" />
						</c:when>
						<c:otherwise>
							<c:set var="genre" value="${genre}, ${list}" />
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<div class="summary-contents-etc">
					<c:out value="${grate}" />
					|
					<fmt:formatDate value="${date}" pattern="yyyy.MM.dd" />
					|
					<c:out value="${genre}" />
					| ${movieInfor.time}
				</div>
				<div class="summary-contents-review">
					<div class="summary-contents-review-gen-avg">
						<img class="summary-contents-review-star-img"
							src="resources/images/ic-star-small-on.png" alt="별모양" />
						<div class="summary-contents-review-score">${movieInfor.gen_avg_rate}/5.0</div>
					</div>
					<div class="summary-contents-review-headcount">${fn:length(reviewList)}명
						참여</div>
				</div>
			</div>
			<button class="summary-ticket-btn"
				onclick="makingReservation(${movieInfor.movie_id})">예매하기</button>
		</div>
		<div class="detail">
			<div class="detail-all">
				<div class="detail-menus">
					<div class="detail-menu menu-on">주요정보</div>
					<div class="detail-menu">배우/제작진</div>
					<div class="detail-menu">상영영화관</div>
					<div class="detail-menu">별점/감상평</div>
					<div class="detail-menu">예고편</div>
					<div class="detail-menu">스틸컷</div>
				</div>
				<hr>
				<div class="detail-contents contents-on">
					<div class="detail-contents-crew">
						<div class="detail-contents-title">배우</div>
						<div class="detail-contents-group">
							<div class="detail-contents-subtitle">배우</div>
							<c:if test="${fn:length(movieActorList) == 0}">
								<div class="nodata">등록된 배우 정보가 없습니다.</div>
							</c:if>
							<c:if test="${fn:length(movieActorList) != 0}">
								<c:forEach items="${movieActorList}" var="list" varStatus="status">
									<c:choose>
										<c:when test="${status.count == 1}">
											<c:set var="actorname" value="${list.actor_name_ko}" />
										</c:when>
										<c:otherwise>
											<c:set var="actorname" value="${actorname}, ${list.actor_name_ko}" />
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<div class="detail-contents-sub">
									<c:out value="${actorname}" />
								</div>
							</c:if>
						</div>
						<div class="detail-contents-group">
							<div class="detail-contents-subtitle">배급사</div>
							<div class="detail-contents-sub">${movieInfor.distributor}</div>
						</div>
					</div>
					<div class="detail-contents-story">
						<div class="detail-contents-title">줄거리</div>
						<div class="detail-contents-summary">${fn:replace(movieInfor.story, replaceChar, "<br/>")}</div>
					</div>
					<div class="detail-contents-analytices">
						<div class="analytices-box" style="margin-right: 20px;">
							<div class="detail-contents-title">연령별 예매율</div>
							<canvas id="myChart_age" style="width: 450px"></canvas>
						</div>
						<div class="analytices-box">
							<div class="detail-contents-title">성별 예매율</div>
							<canvas id="myChart_gender" style="width: 450px"></canvas>
						</div>
					</div>
				</div>

				<div class="detail-contents">
					<div class="detail-contents-title">감독/프로듀서</div>
					<div class="detail-contents-crews">
						<c:if test="${fn:length(movieDirectorList) == 0}">
							<div class="nodata">등록된 감독 및 프로듀서 정보가 없습니다.</div>
						</c:if>
						<c:if test="${fn:length(movieDirectorList) != 0}">
							<c:forEach items="${movieDirectorList}" var="list">
								<div class="detail-contents-crew-group">
									<img class="detail-contents-crew-img"
										src="${list.director_img}" alt="배우 이미지" />
									<div class="detail-contents-crew-infor">
										<div class="detail-contents-subtitle">${list.director_name_ko}</div>
										<div class="detail-contents-sub">${list.director_name_en}</div>
										<div class="detail-contents-sub">${list.role}</div>
									</div>
								</div>
							</c:forEach>
						</c:if>
					</div>
					<div class="detail-contents-title">배우</div>
					<div class="detail-contents-crews">
						<c:if test="${fn:length(movieActorList) == 0}">
							<div class="nodata">등록된 배우 정보가 없습니다.</div>
						</c:if>
						<c:if test="${fn:length(movieActorList) != 0}">
							<c:forEach items="${movieActorList}" var="list">
								<div class="detail-contents-crew-group">
									<img class="detail-contents-crew-img" src="${list.actor_img}"
										alt="배우 이미지" />
									<div class="detail-contents-crew-infor">
										<div class="detail-contents-subtitle">${list.actor_name_ko}</div>
										<div class="detail-contents-sub">${list.actor_name_en}</div>
										<div class="detail-contents-sub">배우</div>
									</div>
								</div>
							</c:forEach>
						</c:if>
					</div>
				</div>

				<div class="detail-contents">
					<div class="detail-contents-cinemas">
						<c:if test="${fn:length(cinemaShowingList) == 0}">
							<div class="nodata">상영영화관이 없습니다.</div>
						</c:if>
						<c:if test="${fn:length(cinemaShowingList) != 0}">
							<c:forEach items="${cinemaShowingList}" var="list">
								<div class="detail-contents-cinema-group"
									onclick="moveCinemaDetail('${list.cinema_id}')">
									<img class="detail-contents-cinema-img"
										src="${list.cinema_main_img}" alt="영화관대표이미지" />
									<div class="detail-contents-subtitle">${list.cinema_name}</div>
								</div>
							</c:forEach>
						</c:if>
					</div>
				</div>

				<div class="detail-contents">
					<div class="detail-contents-title">별점분포도</div>
					<c:set var="index" value="5" />
					<c:forEach items="${score_count}" var="array">
						<div style="display: flex;">
							<img class="review-star-img"
								src="resources/images/ic-star-small-on.png" alt="별모양" />
							<div class="review-font">
								<c:out value="${index}" />
							</div>
							<c:choose>
								<c:when test="${array != 0}">
									<fmt:parseNumber var="per" integerOnly="true"
										value="${array / fn:length(reviewList) * 100}" />
									<progress value="${per}" max="100"> </progress>
									<div class="review-font score-per">${per}%</div>
								</c:when>
								<c:otherwise>
									<progress value="0" max="100"> </progress>
									<div class="review-font score-per">0%</div>
								</c:otherwise>
							</c:choose>
							<div class="review-font grey score-per">${array}명</div>
							<c:set var="index" value="${index - 1}" />
						</div>
					</c:forEach>

					<div class="detail-contents-title">
						감상평 <span class="review-count">총 ${fn:length(reviewList)}개</span>
					</div>
					<c:if test="${fn:length(reviewList) == 0}">
						<div class="nodata">등록된 감상평이 없습니다.</div>
					</c:if>
					<c:if test="${fn:length(reviewList) != 0}">
						<c:forEach items="${reviewList}" var="list">
							<div class="detail-contents-review-group">
								<div class="detail-contents-review-id">${fn:substring(list.member_id, 0, 4)}******</div>
								<div class="detail-contents-review">
									<div class="detail-contents-review-background">
										<div class="detail-contents-score-img">
											<img class="review-star-img" src="resources/images/ic-star-small-on.png" alt="별모양" />
											<div class="detail-contents-review-score">${list.review_rate}</div>
										</div>
										<div class="detail-contents-review-write">${list.review_text}</div>
										<div class="detail-contents-review-sympathy">
											<img class="review-like-img" src="resources/images/btn-thumb-up-nor.svg" alt="추천" />
											<div class="detail-contents-review-like">공감 <span class="like-count">${list.recommend_count}</span>
											</div>
										</div>
									</div>
									<div class="detail-contents-review-date">${list.write_time}</div>
									<input name="review_id" class="detail-contents-review-id" type="hidden" value="${list.review_id}" />
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>

				<div class="detail-contents">
					<div class="detail-contents-trailer">
						<c:if test="${fn:length(movieTrailerList) == 0}">
							<div class="nodata">등록된 예고편이 없습니다.</div>
						</c:if>
						<c:if test="${fn:length(movieTrailerList) != 0}">
							<c:forEach items="${movieTrailerList}" var="list">
								<div class="detail-contents-trailer-group">
									<video controls width="240">
										<source src="${list.movie_video}" type="video/mp4">
									</video>
									<div class="detail-contents-subtitle">${list.movie_video_infor}</div>
									<div class="detail-contents-sub">${list.opening_date}</div>
								</div>
							</c:forEach>
						</c:if>
					</div>
				</div>

				<div class="detail-contents">
					<c:if test="${fn:length(movieImageList) == 0}">
						<div class="nodata">등록된 스틸컷 이미지가 없습니다.</div>
					</c:if>
					<c:if test="${fn:length(movieImageList) != 0}">
						<div class="detail-contents-stillcut-group">
							<c:forEach items="${movieImageList}" var="list">
								<img class="detail-contents-stillcut-image" src="${list}"
									alt="스틸컬이미지" />
							</c:forEach>
						</div>
					</c:if>
				</div>

			</div>
		</div>
		<%@ include file="footer.jsp"%>
	</div>
</body>
<script type="text/javascript">
function makingReservation(movieID) {
	location.href = "ticket?movie=" + movieID;
}

$(document).on("click", ".detail-menu", function(){ 
    $('.detail-menu').each(function(){
  		if ($(this).hasClass('menu-on') == 1) { $(this).removeClass('menu-on'); }
   	});
  	$(this).addClass('menu-on');
  	
    $('.detail-contents').each(function(){
  		if ($(this).hasClass('contents-on') == 1) { $(this).removeClass('contents-on'); }
   	});
    var num = $(".detail-menu").index(this); 
    $(".detail-contents").eq(num).addClass('contents-on'); 
});

function moveCinemaDetail(cinema_id) {
	location.href = "cinema_detail?no=" + cinema_id;
}

// 주요 정보 차트
var ageValues = new Array();
var genderValues = new Array();

<c:forEach items="${age_count}" var="array">
	ageValues.push(${array})
</c:forEach>
	
<c:forEach items="${gender_count}" var="array">
	genderValues.push(${array})
</c:forEach>

var ctx_age = document.getElementById('myChart_age').getContext('2d');
var myChart_age = new Chart(ctx_age, {
    type: 'bar',
    data: {
        labels: ['10대', '20대', '30대', '40대', '50대'],
        datasets: [{
            data: ageValues,
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
    	legend: {display: false},
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});

var ctx_gender = document.getElementById('myChart_gender').getContext('2d');
var myChart_gender = new Chart(ctx_gender, {
    type: 'doughnut',
    data: {
        labels: ['남', '여'],
        datasets: [{
            data: genderValues,
            backgroundColor: [
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 99, 132, 0.2)'
            ],
            borderColor: [
                'rgba(54, 162, 235, 1)',
                'rgba(255, 99, 132, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});

// 리뷰 공감 버튼
$(document).on("click", ".detail-contents-review-sympathy", function(){ 
 	var num = $(".detail-contents-review-sympathy").index(this)
	var review_id = $("input[name=review_id]").eq(num).val()
	var count = parseInt($(".like-count").eq(num).text()) + 1
	console.log(review_id)
    $.ajax ({
        method: 'GET',
        url: 'like_count_update',
        data: {"review_id": review_id, "count": count},
        success: function(data) {
			$(".like-count").eq(num).text(count)
        }
    })
})

</script>
</html>