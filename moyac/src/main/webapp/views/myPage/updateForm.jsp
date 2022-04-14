<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="../sessionChk.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../../js/jquery.js"></script>

<script type="text/javascript">
	function chk() { // 암호 확인
		if (frm.password.value != frm.password2.value) {
			alert("암호와 암호 확인이 다릅니다"); 	
			frm.password2.focus();
			frm.password2.value="";
			return false;
		}
	}
</script>
</head>
<body>
	<form action="update.do" method="post" name="frm" onsubmit="return chk()">
	<table>
		<caption>회원정보 수정</caption>
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="id" value="${member.id }" readonly required autofocus> 
			</td>
		</tr>
		<tr>
			<th>암호</th>
			<td>
				<input type="password" name="password" required>
			</td>
		</tr>
		<tr>
			<th>암호확인</th>
			<td>
				<input type="password" name="password2" required>
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>
				<input type="text" name="name" value="${member.name }" required>
			</td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td>
				<input type="text" name="nick_name"  value="${member.nick_name }" readonly required>
			</td>
		</tr>
		<tr>
			<th>전화</th>
			<td>
				<input type="tel" name="phone" value="${member.phone }" required pattern="010-\d{3,4}-\d{4}" placeholder="010-1111-1111" title="전화현식 010-숫자3/4-숫자4">
			</td>
		</tr>
		<tr>
			<th>나이</th>
			<td>
				<input type="number" name="age" value="${member.age }" required>
			</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
				<input type="radio" name="gender" value="m" checked>
				<label for="mal" class="radio-left">남자</label>
				<input type="radio" name="gender" value="f">
				<label for="fem" >여자</label>
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
				<input type="email" name="email" value="${member.email }" required autofocus placeholder="이메일을 입력해주세요">
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="수정완료">
			</th>
		</tr>
	</table>
	</form>
	<button onclick="location.href='/moyac/views/member/moyac_main.do'">메인페이지</button>
</body>
</body>
</html>