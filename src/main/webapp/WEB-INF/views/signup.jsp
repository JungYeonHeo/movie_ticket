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
				<div class='type-text'>아이디</div>
				<input class="input-id" type="text" name="input" autofocus required placeholder="이메일 아이디를 입력해주세요.">
				<button class="id-duplication-check" disabled="disabled">중복 확인</button>
				<p class='p-warning' id="warning-id">이메일 아이디를 입력해주세요.</p>
				
				<div class='type-text'>비밀번호</div>
				<input class="input-pw" type="password" name="input" autofocus required placeholder="비밀번호를 입력해주세요.">
				<p class='p-warning' id="warning-pw">비밀번호를 입력해주세요.</p>
				
				<div class='type-text'>비밀번호 확인</div>
				<input class="input-pw-check" type="password" name="input" autofocus required placeholder="비밀번호를 확인해주세요.">
				<p class='p-warning' id="warning-pw-check">비밀번호를 확인해주세요.</p>
				
				<div class='type-text'>이름</div>
				<input class="input-name" type="text" name="input" autofocus required placeholder="이름을 확인해주세요.">
				<p class='p-warning' id="warning-name">이름을 입력해주세요.</p>
				
				<div class='type-text'>전화번호</div>
				<input class="input-phonenumber" type="text" name="input" autofocus required placeholder="전화번호를 입력해주세요.">
				<p class='p-warning' id="warning-phonenumber">전화번호를 입력해주세요.</p>
		
				<div class='line'></div> 
				
				<div class='padding'>
					<div class='birth'>
						<div class='type-text'>생년월일</div>
						<input class="input-birth" type="date" min="${min_birth}" max="${max_birth}">
					</div>
					<p class='p-warning' id="warning-birth">생년월일을 입력해주세요.</p>
				</div>
				
				<div class='padding'>
					<div class='gender'>
						<div class='type-text'>성별</div>
						<div class='radio-group'>
							<input class="input-gender" type="radio" name="gender" value='F'><label for='F'>여성</label>
							<input class="input-gender" type="radio" name="gender" value='M'><label for='M'>남성</label>
						</div>
					</div>
					<p class='p-warning' id="warning-gender">성별을 체크해주세요.</p>
				</div>
				<button class="signup-button">회원가입 하기</button>
			</div>
		</div>
		<%@ include file="footer.jsp"%>
	</div>
</body>
<script type="text/javascript">
var id_duplication = false
var id_email_type = false
var pw_type = false
var pw_equal = false
var tel_type = false

// 아이디 중복 확인
$(".id-duplication-check").click(function() {
	var id = $(".input-id").val().trim()
	$("#btn_id_check").attr("disabled", true)

	$.ajax ({
        method: "POST",
        url: "${pageContext.request.contextPath}/signup_id_check",
        data: {"id": id},
        success: function(resultData) {
    		if (resultData == 1) { // 아이디 중복 
    			$("#warning-id").text("아이디가 중복됩니다.")
    			$("#warning-id").css("display", "block")
    			$(".id-duplication-check").attr("disabled", false)
    		} else if (resultData == 2) { // 아이디 중복 X
    			$("#warning-id").text("사용가능한 이메일입니다.")
    			$("#warning-id").css("display", "block")
    			$("#warning-id").css("color", "green")
    			$(".id-duplication-check").css("color", "green")
    			$(".id-duplication-check").css("border", "1px solid green")
    			$(".id-duplication-check").text("확인완료")
    			id_duplication = true
    		}
        }
    })
})

