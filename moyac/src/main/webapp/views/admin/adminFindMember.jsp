<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
		function del(delId) {
			var con = confirm("탈퇴처리 하시겠습니까?");
			if(con) {
				location.href="/moyac/views/myPage/delete.do?id="+delId;
			}
		}
</script>
</head>
<body>
<div class="container_table">
		<table border="1">
			<tr>
				<th>id</th><th>비밀번호</th><th>이름</th><th>별명</th><th>연락처</th><th>성별</th><th>연령</th><th>이메일</th><th>회원가입일</th><th>탈퇴여부</th><th>수정</th><th>탈퇴</th>
			</tr>
			<c:if test="${empty list} ">
				<tr><th colspan="14">검색된 회원정보가 없습니다</th></tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="member" items="${list }">
					<tr>
						<td>${member.id}</td>
						<td>${member.password}</td>
						<td>${member.name}</td>
						<td>${member.nick_name}</td>
						<td>${member.phone}</td>
						<td>${member.gender}</td>
						<td>${member.age}</td>
						<td>${member.email}</td>
						<td>${member.reg_date}</td>
						<td>${member.del}</td>
						<td><a href="../myPage/updateForm.do?id=${member.id}" class="btn btn_small">수정</a></td>
						<c:if test= "${member.del=='y' }">
						<td></td>
						</c:if>
						<c:if test= "${member.del=='n' }">
						<td><a onclick="del('${member.id}')" class="btn btn_small">탈퇴</a></td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>	
		</table>
	</div>
<div align="center">
		<c:if test="${startPage > PAGE_PER_BLOCK }">
			<button onclick="location.href='/moyac/views/admin/adminFindMember.do?pageNum=${startPage-1 }&searchKey=${searchKey }&searchValue=${searchValue }'">이전</button>
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${currentPage == i}">
				<button onclick="location.href='/moyac/views/admin/adminFindMember.do?pageNum=${i}&searchKey=${searchKey }&searchValue=${searchValue }'" disabled="disabled">${i}</button>
			</c:if>
			<c:if test="${currentPage != i}">
				<button onclick="location.href='/moyac/views/admin/adminFindMember.do?pageNum=${i}&searchKey=${searchKey }&searchValue=${searchValue }'">${i}</button>
			</c:if>
		</c:forEach>
		<c:if test="${endPage < totalPage }">
			<button onclick="location.href='/moyac/views/admin/adminFindMember.do?pageNum=${endPage+1}&searchKey=${searchKey }&searchValue=${searchValue }'">다음</button>
		</c:if>
	</div>
</body>
</html>