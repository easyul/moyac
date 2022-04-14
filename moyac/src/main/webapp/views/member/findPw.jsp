<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function chk() {
	var user_num = document.getElementById('user_num');
	if (user_num.value == '${num}') {
		alert("인증번호 확인되었습니다.");
		location.href='/moyac/views/member/changePwForm.do?id=${member.id}';
	}
	if (user_num.value != '${num}') {
		alert("인증번호가 다릅니다. 다시 확인해주세요");
		user_num.value = "";
		return false;
	}
}
</script>
</head>
<body>
	<div class="container">
		<h1 class="title">비밀번호 변경 인증번호 입력</h1>
		<c:if test="${member != null }">
			<input type="text" id="user_num" name="user_num">
			<button onclick="chk()">확인</button>
		</c:if>

		<c:if test="${member == null }">
			존재하지 않는 회원정보 입니다.
		</c:if>
	</div>
</body>
</html>