// 회원가입 버튼
$(".signup-button").click(function() {
	var id = $(".input-id").val().trim()
	var pw = $(".input-pw").val().trim()
	var pw2 = $(".input-pw-check").val().trim()
	var name = $(".input-name").val().trim()
	var tel = $(".input-phonenumber").val().trim()
	var birth = $(".input-birth").val()
	var gender = $('input[name=gender]:checked').val()
	
	// 입력 형식 확인
	if (id == "" || pw == "" || pw2 == "" || name == "" || tel == "" || birth == "" || gender == undefined
		|| !id_duplication || !pw_type  || !pw_equal || !tel_type) {
		if (id == "") {
			$("#warning-id").css("display", "block")
			$(".input-id").focus()
		}
		if (pw == "") {
			$("#warning-pw").css("display", "block")
			$(".input-pw").focus()
		}
		if (pw2 == "") {
			$("#warning-pw-check").css("display", "block")
			$(".input-pw-check").focus()
		} else if (!pw_equal) {
			$("#warning-pw-check").css("display", "block");
			$("#warning-pw-check").text("비밀번호: 불일치");
		} else {
			$("#warning-pw-check").css("display", "block");
			$("#warning-pw-check").text("비밀번호: 일치");
		}
		if (name == "") {
			$("#warning-name").css("display", "block")
			$(".input-name").focus()
		}
		if (tel == "") {
			$("#warning-phonenumber").css("display", "block")
			$(".input-phonenumber").focus()
		}
		if (birth == "") {
			$("#warning-birth").css("display", "block")
			$(".input-birth").focus()
		}
		if (gender == undefined) {
			$("#warning-gender").css("display", "block")
			$("input[name=gender]").focus()
		}
	} else {
 		$.ajax ({
	        method: "POST",
	        url: "${pageContext.request.contextPath}/signup_action",
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

$(document).on("click", "input[name=input]", function(){ 
	var num = $("input[name=input]").index(this)
	
	var id = $(".input-id").val().trim()
	var pw = $(".input-pw").val().trim()
	var pw2 = $(".input-pw-check").val().trim()
	var name = $(".input-name").val().trim()
	var tel = $(".input-phonenumber").val().trim()
	var birth = $(".input-birth").val()
	var gender = $('input[name=gender]:checked').val()

	if (num == 0 && id == "") {
		$("#warning-id").css("display", "block")
		$("#warning-id").text("이메일 형식: 부적합 (aaaa@naver.com)")
	} else if (num == 1 && pw == "") {
		$("#warning-pw").css("display", "block")
		$("#warning-pw").text("비밀번호 형식: 부적합 (대소문자, 숫자, 특수문자 세가지 조합으로 8자 이상)")
	} else if (num == 2 && pw2 == "") {
		$("#warning-pw-check").css("display", "block")
		$("#warning-pw-check").text("비밀번호: 불일치")
	} else if (num == 3 && name == "") {
		$("#warning-name").css("display", "block")
		$("#warning-name").text("이름 형식: 부적합 (한글자 이상)")
	} else if (num == 4 && tel == "") {
		$(".input-phonenumber").val("010")
		$("#warning-phonenumber").css("display", "block")
		$("#warning-phonenumber").text("핸드폰번호 형식: 부적합")
	}
	
})

$(document).on("propertychange change keyup paste input", "input[name=input]", function(){ 
	var num = $("input[name=input]").index(this)

	if (num == 0) {
		var id = $(".input-id").val().trim()
		var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/
		if (regEmail.test(id)) {
			$("#warning-id").text("이메일 중복을 확인해주세요.")
			$("#warning-id").css("display", "block")
			$(".id-duplication-check").attr("disabled", false)
			$(".id-duplication-check").css("color", "#f16a1a")
			$(".id-duplication-check").css("border", "1px solid #f16a1a")
			id_email_type = true
		} else {
			$("#warning-id").text("이메일 형식: 부적합 (aaaa@naver.com)")
			$("#warning-id").css("display", "block")
			$(".id-duplication-check").attr("disabled", true)
			$(".id-duplication-check").css("color", "#bbb")
			$(".id-duplication-check").css("border", "1px solid #bbb")
			$(".id-duplication-check").text("중복확인")
			id_email_type = false
		}
	} else if (num == 1) {
		var pw = $(".input-pw").val().trim()
		var regPw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,12}$/
		if (regPw.test(pw)) {
			$("#warning-pw").text("비밀번호 형식: 적합")
			$("#warning-pw").css("display", "block")
			$("#warning-pw").css("color", "green")
			pw_type = true
		} else {
			$("#warning-pw").text("비밀번호 형식: 부적합 (대소문자, 숫자, 특수문자 세가지 조합으로 8자 이상)")
			$("#warning-pw").css("display", "block")
			$("#warning-pw").css("color", "#f16a1a")
			pw_type = false
		}
	} else if (num == 2) {
		var pw = $(".input-pw").val().trim()
		var pw2 = $(".input-pw-check").val().trim()
		if (pw == pw2 && pw != "") {
			$("#warning-pw-check").text("비밀번호: 일치")
			$("#warning-pw-check").css("display", "block")
			$("#warning-pw-check").css("color", "green")
			pw_equal = true
		} else {
			$("#warning-pw-check").text("비밀번호: 불일치")
			$("#warning-pw-check").css("display", "block")
			$("#warning-pw-check").css("color", "#f16a1a")
			pw_equal = false
		}
	} else if (num == 3) {
		var name = $(".input-name").val().trim()
		if (name !== "") {
			$("#warning-name").text("이름: 적합")
			$("#warning-name").css("display", "block")
			$("#warning-name").css("color", "green")
		} else {
			$("#warning-name").text("이름을 입력해주세요.")
			$("#warning-name").css("display", "block")
			$("#warning-name").css("color", "#f16a1a")
		}
	} else if (num == 4) {
		var tel = $(".input-phonenumber").val().trim()
		tel = tel.replace(/\-/g, "")
		if (tel.length <= 3) {
			$(".input-phonenumber").val(tel.substr(0))
		} else if (tel.length <= 7) {
			$(".input-phonenumber").val(tel.substr(0, 3) + "-" + tel.substr(3, 4))
		} else {
			$(".input-phonenumber").val(tel.substr(0, 3) + "-" + tel.substr(3, 4) + "-" + tel.substr(7, 4))
		} 
		
		tel = $(".input-phonenumber").val().trim()
		var regtel = /^01([0|1|6|7|8|9])-?([0-9]{4})-?([0-9]{4})$/
		if (regtel.test(tel)) {
			$("#warning-phonenumber").text("핸드폰번호 형식: 적합")
			$("#warning-phonenumber").css("display", "block")
			$("#warning-phonenumber").css("color", "green")
			tel_type = true
		} else {
			$("#warning-phonenumber").text("핸드폰번호 형식: 부적합")
			$("#warning-phonenumber").css("display", "block")
			$("#warning-phonenumber").css("color", "#f16a1a")
			tel_type = false
		}
	}
})
</script>
</html>
