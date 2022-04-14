<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div>
			<h1>비밀번호 찾기</h1>
			<form action="findPw.do" method="post">
				<input type="text" name="id" placeholder="아이디" required="required"> 
				<input type="text" name="email" placeholder="이메일" required="required"> 
				<input type="submit" class="btn" value="비밀번호 찾기">
			</form>
		</div>
	</div>
</body>
</html>