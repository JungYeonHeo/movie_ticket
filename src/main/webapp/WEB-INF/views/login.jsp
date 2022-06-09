<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<%@ include file="head.jsp"%>
	<link type="text/css" rel="stylesheet" href="resources/css/login.css">
	<title>대체로 맑음 - 로그인</title>
</head>
<body>
	<div id="wrap">
		<%@ include file="header.jsp"%>
		<div class="container">
			<div class="login">
				<div class="login-text">로그인</div>
				<input class="input-id" type="text" autofocus required placeholder="이메일 아이디 입력해주세요.">
				<p class="warning-id">이메일 아이디를 입력해주세요.</p>
				<input class="input-pw" type="password" autofocus required placeholder="비밀번호를 입력해주세요.">
				<p class="warning-pw">비밀번호를 입력해주세요.</p>
				<button class="login-button">로그인 하기</button>
				<div style="width: 160px; display: flex; margin: 0 auto;">
					<a class="find-id">아이디 찾기</a> | 
					<a class="find-pw">비밀번호 찾기</a>
				</div>
			</div>
		</div>
		<%@ include file="footer.jsp"%>
	</div>
</body>
<script type="text/javascript">
$(".login-button").click(function() {
	var id = $(".input-id").val().trim()
	var pw = $(".input-pw").val().trim()
	
	if (id == "" || pw == "") {
		if (id == "") {
			$(".warning-id").css("display", "block");
		}
		if (pw == "") {
			$(".warning-pw").css("display", "block");
		}
	} else {
		$.ajax({
			method: 'POST',
			url: '${pageContext.request.contextPath}/login_action',
			data: {
				"id" : id,
				"pw" : pw
			},
			success: function(resultData) {
				if (resultData == 1) {
					alert('없는 아이디와 비밀번호입니다.')
				} else {
					alert('로그인되었습니다.')
					var referrer = document.referrer
					if (referrer.startsWith('http://localhost:8080/ticket/ticket')) {
						history.go(-1)
					} else {
						location.href = "index"
					} 
				}
			}
		})
	}
})
</script>
</html>