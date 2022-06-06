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
				<input class="input-id" type="text" autofocus required placeholder="ID를 입력해주세요.">
				<div class='p-warning' id="warning-id">아이디를 입력해주세요.</div>
				
				<div class='type'>비밀번호</div>
				<input class="input-pw" type="password" autofocus required placeholder="비밀번호를 입력해주세요.">
				<div class='p-warning' id="warning-pw">비밀번호를 입력해주세요.</div>
				
				<div class='type'>비밀번호 확인</div>
				<input class="input-pw-check" type="password" autofocus required placeholder="비밀번호를 확인해주세요.">
				<div class='p-warning' id="warning-pw-check">비밀번호를 확인해주세요.</div>
				
				<div class='type'>이름</div>
				<input class="input-name" type="text" autofocus required placeholder="이름을 확인해주세요.">
				<div class='p-warning' id="warning-name">이름을 입력해주세요.</div>
				
				<div class='type'>전화번호</div>
				<input class="input-phonenumber" type="text" autofocus required placeholder="010-0000-0000 형식으로 입력해주세요.">
				<div class='p-warning' id="warning-phonenumber">전화번호를 입력해주세요.</div>
		
				<div class='line'></div> 
				
				<div class='padding'>
					<div class='birth'>
						<div class='type'>생년월일</div>
						<input class="input-birth" type="date" min="${min_birth}" max="${max_birth}">
					</div>
					<div class='p-warning' id="warning-birth">생년월일을 입력해주세요.</div>
				</div>
				
				<div class='padding'>
					<div class='gender'>
						<div class='type'>성별</div>
						<div class='radio-group'>
							<input class="input-gender" type="radio" name="gender" value='F'><label for='F'>여성</label>
							<input class="input-gender" type="radio" name="gender" value='M'><label for='M'>남성</label>
						</div>
					</div>
					<div class='p-warning' id="warning-gender">성별을 체크해주세요.</div>
				</div>
				<button class="signup-button">회원가입 하기</button>
			</div>
		</div>
		<%@ include file="footer.jsp"%>
	</div>
</body>
<script type="text/javascript">
var id_duplication = false;
var pw_type = false;
var pw_equal = false;
var tel_type = false;

$(".signup-button").click(function() {
	var id = $(".input-id").val().trim()
	var pw = $(".input-pw").val().trim()
	var pw2 = $(".input-pw-check").val().trim()
	var name = $(".input-name").val().trim()
	var tel = $(".input-phonenumber").val().trim()
	var birth = $(".input-birth").val()
	var gender = $('input[name=gender]:checked').val()
	
	if (id == "" || pw == "" || pw2 == "" || name == "" || tel == "" || birth == "" || gender == undefined
		|| !id_duplication || !pw_type  || !pw_equal || !tel_type) {
		if (id == "") {
			$("#warning-id").css("display", "block");
		}
		if (pw == "") {
			$("#warning-pw").css("display", "block");
		}
		if (pw2 == "") {
			$("#warning-pw-check").css("display", "block");
		}
		if (name == "") {
			$("#warning-name").css("display", "block");
		}
		if (tel == "") {
			$("#warning-phonenumber").css("display", "block");
		}
		if (birth == "") {
			$("#warning-birth").css("display", "block");
		}
		if (gender == undefined) {
			$("#warning-gender").css("display", "block");
		}
	} else {
		$.ajax ({
	        method: 'POST',
	        url: '${pageContext.request.contextPath}/signup_action',
	        data: {"id": id, "pw": pw, "name": name, "phonenumber": tel, "birth": birth, "gender": gender},
	        success: function(resultData) {
	        	if (resultData == 1) {
	        		alert('회원가입 실패')
	        	} else {
	        		alert('회원가입 되었습니다.')
	        		location.href="login"
		       	}
	        }
	    })
	}	
})
</script>
</html>
