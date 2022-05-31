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
					<div class="local_wrapper" style="position: relative;">
						<ul class="local_list">
							<li class="active" id="AreaCd_" style="cursor: pointer;" onclick="searchCinema('address', '', 0)">전체</li>
							<li class="" id="AreaCd_KR-11" style="cursor: pointer;" onclick="searchCinema('address', '서울', 1)">서울</li>
							<li class="" id="AreaCd_KR-41" style="cursor: pointer;" onclick="searchCinema('address', '경기', 2)">경기</li>
							<li class="" id="AreaCd_KR-28" style="cursor: pointer;" onclick="searchCinema('address', '인천', 3)">인천</li>
							<li class="" id="AreaCd_KR-44" style="cursor: pointer;" onclick="searchCinema('address', '충남', 4)">충남</li>
							<li class="" id="AreaCd_KR-27" style="cursor: pointer;" onclick="searchCinema('address', '대구', 5)">대구</li>
							<li class="" id="AreaCd_KR-47" style="cursor: pointer;" onclick="searchCinema('address', '경북', 6)">경북</li>
							<li class="" id="AreaCd_KR-48" style="cursor: pointer;" onclick="searchCinema('address', '경상남도', 7)">경남</li>
							<li class="" id="AreaCd_KR-45" style="cursor: pointer;" onclick="searchCinema('address', '전북', 8)">전북</li>
							<li class="" id="AreaCd_KR-29" style="cursor: pointer;" onclick="searchCinema('address', '광주', 9)">광주</li>
						</ul>
					</div>
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
								<ul style="cursor: pointer;">
 									<c:forEach begin="1" end="7" step="1" > 
										<li class="day">
											<b><c:out value="${day}"/></b>
										</li>
										<c:set var="day" value="${day + 1}"/>
 									</c:forEach> 
 								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="time_box">
					<h2>상영시간/인원/좌석</h2>
					<ul class="showing-time-slot-list" style="cursor: pointer;">
						<li>
							<b>상영정보를 선택해주세요</b>
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
var youth = 0
var adult = 0
var seat = ""
var price = 0;
var title_ko = ""
var cinema_name = ""
var showing_date = ""
var month = ""
var cinema_showing_id = 0
var cinema_showing_id_bool = false

// 영화 선택 
$(document).on("click", ".movie", function() {
	$(this).parent().children("li").removeClass("selecton") 
    $(this).addClass("selecton")
	title_ko = $(this).text().trim().slice(4).trim()
    console.log(title_ko)
});

// 영화관 지역 선택
function searchCinema(target, search, num) {
	// 영화관 지역 효과 
    $(".local_list").children("li").eq(num).addClass("active").siblings().removeClass("active")
    // 영화관 효과 지우기
	$(".cine_list").children("li").removeClass("selecton")
    
    $.ajax ({
        method: 'GET',
        url: 'cinema_search_menu',
        data: {"target": target, "search": search},
        success: function(dataList) {
        	$('.cine_list').html('')
        	var addTag = ''
        	$.each(dataList, function(index, data){
        		addTag += "<li class=''>" + data['cinema_name'] +"</li>"
            })
            $('.cine_list').append(addTag)
        }
    })
}

// 영화관 선택
$(document).on("click", ".cine_list li", function() {
	$(this).parent().children("li").removeClass("selecton")
    $(this).addClass("selecton")
    cinema_name = $(this).text()
    cinema_name = cinema_name.trim()
    console.log(cinema_name)
});

// 날짜 선택
$(document).on("click", ".day", function() {
	$(this).parent().children("li").removeClass("selecton")  
    $(this).addClass("selecton")
	var day = $(this).text()
	if (${month} < 10) {
		month = "0" + ${month}
	} else {
		month = ${month}
	}
	showing_date = ${year} + "-" + month + "-" + day.trim()
	console.log(showing_date)
});

// 영화, 영화관, 날짜를 모두 선택하면 선택한 조건에 맞는 상영시간대를 가져옴 
$(document).on("click", "li", function() {
	if (title_ko != "" && cinema_name != ""  && showing_date != "") {
		$.ajax ({
		    method: 'GET',
		    url: 'cinema_showing_action',
		    data: {"title_ko": title_ko, "cinema_name": cinema_name, "showing_date": showing_date},
		    contentType: "application/json; charset:UTF-8", 
		    success: function(resultData) { 
		       	$('.showing-time-slot-list').html('')
		       	if (resultData.length == 0) {
		       		cinema_showing_id_bool = false
		       		no_showing_time = "<li><b>상영정보가 없습니다</b></li>"
			       	$('.showing-time-slot-list').append(no_showing_time)
		       	} else {
		       		cinema_showing_id_bool = true
		       		var add_showing_time_list = ''
		       		$.each(resultData, function(index, data) {
			       		add_showing_time_list = "<div class='time-slot' onclick=\"time_slot_select(" + index + ", " + data['cinema_showing_id'] + ");\"><b>" + data['showing_time'] + "</b></div>"
		       		}) 
			       	$('.showing-time-slot-list').append(add_showing_time_list)
		       	}
		   	} 
		})
	} 
});

// 상영시간대 선택
function time_slot_select(index, showing_id) {
	cinema_showing_id = showing_id 
	$(".time-slot").eq(index).addClass("selecton").siblings().removeClass("selecton")
	console.log($(".time-slot").eq(index).text())	
	console.log("상영 ID: " + cinema_showing_id)
}
	
// 청소년 수 입력에 따른 가격 변동
$(document).on("propertychange change keyup paste input", ".youth", function() { 
	youth = $(".youth").val()
	adult = $(".adult").val()
	price = youth * 7000 + adult * 10000
	$(".price").text("금액: " + price + "원")
});

// 어른 수 입력에 따른 가격 변동
$(document).on("propertychange change keyup paste input", ".adult", function() { 
	youth = $(".youth").val()
	adult = $(".adult").val()
	price = $(".youth").val() * 7000 + $(".adult").val() * 10000
	$(".price").text("금액: " + price + "원")
});

// 결제하기버튼: DB에 예매 정보 저장
$(".pay").click(function() {
	seat = $(".inputseat").val().trim()
	$.ajax ({
	    method: 'GET',
	    url: 'pay_action',
	    data: {"cinema_showing_id": cinema_showing_id, "youth": youth, "adult": adult, "seat": seat, "price": price},
	    contentType: "application/json; charset:UTF-8", 
	    success: function(resultData) { 
			alert("결제되었습니다.")
			location.href = "mypage"
	   	} 
	})	
});
</script>
</html>