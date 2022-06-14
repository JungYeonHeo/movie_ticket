<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="head.jsp"%>
	<meta charset="UTF-8">
	<link type="text/css" rel="stylesheet" href="resources/css/question_write.css">
	<title>대체로 맑음 - 1:1 문의 작성</title>
</head>
<body>
    <div id="wrap">
		<%@ include file="header.jsp"%>
		<div class="container">
			<div class="question-menu"> 
				<div class="question-write-title">1:1 문의 작성</div>
				<select class="question-type">
				    <option value="">문의유형선택</option>
				    <option value="영화">영화</option>
				    <option value="영화관">영화관</option>
				    <option value="상영관">상영관</option>
				    <option value="예매">예매</option>
				    <option value="환불">환불</option>
				    <option value="기타">기타</option>
				</select>
				<input type="text" class="question-title" autofocus required placeholder="제목을 입력해주세요">
				<textarea class="question-text" rows="7" autofocus required placeholder="문의내용을 입력해주세요"></textarea>
				<p class="warning-text">입력칸을 모두 작성해주세요.</p>
				<button class="question-write-button">1:1 문의 남기기</button>
			</div>
		</div>
		<%@ include file="footer.jsp"%>
	</div>
</body>
<script type="text/javascript">
$(".question-write-button").click(function () {
	var question_type = $(".question-type option:selected").val()
	var question_title = $(".question-title").val()
	var question_text = $(".question-text").val()

	console.log(question_type)
	console.log(question_title)
	console.log(question_text)
	
	if (question_type == "" || question_title == "" || question_text == "") {
		$(".warning-text").css("display", "block")
	} else {
		$.ajax ({
		    method: 'POST',
		    url: '${pageContext.request.contextPath}/question_write_action',
		    data: {"question_type": question_type, "question_title": question_title, "question_text": question_text}, 
		    success: function(resultData) { 
				alert("1:1 문의가 작성되었습니다.");
				location.href = "mypage"
		   	} 
		})
	}
})
</script>
</html>