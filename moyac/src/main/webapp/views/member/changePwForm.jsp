<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function pass_chk() { // 암호 확인
		if (frm.password.value != '' && frm.password2.value != '') {
			if (frm.password.value == frm.password2.value) {
				document.getElementById('same').innerHTML = '비밀번호가 일치합니다.';
				document.getElementById('same').style.color = 'blue';
			} else {
				document.getElementById('same').innerHTML = '비밀번호가 일치하지 않습니다.';
				document.getElementById('same').style.color = 'red';
				frm.password2.focus();
				frm.password2.value = "";
			}
		}
	}
</script>
</head>
<body>
	<form action="changePw.do" name="frm" method="post">
		<table>
			<caption>새로운 비밀번호</caption>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" value="${id }" readonly></td>
			</tr>
			<tr>
				<th>암호</th>
				<td><input type="password" name="password" required autofocus></td>
			</tr>
			<tr>
				<th>암호확인</th>
				<td><input type="password" name="password2" required
					onchange="pass_chk()">
					<div id="same"></div></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="비밀번호 변경"></th>
			</tr>
		</table>
	</form>
</body>
</html>