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
			<div class="content">
				<div class="reslist-text">예매 목록</div>
				<c:if test="${fn:length(mypageTicketList) == 0}">
					<div class="ticket-item-content-text">예매목록이 없습니다.</div>
				</c:if>
				<c:if test="${fn:length(mypageTicketList) != 0}">
					<c:forEach items="${mypageTicketList}" var="list">
					<div class="ticket-items">
						<div class="ticket-item-header">
							<div class="ticket-date">${list.ticket_date}</div>
							<div class="review-write-btn" onclick="moveReviewWrite(${list.movie_id})">리뷰쓰기</div>
						</div>
						<hr>
						<div class="ticket-item">
							<img class="ticket-img" src="${list.poster_img}" alt="영화 포스터" />
							<div class="ticket-item-content">
								<div class="ticket-item-content-text">제목: ${list.title_ko}</div>
								<div class="ticket-item-content-text">영화관: ${list.cinema_name}</div>
								<div class="ticket-item-content-text">날짜 및 시간: ${list.showing_date} ${list.showing_time}</div>
								<div class="ticket-item-content-text">자석: ${list.seat}</div>
								<div class="ticket-item-content-text">일반: ${list.adult_count}명, 청소년: ${list.youth_count}명</div>
								<div class="ticket-item-content-text">총 금액: ${list.total_price}</div>
								<div class="ticket-item-content-text">결제정보: ${list.payment}</div>
								<div class="ticket-item-content-text">상태: ${list.state}</div>
							</div>
						</div>
						<div class="ticket-item-footer">
							<div class="btn-group">
								<div class="ticket-QR-btn">QR코드</div>
								<div class="review-write-cancle">취소</div>
							</div>
						</div>
					</div>
					</c:forEach>
				</c:if>
				
			</div>
		</div>

       <%@ include file = "footer.jsp" %>
    </div>
</body>
<script type="text/javascript">
function moveReviewWrite(no){
	location.href= "review_write?no=" + String(no);
}
</script>
</html>
