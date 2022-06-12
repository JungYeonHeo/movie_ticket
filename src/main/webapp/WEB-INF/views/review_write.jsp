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
		<div class="reviewwriteclass">
			<form name="myform" id="myform" method="post" action="./save">
				<br> <br>
				<div class="reviewwritetitle">리뷰 작성하기</div>
				<br> <br>
				<fieldset>
					<legend id="startext"> </legend>
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
				</fieldset>
			</form>
			<input class="reviewtext" type="text" placeholder="리뷰를 입력해주세요.">
			<div class="warningreviewtext">리뷰를 입력해주세요.</div>
			<br> <br>
			<button class="reviewwritebutton">리뷰 남기기</button>
			<br><br>
		</div>
		<%@ include file="footer.jsp"%>
	</div>
</body>

<script type="text/javascript">
$(".reviewwritebutton").click(function () {
	var cinema_showing_id = String(${cinema_showing_id})
	var text = $(".reviewtext").val();
	var score = parseFloat($('input:radio[name="rating"]:checked').val());
	
	$.ajax ({
	    method: 'GET',
	    url: 'review_write_action',
	    data: {"cinema_showing_id": cinema_showing_id, "text": text, "score": score},
	    contentType: "application/json; charset:UTF-8", 
	    success: function(resultData) { 
			alert("리뷰가 등록되었습니다.");
			location.href = "mypage";
	   	} 
	})
});
</script>
</html>
