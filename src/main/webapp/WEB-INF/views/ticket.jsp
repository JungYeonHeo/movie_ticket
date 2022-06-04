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
							<li class="active" id="AreaCd_" style="cursor: pointer;" onclick="ticket_search_cinema('address', '', 0)">전체</li>
							<li class="" id="AreaCd_KR-11" style="cursor: pointer;" onclick="ticket_search_cinema('address', '서울', 1)">서울</li>
							<li class="" id="AreaCd_KR-41" style="cursor: pointer;" onclick="ticket_search_cinema('address', '경기', 2)">경기</li>
							<li class="" id="AreaCd_KR-28" style="cursor: pointer;" onclick="ticket_search_cinema('address', '인천', 3)">인천</li>
							<li class="" id="AreaCd_KR-44" style="cursor: pointer;" onclick="ticket_search_cinema('address', '충남', 4)">충남</li>
							<li class="" id="AreaCd_KR-27" style="cursor: pointer;" onclick="ticket_search_cinema('address', '대구', 5)">대구</li>
							<li class="" id="AreaCd_KR-47" style="cursor: pointer;" onclick="ticket_search_cinema('address', '경북', 6)">경북</li>
							<li class="" id="AreaCd_KR-48" style="cursor: pointer;" onclick="ticket_search_cinema('address', '경상남도', 7)">경남</li>
							<li class="" id="AreaCd_KR-45" style="cursor: pointer;" onclick="ticket_search_cinema('address', '전북', 8)">전북</li>
							<li class="" id="AreaCd_KR-29" style="cursor: pointer;" onclick="ticket_search_cinema('address', '광주', 9)">광주</li>
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
					<h2>상영시간</h2>
					<ul class="showing-time-slot-list" style="cursor: pointer;">
						<li>
							<b>상영정보를 선택해주세요</b>
						</li>
					</ul>
					<button class="next-button" disabled="disabled">좌석, 수량 선택</button>
				</div>
			</div>
			<div class="container2">
				<div class="num-box">
					<h2>수량</h2>
					<div class="count">
						<p>청소년</p> 
						<input type="number" class="youth" value="0" min="0" max="10" /> 
						<p>성인</p> 
						<input type="number" class="adult" value="0" min="0" max="10"/>
					</div>
					<p class="num">총 0명</p>
					<button class="price-button" disabled="disabled">금액 : 0원 <p>결제하기 →</p></button>
				</div>
				<div class="seat-box">
					<h2>좌석</h2>
					<div class="seat-group">
						<div class="screen">스크린</div>
						<div class="seats"></div>
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
var people = 0
var seat = ""
var price = 0;
var title_ko = ""
var cinema_name = ""
var showing_date = ""
var month = ""
var row = 0
var column = 0
var select_seat_num = 0
var seat_nums = new Array()
var row_name = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']
var cinema_seat_id = 0
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
function ticket_search_cinema(target, search, num) {
	// 영화관 지역 효과 
    $(".local_list").children("li").eq(num).addClass("active").siblings().removeClass("active")
    // 영화관 효과 지우기
	$(".cine_list").children("li").removeClass("selecton")
	// 상영시간 효과 지우기 
	$(".showing-time-slot-list").children("div").removeClass("selecton")
	$('.showing-time-slot-list').html('')
	$('.showing-time-slot-list').append("<li><b>상영정보를 선택해주세요</b></li>")
	// 좌석, 수량 선택 버튼 비활성화
	$(".next-button").prop("disabled", true)
	$(".next-button").css("background", "#ccc")
	
	cinema_name = ""
	cinema_showing_id = 0
	  
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
			       		add_showing_time_list = "<div class='time-slot' onclick=\"time_slot_select(" + index + ", " + data['cinema_showing_id'] + ", " + data['cinema_seat_id'] + ");\"><b>" + data['showing_time'] + "</b></div>"
		       		}) 
			       	$('.showing-time-slot-list').append(add_showing_time_list)
		       	}
		   	} 
		})
	} 
});

// 상영시간대 선택
function time_slot_select(index, showing_id, seat_id) {
	cinema_showing_id = showing_id 
	cinema_seat_id = seat_id
	$(".time-slot").eq(index).addClass("selecton").siblings().removeClass("selecton")
	console.log($(".time-slot").eq(index).text())	
	console.log("상영 ID: " + cinema_showing_id)
}

