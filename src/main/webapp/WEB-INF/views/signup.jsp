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
			<div class="signup">
				<div class="signuptext">회원가입</div>
				<div class='type'>아이디</div>
				<input class="inputid" type="text" autofocus required placeholder="ID를 입력해주세요.">
				<div class='p-warning' id="warningid">id값을 입력해주세요.</div>
				
				<div class='type'>비밀번호</div>
				<input class="inputpw" type="password" autofocus required placeholder="비밀번호를 입력해주세요.">
				<div class='p-warning' id="warningpw">비밀번호를 입력해주세요.</div>
				
				<div class='type'>비밀번호 확인</div>
				<input class="inputpw_check" type="password" autofocus required placeholder="비밀번호를 확인해주세요.">
				<div class='p-warning' id="warningpw_check">비밀번호를 확인해주세요.</div>
				
				<div class='type'>이름</div>
				<input class="inputname" type="text" autofocus required placeholder="이름을 확인해주세요.">
				<div class='p-warning' id="warningname">이름을 확인해주세요.</div>
				
				<div class='type'>전화번호</div>
				<input class="inputphonenumber" type="text" autofocus required placeholder="010-0000-0000 형식으로 입력해주세요.">
				<div class='p-warning' id="warningphonenumber">전화번호를 확인해주세요.</div>
		
				<div class='line'></div> 
				
				<div class='padding'>
					<div class='birth'>
						<div class='type'>생년월일</div>
						<input class="inputbirth" type="date">
					</div>
					<div class='p-warning' id="warningbirth">생년월일을 확인해주세요.</div>
				</div>
				
				<div class='padding'>
					<div class='gender'>
						<div class='type'>성별</div>
						<div class='radio-group'>
							<input class="inputgender" type="radio" name="gender" value='F'><label for='F'>여성</label>
							<input class="inputgender" type="radio" name="gender" value='M'><label for='M'>남성</label>
						</div>
					</div>
					<div class='p-warning' id="warninggender">성별을 확인해주세요.</div>
				</div>
				<button class="signupbutton">회원가입 하기</button>
			</div>
		</div>
		<%@ include file="footer.jsp"%>
	</div>
</body>
<script type="text/javascript">
$(".signupbutton").click(function() {
	if ($(".inputid").val() == "" || $(".inputpw").val() == "" || $(".inputpw_check").val() == "" || 
			$(".inputname").val() == "" || $(".inputphonenumber").val() == "" || $(".inputbirth").val() == "" || $(".inputgender").val() == "") {
		if ($(".inputid").val() == "") {
			$("#warningid").css("display", "block");
		}
		if ($(".inputpw").val() == "") {
			$("#warningpw").css("display", "block");
		}
		if ($(".inputpw_check").val() == "") {
			$("#warningpw_check").css("display", "block");
		}
		if ($(".inputname").val() == "") {
			$("#warningname").css("display", "block");
		}
		if ($(".inputphonenumber").val() == "") {
			$("#warningphonenumber").css("display", "block");
		}
		if ($(".inputbirth").val() == "") {
			$("#warningbirth").css("display", "block");
		}
		if ($(".inputgender").val() == "") {
			$("#warninggender").css("display", "block");
		}
	} else {
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
	        		alert('회원가입 되었습니다.')
	        		location.href=""
		       	}
	        }
	    })
	}	
})
</script>
</html>
