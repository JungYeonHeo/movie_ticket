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
								<div class="review-write-button" onclick="moveReviewWrite(${list.cinema_showing_id})">리뷰쓰기</div>
							</div>
							<hr>
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
									<div class="ticket-item-content-text">상태: ${list.state}</div>
								</div>
							</div>
							<div class="ticket-item-footer">
								<div class="btn-group">
									<div class="ticket-QR-button">QR코드</div>
									<div class="ticket-cancle-button">취소</div>
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
										<div class="review-item-score-text">
											<div style="width: 15%; display: flex;">
												<img class="review-item-star-img" src="resources/images/ic-star-small-on.png" alt="별모양" />
												<div class="review-item-score">${list.review_rate}</div>
											</div>
											<div style="width: 85%; position: relative;">
												<div class="review-item-write">${list.review_text}</div>
												<div class="review-item-sympathy">
													<img class="review-item-like-img" src="resources/images/btn-thumb-up-nor.svg" alt="추천" />
													<div class="review-item-like">
														공감 <span class="review-item-like-count">${list.recommend_count}</span>
													</div>
												</div>
											</div>
										</div>
										<div class="review-item-date">${list.write_time}</div>
									</div>
								</div>
							</div>
							<div class="review-item-line"> </div>
						</c:forEach>
					</c:if>
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

// 리뷰쓰기
function moveReviewWrite(cinema_showing_id){
	location.href= "review_write?no=" + String(cinema_showing_id)
}

// 리뷰 수정 
function reviewUpdate(no){
	location.href= "review_update?no=" + String(no)
	
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
</script>
</html>
