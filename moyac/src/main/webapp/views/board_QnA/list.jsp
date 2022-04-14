<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../sessionChk.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="../../js/jquery.js"></script>
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
	margin: 0 0 20px 50px;
}
</style>
</head>
<body>
<!-- 	<h2>QnA 게시판</h2> -->
	<div class="total_content">
	<div class="search_form" >
		<form action="/moyac/views/board_QnA/qnASearch.do" class="d-flex">
			<select name="searchKey">
				<option value="subject">제목</option>
				<option value="nick_name">닉네임</option>
			</select> 
			<div>
				<input class="form-control search_form2" type="text" name="searchValue" required="required" autofocus="autofocus"> 
			</div>
			<input type="submit" value="검색" class="btn btn-primary">
		</form>
		</div>
		<table border="1" class="table table-hover table-striped">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
					<th>좋아요</th>
				</tr>
			</thead>
			<c:if test="${empty list }">
				<tr>
					<th colspan="5">QnA 게시물이 없습니다.</th>
				</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="board_QnA" items="${list }">
					<tr>
						<td>${number }<c:set var="number" value="${number-1 }"></c:set></td>
						<c:if test="${board_QnA.del=='y' }">
							<th colspan="5">삭제된 게시물입니다.</th>
						</c:if>
						<c:if test="${board_QnA.del != 'y' }">
							<td title="${board_QnA.content }">
								<c:if test="${board_QnA.re_level > 0 }">
									<img alt="" src="../../images/level.gif" height="5" width="${board_QnA.re_level*10}">
									<i class="fab fa-replyd fa-lg"></i>
								</c:if> 
								<a href='/moyac/views/board_QnA/content.do?boardno=${board_QnA.boardno}&pageNum=${currentPage}'>${board_QnA.subject }</a>
								<c:if test="${board_QnA.read_cnt > 50 }">
									<img alt="" src="../../images/promotional.png" width="20px" height="20px">
								</c:if></td>
							<td>${board_QnA.nick_name }</td>
							<td>${board_QnA.reg_date }</td>
							<td>${board_QnA.read_cnt }</td>
							<td>${board_QnA.likes }</td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
	<!-- paging -->
	<div align="center">
		<c:if test="${startPage > PAGE_PER_BLOCK }">
			<button class="btn btn-outline-primary"
				onclick="location.href='/moyac/views/board_QnA/list.do?pageNum=${startPage-1 }'">이전</button>
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${currentPage == i}">
				<!-- 내가 보고 있는 페이지를 표시하기 위해서 disabled를 쓴다 -->
				<button class="btn btn-outline-primary"
					onclick="location.href='/moyac/views/board_QnA/list.do?pageNum=${i}'"
					disabled="disabled">${i}</button>
			</c:if>
			<c:if test="${currentPage != i}">
				<button class="btn btn-outline-primary"
					onclick="location.href='/moyac/views/board_QnA/list.do?pageNum=${i}'">${i}</button>
			</c:if>
		</c:forEach>
		<!-- 보여줄 것이 남아있다 -->
		<c:if test="${endPage < totalPage }">
			<button class="btn btn-outline-primary"
				onclick="location.href='/moyac/views/board_QnA/list.do?pageNum=${endPage+1}'">다음</button>
		</c:if>
	</div>
	<!-- paging  끝-->
	<br>
	<button class="btn btn-primary button_write"
		onclick="location.href='/moyac/views/board_QnA/writeForm.do?boardno=0&pageNum=${currentPage}'">글쓰기</button>
</body>
</html>