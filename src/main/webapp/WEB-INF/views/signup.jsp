<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="head.jsp"%>
<link type="text/css" rel="stylesheet" href="resources/css/signup.css">
<title>대체로 맑음 - 회원가입</title>
</head>
<body>

	<div id="wrap">
		<%@ include file="header.jsp"%>

		<div class="container">

<!-- 			<div class="signuptable"> -->
<!-- 				<table border="1"> -->
<!-- 					<th>1.본인인증</th> -->
<!-- 					<th>2.약관동의</th> -->
<!-- 					<th>3.정보입력</th> -->
<!-- 					<th>4.가입완료</th> -->
<!-- 				</table> -->
<!-- 			</div> -->

			<div class="signup">
				<div class="signuptext">회원가입하기</div>
				<input class="inputid" type="text" placeholder="ID를 입력해주세요.">
				<div class="warningid">id값을 입력해주세요.</div>
				<input class="inputpw" type="text" placeholder="비밀번호를 입력해주세요.">
				<div class="warningpw">비밀번호를 입력해주세요.</div>
				<input class="inputpw_check" type="text" placeholder="비밀번호를 확인해주세요.">
				<div class="warningpw_check">비밀번호를 확인해주세요.</div>
				<input class="inputname" type="text" placeholder="이름을 확인해주세요.">
				<div class="warningname">이름을 확인해주세요.</div>
				<input class="inputphonenumber" type="text" placeholder="000-0000-0000 형식으로 입력해주세요.">
				<div class="warningphonenumber">전화번호를 확인해주세요.</div>
				<input class="inputbirth" type="text" placeholder="19xx-xx-xx 형식으로 입력해주세요.">
				<div class="warningbirth">생년월일을 확인해주세요.</div>
				<input class="inputgender" type="text" placeholder="F/M 형식으로 입력해주세요.">
				<div class="warninggender">성별을 확인해주세요.</div>

				<button class="signupbutton">회원가입 하기</button>
			</div>
		</div>
	</div>
	<br><br><br><br><br><br>
	<%@ include file="footer.jsp"%>
</body>
<script type="text/javascript">
$(".signupbutton").click(function() {
	if ($(".inputid").val() == "") {
		$(".warningid").css("display", "block");
	}
	if ($(".inputpw").val() == "") {
		$(".warningpw").css("display", "block");
	}
	if ($(".inputpw_check").val() == "") {
		$(".warningpw_check").css("display", "block");
	}
	if ($(".inputname").val() == "") {
		$(".warningname").css("display", "block");
	}
	if ($(".inputphonenumber").val() == "") {
		$(".warningphonenumber").css("display", "block");
	}
	if ($(".inputbirth").val() == "") {
		$(".warningbirth").css("display", "block");
	}
	if ($(".inputgender").val() == "") {
		$(".warninggender").css("display", "block");
	}
		
	$.ajax ({
        method: 'GET',
        url: 'signup_action',
        data: {"id": $(".inputid").val(), "pw": $(".inputpw").val(),
        	"name": $(".inputname").val(), "phonenumber": $(".inputphonenumber").val(),
        	"gender": $(".inputgender").val(), "birth": $(".inputbirth").val()},
        contentType: "application/json; charset:UTF-8",
        success: function(resultData) {
        	if (resultData == 1) {
        		alert('회원가입 실패')
        	} else {
        		alert('회원가입 성공')
        		location.href=""
	       	}
        }
    })
});
</script>
</html>
