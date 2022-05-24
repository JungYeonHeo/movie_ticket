<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="head.jsp"%>
	<meta charset="UTF-8">
	<link type="text/css" rel="stylesheet" href="resources/css/ticket.css">
	<title>대체로 맑음 - 예매</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="main">
		<div class="wrapper">
			<div class="top">
				<p class="tit">빠른예매</p>
			</div>
			<div class="container">
				<div class="movie_box">
					<h2>영화</h2>
					<ul class="movie_list">
						<c:forEach var="dto" items="${ticketMovieList}">
							<li class="movie">
								<span class="view_age a${dto.g_rate_id}">
									<c:if test="${dto.g_rate_id eq 1}">전체</c:if> 
									<c:if test="${dto.g_rate_id eq 2}">12</c:if>
									<c:if test="${dto.g_rate_id eq 3}">15</c:if>
									<c:if test="${dto.g_rate_id eq 4}">청불</c:if>
								</span> 
								${dto.title_ko}
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="cinema_box">
					<h2>영화관</h2>
<!-- 					<div class="local_wrapper" style="position: relative;"> -->
<!-- 						<ul class="local_list"> -->
<!-- 							<li class="active" id="AreaCd_" style="cursor: pointer;">전체</li> -->
<!-- 							<li class="" id="AreaCd_KR-11" style="cursor: pointer;">서울</li> -->
<!-- 							<li class="" id="AreaCd_KR-41" style="cursor: pointer;">경기</li> -->
<!-- 							<li class="" id="AreaCd_KR-28" style="cursor: pointer;">인천</li> -->
<!-- 							<li class="" id="AreaCd_KR-44" style="cursor: pointer;">충남</li> -->
<!-- 							<li class="" id="AreaCd_KR-27" style="cursor: pointer;">대구</li> -->
<!-- 							<li class="" id="AreaCd_KR-47" style="cursor: pointer;">경북</li> -->
<!-- 							<li class="" id="AreaCd_KR-48" style="cursor: pointer;">경남</li> -->
<!-- 							<li class="" id="AreaCd_KR-45" style="cursor: pointer;">전북</li> -->
<!-- 							<li class="" id="AreaCd_KR-29" style="cursor: pointer;">광주</li> -->
<!-- 						</ul> -->
<!-- 					</div> -->
					<div class="local_wrapper_2" style="position: relative;">
						<ul class="cine_list">
							<c:forEach var="dto" items="${ticketCinemaList}">
								<li class="">${dto.cinema_name}</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="date_box">
					<h2>날짜</h2>
					<div class="scroll-wrapper date_scroll_box scrollbar-macosx"
						style="position: relative;">
						<div class="date_scroll_box scrollbar-macosx scroll-content"
							style="height: 550px; margin-bottom: 0px; margin-right: 0px; max-height: none;">
							<div class="date_list">
								<span>
									<h3>
										<strong>${month}</strong>
										${year} 
									</h3>
								</span>
								<c:set var="index" value="${day}"/>	
 								<c:forEach begin="1" end="7" step="1" > 
									<ul style="cursor: pointer;">
										<li class="day">
											<b><c:out value="${day}"/></b>
										</li>
									</ul>
									<c:set var="day" value="${day + 1}"/>
 								</c:forEach> 
							</div>
						</div>
					</div>
				</div>
				<div class="time_box">
					<h2>상영시간/인원/좌석</h2>
					<ul id="" style="cursor: pointer;">
						<li>
							<b class="text">상영정보를 선택해주세요</b>
						</li>
					</ul>
					<div class="addInfor">
						<div class="count">
							청소년 <input type="number" class="youth" value="0"/> 
							성인 <input type="number" class="adult" value="0"/>
						</div>
						<div class="seat"> A-F, 1-10을 조합해서 선택 <br>
						좌석: <input class="inputseat" type="text"></div>
						<div class="price">금액 : 0원</div>
						<button class="pay">결제하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>

<script type="text/javascript">
var cinema_showing_id = 0;
var youth = 0;
var adult = 0;
var seat = "";
var price = 0;
var title_ko = ""
var cinema_name = ""
var showing_date = ""
var month = ""
var cinema_showing_id = 0;

$(document).on("click", ".movie", function(){
	$(this).parent().children("li").removeClass("selecton");  
    $(this).addClass("selecton");
	title_ko = $(this).text().trim().slice(4).trim();
    console.log(title_ko)
});

$(document).on("click", ".cine_list li", function(){
	$(this).parent().children("li").removeClass("selecton");  
    $(this).addClass("selecton");
    cinema_name = $(this).text()
    cinema_name = cinema_name.trim()
    console.log(cinema_name)
});

$(document).on("click", ".day", function(){
	$(this).parent().children("li").removeClass("selecton");  
    $(this).addClass("selecton");
	var day = $(this).text()
	if (${month} < 10) {
		month = "0" + ${month}
	} else {
		month = ${month}
	}
	showing_date = ${year} + "-" + month + "-" + day.trim();
	console.log(showing_date)
});

$(document).on("click", "li", function(){
	if (title_ko != "" && cinema_name != ""  && showing_date != "") {
		$.ajax ({
		    method: 'GET',
		    url: 'cinema_showing_action',
		    data: {"title_ko": title_ko, "cinema_name": cinema_name, "showing_date": showing_date},
		    contentType: "application/json; charset:UTF-8", 
		    success: function(resultData) { 
		       	$('.text').html('')
				var add = resultData['showing_time']
		       	cinema_showing_id = resultData['cinema_showing_id']
		       	if (resultData['showing_time'] == null) {
			       	$('.text').append('상영정보가 없습니다'); 
		       	} else {
			       	$('.text').append(add); 
		       	}
		   	} 
		})
	} 

});

$(document).on("propertychange change keyup paste input", ".youth", function(){ 
	youth = $(".youth").val()
	adult = $(".adult").val()
	price = youth * 7000 + adult * 10000
	$(".price").text("금액: " + price + "원")
});

$(document).on("propertychange change keyup paste input", ".adult", function(){ 
	youth = $(".youth").val()
	adult = $(".adult").val()
	price = $(".youth").val() * 7000 + $(".adult").val() * 10000
	$(".price").text("금액: " + price + "원")
});

$(".pay").click(function () {
	seat = $(".inputseat").val().trim()
	$.ajax ({
	    method: 'GET',
	    url: 'pay_action',
	    data: {"cinema_showing_id": cinema_showing_id, "youth": youth, "adult": adult, "seat": seat, "price": price},
	    contentType: "application/json; charset:UTF-8", 
	    success: function(resultData) { 
			alert("결제되었습니다.");
			location.href = "mypage";
	   	} 
	})
	
});
</script>

</html>