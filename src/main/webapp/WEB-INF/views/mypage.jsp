<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%@ include file="head.jsp"%>
	<link type="text/css" rel="stylesheet" href="resources/css/mypage.css">
	<title>대체로 맑음 - 마이페이지</title>
</head>
<body>
    <div id="wrap">
		<%@ include file="header.jsp"%>
		<div class="container">
			<div class="align">
				<!-- 왼쪽 메뉴 -->
				<div class="mypage-left-menu fL">
					<div class="mypage-sub-menu">
						<div class="menu ticket menu-active">예매 목록</div>
						<div class="menu review">리뷰 목록</div>
						<div class="menu qa">1:1 문의</div>
						<div class="menu user">회원정보 수정</div>
					</div>
				</div>	
				<!-- 예매 목록 -->
				<div class="content ticket-menu content-active">
					<div class="content-list-text">예매 목록</div>
					<c:if test="${fn:length(mypageTicketList) == 0}">
						<div class="content-no-item-text">예매목록이 없습니다.</div>
					</c:if>
					<c:if test="${fn:length(mypageTicketList) != 0}">
						<c:forEach items="${mypageTicketList}" var="list">
							<div class="ticket-item-group">
								<div class="ticket-item-header">
									<div class="ticket-date">${list.ticket_date}</div>
									<c:if test="${list.state != '취소'}">
										<button class="review-write-button" onclick="moveReviewWrite(${list.cinema_showing_id}, '${list.showing_date} ${list.showing_time}')">리뷰쓰기</button>
									</c:if>
								</div>
								<div class="line"></div>
								<div class="ticket-item">
									<img class="ticket-img" src="${list.poster_img}" alt="영화 포스터" />
									<div class="ticket-item-content">
										<div class="ticket-item-content-text">제목: ${list.title_ko}</div>
										<div class="ticket-item-content-text">영화관: ${list.cinema_name}</div>
										<div class="ticket-item-content-text">상영관: ${list.theater}</div>
										<div class="ticket-item-content-text">날짜 및 시간: ${list.showing_date} ${list.showing_time}</div>
										<div class="ticket-item-content-text">자석: ${list.seat}</div>
										<div class="ticket-item-content-text">일반: ${list.adult_count}명, 청소년: ${list.youth_count}명</div>
										<div class="ticket-item-content-text">총 금액: ${list.total_price}원</div>
										<div class="ticket-item-content-text">결제정보: ${list.payment}</div>
										<c:if test="${list.state == '취소'}">
											<div class="ticket-item-content-text state">상태: <span class="state-cancel">${list.state}</span></div>
										</c:if>
										<c:if test="${list.state != '취소'}">
											<div class="ticket-item-content-text state">상태: ${list.state}</div>
										</c:if>
									</div>
								</div>
								<div class="ticket-item-footer">
									<div class="tickets-footer-buttons">
										<c:if test="${list.state != '취소'}">
											<button class="ticket-QR-button">QR코드</button>
											<button class="ticket-cancel-button" onclick="ticketCancel(${list.ticket_id}, '${list.showing_date} ${list.showing_time}')">취소</button>
										</c:if>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
				<!-- 리뷰 목록 -->
				<div class="content review-menu">
					<div class="content-list-text">리뷰 목록</div>
 					<c:if test="${fn:length(mypageReviewList) == 0}">
						<div class="content-no-item-text">작성한 리뷰가 없습니다.</div>
					</c:if> 
					<c:if test="${fn:length(mypageReviewList) != 0}">
						<c:forEach items="${mypageReviewList}" var="list">
							<div class="review-item-group">
		                		<div class="review-item-title">${list.title_ko} <span class="review-item-title-en">${list.title_en}</span></div>
								<div class="review-item">
				                	<div class="review-item-poster">
				                		<c:if test="${list.g_rate_id == 1}">
						                	<img class="review-item-grate" src="resources/images/전체.png" alt="관람등급이미지">
				                		</c:if>
				                		<c:if test="${list.g_rate_id == 2}">
						                	<img class="review-item-grate" src="resources/images/12.png" alt="관람등급이미지">
				                		</c:if>
				                		<c:if test="${list.g_rate_id == 3}">
						                	<img class="review-item-grate" src="resources/images/15.png" alt="관람등급이미지">
				                		</c:if>
				                		<c:if test="${list.g_rate_id == 4}">
						                	<img class="review-item-grate" src="resources/images/청불.png" alt="관람등급이미지">
				                		</c:if>
					                	<img class="review-item-poster-img" src="${list.poster_img}" alt="영화 포스터">
				                	</div>
									<div class="review-item-content">
										<div class="review-item-buttons">
					                		<button class="review-item-update-button" onclick="reviewUpdate('${list.review_id}')">수정</button> | 
					                		<button class="review-item-delete-button" onclick="reviewDelete('${list.review_id}')">삭제</button>
					                	</div>
					                	<div class="review-item-background-group">
											<div class="review-item-background">
												<div class="review-item-score-img">
													<img class="review-item-star-img" src="resources/images/ic-star-small-on.png" alt="별모양" />
													<div class="review-item-score">${list.review_rate}</div>
												</div>
												<div class="review-item-write">${list.review_text}</div>
												<div class="review-item-sympathy">
													<img class="review-item-like-img" src="resources/images/btn-thumb-up-nor.svg" alt="추천" />
													<div class="review-item-like">
														공감 <span class="review-item-like-count">${list.recommend_count}</span>
													</div>
												</div>
											</div>
											<div class="review-item-date">${list.write_time}</div>
										</div>
									</div>
								</div>
							</div>
							<div class="line"></div>
						</c:forEach>
					</c:if>
				</div>
				<!-- 1:1 문의 -->
				<div class="content qa-menu">
					<div class="content-list-text">1:1 문의</div>
					<button class="qa-write-button">1:1 문의하기</button>
					<div id="qa-table">
                        <div class="col">번호</div>
                        <div class="col">문의유형</div>
                        <div class="col">제목</div>
                        <div class="col">등록일</div>
                        <div class="col">답변상태</div>
                        <div class="col">상세</div>
                        
          				<c:if test="${fn:length(mypageQAList) == 0}">
							<div class="value" style="grid-column: 1/7;">1:1 문의한 내용이 없습니다.</div>
						</c:if>
						<c:if test="${fn:length(mypageQAList) != 0}">
	                        <c:forEach items="${mypageQAList}" var="list" varStatus="status">
		                        <div class="value" style="grid-column: 1/2;">${status.count}</div>
		                        <div class="value" style="grid-column: 2/3;">${list.question_type}</div>  
		                        <div class="value" style="grid-column: 3/4;">${list.question_title}</div>
		                        <div class="value" style="grid-column: 4/5;">${fn:substring(list.reg_date, 0, 10)}</div>
		                        <div class="value" style="grid-column: 5/6;">${list.answer_state}</div>
		                        <div class="value qa-detail" style="grid-column: 6/7;" onclick="goQADetail(${list.question_id})">></div>
	                        </c:forEach>
                        </c:if>
                    </div>
				</div>
				<!-- 회원정보 수정 -->
				<div class="content update-member">
					<div class="content-list-text">회원정보 수정</div>
				</div>
				<!-- 1:1 문의 상세 -->
				<div class="content qa-detail-menu">
					<div class="content-list-text">1:1 문의 내용 상세보기</div>
					<div class="content-list-text-sub">1:1 문의</div>
					<div id="qa-detail-table">
                        <div class="row" style="grid-row: 1/2;">문의 날짜</div>
                        <div class="value qa-date"></div>
                        <div class="row" style="grid-row: 2/3;">문의 유형</div>
                        <div class="value qa-type"></div>  
                        <div class="row" style="grid-row: 3/4;">문의 제목</div>
                        <div class="value qa-title"></div>
                        <div class="row" style="grid-row: 4/5;">문의 내용</div>
                        <div class="value qa-text"></div>
                        <div class="row" style="grid-row: 5/6;">문의 상태</div>
                        <div class="value qa-state"></div>
                    </div>
                    <div class="answer">
						<div class="content-list-text-sub">답변</div>
						<div id="answer-table">
	                        <div class="row" style="grid-row: 1/2;">답변 날짜</div>
	                        <div class="value answer-date"></div>
	                        <div class="row" style="grid-row: 2/3;">답변 내용</div>
	                        <div class="value answer-text"></div>  
	                    </div>
                    </div>
				</div>
			</div>
		</div>
       <%@ include file = "footer.jsp" %>
    </div>
