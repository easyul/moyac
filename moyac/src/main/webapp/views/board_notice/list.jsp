<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../sessionChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.total_content {
	display: flax;
	justify-content: center;
	align-items: center;
	padding: 0 50px;
	width: 100%;
	margin-top: 50px;
}
.search_form {	
	display: flex;
	justify-content: flex-end;
	margin-bottom: 10px;
}
.search_form2 {
	margin-left: 10px;
	margin-right: 10px;
	width: 200px;
	right: 10px;
}
h2 {
	margin: 0 0 -40px 60px;
}
.button_write {
	margin-left: 50px;
	margin-bottom: 20px;
}
</style>
</head>
<body>
<!-- <h2>공지사항 게시판</h2> -->
<div class="total_content">
<div class="search_form" >
	<form action="/moyac/views/board_notice/noticeSearch.do" class="d-flex">
		<select>
		<option>제목</option>
		</select>
		<input class="form-control search_form2" type="text" name="search" required="required" autofocus="autofocus"> 
		<input type="submit" value="검색" class="btn btn-primary">
	</form>
	</div>
	<table border="1" class="table table-hover table-striped">	
	<thead>	
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>좋아요</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty list }">
			<tr>
				<th colspan="5">notice 게시물이 없습니다.</th>
			</tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="board_notice" items="${list }">
				<tr>
					<td>${number}<c:set var="number" value="${number-1 }"></c:set></td>
					<c:if test="${board_notice.del=='y' }">
						<th colspan="4">삭제된 게시물입니다.</th>
					</c:if>
					<c:if test="${board_notice.del != 'y' }">
						<td title="${board_notice.content }">
						<a href='/moyac/views/board_notice/content.do?boardno=${board_notice.boardno}&pageNum=${currentPage}'>${board_notice.subject }</a>
							<c:if test="${board_notice.read_cnt > 50 }">
								<img alt="" src="../../images/promotional.png">
							</c:if>
						</td>
						<td>${board_notice.reg_date }</td>
						<td>${board_notice.read_cnt }</td>
						<td>${board_notice.likes }</td>
					</c:if>
				</tr>
			</c:forEach>
		</c:if>
		</tbody>
	</table>
	<!-- paging -->
	<div align="center">
		<c:if test="${startPage > PAGE_PER_BLOCK }">
			<button class="btn btn-outline-primary" onclick="location.href='/moyac/views/board_notice/list.do?pageNum=${startPage-1 }'">이전</button>
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${currentPage == i}">
				<button class="btn btn-outline-primary" onclick="location.href='/moyac/views/board_notice/list.do?pageNum=${i}'" disabled="disabled">${i}</button>
			</c:if>
			<c:if test="${currentPage != i}">
				<button class="btn btn-outline-primary" onclick="location.href='/moyac/views/board_notice/list.do?pageNum=${i}'">${i}</button>
			</c:if>
		</c:forEach>
		<c:if test="${endPage < totalPage }">
			<button class="btn btn-outline-primary" onclick="location.href='/moyac/views/board_notice/list.do?pageNum=${endPage+1}'">다음</button>
		</c:if>
	</div>
	<!-- paging  끝-->
	<br>
	<c:if test="${id == 'admin' }">
		<button class="btn btn-primary button_write" onclick="location.href='/moyac/views/board_notice/writeForm.do?boardno=0&pageNum=${currentPage}'">글쓰기</button>
	</c:if>
	</div>
</body>
</html>