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
				<div class="logintext">로그인</div>
				<input class="inputid" type="text" autofocus required placeholder="ID를 입력해주세요.">
				<p class="warningid">id값을 입력해주세요.</p>
				<input class="inputpw" type="password" autofocus required placeholder="비밀번호를 입력해주세요.">
				<p class="warningpw">비밀번호를 입력해주세요.</p>
				<button class="loginbutton">로그인 하기</button>
				<div style="width: 160px; display: flex; margin: 0 auto;">
					<a class="findid">아이디 찾기</a> | 
					<a class="findpw">비밀번호 찾기</a>
				</div>
			</div>
		</div>
		<%@ include file="footer.jsp"%>
	</div>
</body>
<script type="text/javascript">
	$(".loginbutton").click(function() {
		if ($(".inputid").val().trim() == "" || $(".inputpw").val().trim() == "") {
			if ($(".inputid").val() == "") {
				$(".warningid").css("display", "block");
			}
			if ($(".inputpw").val() == "") {
				$(".warningpw").css("display", "block");
			}
		} else {
			$.ajax({
				method : 'GET',
				url : 'login_action',
				data : {
					"id" : $(".inputid").val(),
					"pw" : $(".inputpw").val()
				},
				contentType : "application/json; charset:UTF-8",
				success : function(resultData) {
					if (resultData == 1) {
						alert('로그인 실패')
					} else {
						alert('로그인되었습니다')
						history.go(-1)
					}
				}
			})
		}
	});
</script>
</html>