</body>
<script type="text/javascript">
// 메뉴 전환
$(".menu").click(function(){
	var num = $(".menu").index(this)
	// 메뉴 효과
	$(this).parent().children(".menu").removeClass("menu-active")
    $(this).addClass("menu-active")
    
    // 메뉴에 따른 내용 보이기 
    $(".content").removeClass("content-active")
    $(".content").eq(num).addClass("content-active")
})

// 1:1 문의 상세보기
function goQADetail(question_id) {
    $(".content").removeClass("content-active")
    $(".content").eq(4).addClass("content-active")
    
  	$.ajax ({
	    method: 'GET',
	    url: 'get_question_answer',
	    data: {"question_id": question_id},
	    contentType: "application/json; charset:UTF-8", 
	    success: function(resultData) { 
        	var result = JSON.parse(resultData)
        	var question = JSON.parse(result.question)
        	var answer = JSON.parse(result.answer)
	    	
		    $(".qa-date").text(question['reg_date'])
		    $(".qa-type").text(question['question_type'])
		    $(".qa-title").text(question['question_title'])
		    $(".qa-text").text(question['question_text']) 
		    $(".qa-state").text(question['answer_state']) 
		    
		    if (answer != null) {
		    	$(".answer").css("display", "block")
	        	$(".answer-date").text(answer['reg_date'])
	        	$(".answer-text").text(answer['answer_text'])
		    }
	   	} 
	}) 
}

