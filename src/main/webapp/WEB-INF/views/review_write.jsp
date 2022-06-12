<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="head.jsp"%>
	<meta charset="UTF-8">
	<link type="text/css" rel="stylesheet" href="resources/css/review_write.css">
	<title>대체로 맑음 - 리뷰 작성</title>
</head>
<body>
    <div id="wrap">
		<%@ include file="header.jsp"%>
		<div class="container">
			<div class="review-write-title">리뷰 작성하기</div>
			<img class="review-movie-poster" src="${movieInfor.poster_img}" alt="영화 포스터" />
			<div class="review-movie-title-ko">${movieInfor.title_ko}</div>
			<div class="review-movie-title-en">${movieInfor.title_en}</div>
			<form id="myform">
				<fieldset>
					<legend class="star-text"></legend>
					<input type="radio" name="rating" value="5" id="rate1">
					<label for="rate1">⭐</label>
					<input type="radio" name="rating" value="4" id="rate2">
					<label for="rate2">⭐</label>
					<input type="radio" name="rating" value="3" id="rate3">
					<label for="rate3">⭐</label>
					<input type="radio" name="rating" value="2" id="rate4">
					<label for="rate4">⭐</label> 
					<input type="radio" name="rating" value="1" id="rate5">
					<label for="rate5">⭐</label>
					<c:if test="${review.review_rate != null}">
						<script>
							$("input[type=radio]").eq(parseInt(5.0-${review.review_rate})).prop("checked", true)
						</script>
					</c:if>
				</fieldset>
			</form>
			<textarea class="review-text-input" rows="7" placeholder="리뷰를 입력해주세요.">${review.review_text}</textarea>
			<div class="review-text-warning">평가를 다 남겨주세요.</div>
			<br>
			<button class="review-write-button">리뷰 남기기</button>
		</div>
		<%@ include file="footer.jsp"%>
	</div>
</body>
<script type="text/javascript">
$(".review-write-button").click(function () {
	
	var text = $(".review-text-input").val()
	var score = parseFloat($("input:radio[name='rating']:checked").val())
	
	if (text == "" || isNaN(score)) {
		$(".review-text-warning").css("display", "block")
	} else {
		if ("${review.review_text}" == "") {
			// 리뷰 입력
			var cinema_showing_id = String(${cinema_showing_id})
			console.log("상영정보: " + cinema_showing_id)
			
			$.ajax ({
			    method: 'GET',
			    url: 'review_write_action',
			    data: {"cinema_showing_id": cinema_showing_id, "text": text, "score": score},
			    contentType: "application/json; charset:UTF-8", 
			    success: function(resultData) { 
					alert("리뷰가 등록되었습니다.");
					location.href = "mypage"
			   	} 
			})
		} else {
			// 리뷰 수정
			var review_id = String(${review.review_id})
			
			$.ajax ({
			    method: 'GET',
			    url: 'review_update_action',
			    data: {"review_id": review_id, "text": text, "score": score},
			    contentType: "application/json; charset:UTF-8", 
			    success: function(resultData) { 
					alert("리뷰가 수정되었습니다.");
					location.href = "mypage"
			   	} 
			})
		}
	}
});
</script>
</html>