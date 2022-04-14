<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> ${color} ${shape } ${formulation }으로 검색된 약품</h2>
	<table border="1">
		<tr>
			<th>사진</th>
			<th>이름</th>
			<th>모양</th>
			<th>색</th>
			<th>제형</th>
		</tr>
		<c:if test="${empty list }">
			<tr>
				<th colspan="5">일치하는 약품이 없습니다.</th>
			</tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="medicine" items="${list }">
				<tr onclick="location.href='/moyac/views/medicine/medicine_info.do?me_no=${medicine.me_no}&pageNum=${currentPage}&color=${color}&shape=${shape }&formulation=${formulation }'">
					<td>${medicine.me_pic }</td>
					<td>${medicine.me_name }</td>
					<td>${medicine.me_shape }</td>
					<td>${medicine.me_color }</td>
					<td>${medicine.me_formulation }</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<!-- paging -->
	<div align="center">
		<c:if test="${startPage > PAGE_PER_BLOCK }">
			<button onclick="location.href='filterSearch.do?pageNum=${startPage-1}&color=${color}&shape=${shape }&formulation=${formulation }'">이전</button>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<c:if test="${currentPage== i }">
				<button onclick="location.href='filterSearch.do?pageNum=${i}&color=${color}&shape=${shape }&formulation=${formulation }'" disabled>${i}</button>
			</c:if>
			<c:if test="${currentPage!= i }">
				<button onclick="location.href='filterSearch.do?pageNum=${i}&color=${color}&shape=${shape }&formulation=${formulation }'">${i}</button>
			</c:if>
		</c:forEach>
		<c:if test="${endPage < totalPage }">
			<button onclick="location.href='filterSearch.do?pageNum=${endPage+1}&color=${color}&shape=${shape }&formulation=${formulation }'">다음</button>
		</c:if>
	</div>
	<!-- paging  끝-->
</body>
</html>