// 리뷰쓰기
function moveReviewWrite(cinema_showing_id, time_slot){
	// 영화가 끝난 후 쓰기 가능
	var today = new Date()
	var year = time_slot.split('-')[0]
	var month = time_slot.split('-')[1]
	var day = time_slot.split('-')[2].split(' ')[0]
	var hour = time_slot.split(' ~ ')[1].split(':')[0]
	var min = time_slot.split(' ~ ')[1].split(':')[1]
	var end_time = new Date(year, month, day, hour, min, 0, 0)
	
	if (today < end_time) {
		alert("아직 시청 시간이 지나지 않은 영화입니다.");
	} else {
	  	$.ajax ({
		    method: 'GET',
		    url: 'review_already_write',
		    data: {"cinema_showing_id": cinema_showing_id},
		    contentType: "application/json; charset:UTF-8", 
		    success: function(resultData) { 
		    	if (resultData == 1) {
					location.href= "review_write?no1=" + String(cinema_showing_id)
		    	} else {
		    		alert("이미 리뷰를 작성하였습니다.");
		    	}
		   	} 
		}) 
	}
}

// 예매 취소
function ticketCancel(ticket_id, time_slot) {
	// 현재 시간과 상영시간대 비교 (영화 시작 시간 1시간전까지만 취소 가능)
	var today = new Date()
	var year = time_slot.split('-')[0]
	var month = time_slot.split('-')[1]
	var day = time_slot.split('-')[2].split(' ')[0]
	var hour = time_slot.split('-')[2].split(' ')[1].split(':')[0]
	var min = time_slot.split('-')[2].split(' ')[1].split(':')[1]
	var start_time = new Date(year, month, day, hour, min, 0, 0)
	start_time.setHours(start_time.getHours() - 1)
	
	console.log(today)
	console.log(start_time)

 	if (start_time > today) {
		var num = $(".ticket-cancel-button").index(this)
	  	$.ajax ({
		    method: 'GET',
		    url: 'ticket_cancel_action',
		    data: {"ticket_id": ticket_id, "state": "취소"},
		    contentType: "application/json; charset:UTF-8", 
		    success: function(resultData) { 
	    		alert("티켓이 취소되었습니다.");
	    		$(".state").eq(num).html("")
	    		$(".state").eq(num).append("상태: <span class='state-cancel'>취소</span>")
	    		$(".review-write-button").css("display", "none")
	    		$(".ticket-QR-button").css("display", "none")
	    		$(".ticket-cancel-button").css("display", "none")
		   	} 
		})	
	} else {
		alert("예매 취소는 시작시간 1시간전까지만 가능합니다.");	
	} 
}

// 리뷰 수정 
function reviewUpdate(review_id){
	location.href= "review_write?no2=" + String(review_id)
}

// 리뷰 삭제 
function reviewDelete(review_id){
	if (confirm("리뷰를 삭제하시겠습니까?")) {
	 	$.ajax ({
		    method: 'GET',
		    url: 'review_delete_action',
		    data: {"review_id": review_id},
		    contentType: "application/json; charset:UTF-8", 
		    success: function(resultData) { 
	    		alert("삭제되었습니다.");
	    		location.reload()
		   	} 
		}) 
	} 
}

// 1:1 문의하기
$(".qa-write-button").click(function(){
	location.href = "question_write"
})
</script>
</html>