// 좌석, 수량 선택 버튼 활성화 (상영시간을 항상 가장 마지막에 누르게 되기 때문에 time-slot을 기준으로 함)
$(document).on("click", ".time-slot", function() {
	 if (title_ko != "" && cinema_name != ""  && showing_date != "" && cinema_showing_id != 0) {
		$(".next-button").prop("disabled", false)
		$(".next-button").css("background", "#f16a1a")
	 } 
});

// "좌석, 수량 선택" 버튼 
$(document).on("click", ".next-button", function() {
	$(".container").css("display", "none")
	$(".container2").css("display", "flex")
	
	// 좌석 정보 가져오기 
	$.ajax ({
	    method: 'GET',
	    url: 'seat_infor_action',
	    data: {"cinema_seat_id": cinema_seat_id},
	    contentType: "application/json; charset:UTF-8", 
	    success: function(resultData) { 
			row = resultData['seat_row']
			column = resultData['seat_column']
			var addTag = ""
			addTag += "<button class='column_name' style='color: #fff;'>0</button>"
			for (var i = 1; i < column + 1; i++) {
				addTag += "<button class='column_name'>" + i + "</button>"
			}
			addTag += "<br>"	
			for (var i = 0; i < row; i++) {
				addTag += "<button class='column_name'>" + row_name[i] + "</button>"
				for (var j = 0; j < column; j++) {
					addTag += "<button class='rect'></button>"
				}
				addTag += "<br>"
			} 
			$(".seats").append(addTag)
	   	} 
	})
});

// 청소년 수 입력에 따른 가격 변동
$(document).on("propertychange change keyup paste input", ".youth", function() { 
	youth = $(".youth").val()
	adult = $(".adult").val()
	price = youth * 7000 + adult * 10000
	people = Number(youth) + Number(adult)
	$(".num").text("총 " + people + "명")
	$(".price-button").text("금액: " + price + "원")
	$(".price-button").append("<p>결제하기 →</p>")
	
	// 좌석 선택 후 수량 변경
	price_button_active()
});

// 어른 수 입력에 따른 가격 변동
$(document).on("propertychange change keyup paste input", ".adult", function() { 
	youth = $(".youth").val()
	adult = $(".adult").val()
	price = $(".youth").val() * 7000 + $(".adult").val() * 10000
	people = Number(youth) + Number(adult)
	$(".num").text("총 " + people + "명")
	$(".price-button").text("금액: " + price + "원")
	$(".price-button").append("<p>결제하기 →</p>")	
	
	// 좌석 선택 후 수량 변경
	price_button_active()
});

// 좌석 선택
$(document).on("click", ".rect", function() {
	
	if (people == 0 && select_seat_num == 0) {
		return alert("수량을 먼저 선택해주세요.")
	}
	
	var num = $(".rect").index(this)
	if (select_seat_num < people) {
		if ($(this).hasClass("active")) {
			$(this).removeClass("active")
			select_seat_num -= 1
			for (var i=0; i < seat_nums.length; i++) {
				if (seat_nums[i] == num) {
					seat_nums.splice(i, 1)
					i--
				}
			}
		} else {
			$(this).addClass("active")
			select_seat_num += 1
			seat_nums.push(num)
		}
	} else {
		if ($(this).hasClass("active")) {
			$(this).removeClass("active")
			select_seat_num -= 1
			for (var i=0; i < seat_nums.length; i++) {
				if (seat_nums[i] == num) {
					seat_nums.splice(i, 1)
					i--
				}
			}
		}
	}
	price_button_active()
});

function price_button_active() {
	if (select_seat_num == people && people > 0) {
		$(".price-button").prop("disabled", false)
		$(".price-button").css("background", "#f16a1a")	
	} else {
		$(".price-button").prop("disabled", true)
		$(".price-button").css("background", "#ccc")	
	}
}

// 결제하기 버튼: DB에 예매 정보 저장
$(".price-button").click(function() {
	seat = ""
	for (var i = 0; i < seat_nums.length; i++) {
		seat += row_name[parseInt(seat_nums[i] / column)] + String(seat_nums[i] % column + 1) + ", "
	}
	seat = seat.slice(0, -2)
	console.log("선택한 좌석정보: " + seat)
	confirm(seat + "좌석을 선택하셨습니다. 결제하시겠습니까?")
	
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