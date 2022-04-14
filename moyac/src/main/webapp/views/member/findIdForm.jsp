<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<form class = "content" action="findId.do" method="post">
	<div class="textbox">
  		<input id="text" name=name required type="text" />
  		<label for="text">이름</label>
 	</div>
	<div class="textbox">
  		<input id="email" name=email required type="email" />
  		<label for="email">이메일</label>
	</div><br><br>
   	<input type="submit" id="check" value="아이디찾기">
</form>
</html>