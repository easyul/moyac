<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.btn-group button {
	background-color: black;
	border: 1px solid gray;
	color: white;
	padding: 10px 24px;
	cursor: pointer;
	width: 33.3%%
}

.btn-group:after {
	content: "";
	clear: both;
	display: table;
}

.btn-group button:not(:last-child) {
	border-right: none;
}

.btn-group button:hover {
	background-color: gray;
}
</style>
</head>
<body>
	<div class='btn-group a' align="center">
			<button onclick="location.href='/moyac/views/board_event/list.do'">event게시판</button>
			<button onclick="location.href='/moyac/views/board_QnA/list.do'">QnA게시판</button>
			<button onclick="location.href='/moyac/views/board_notice/list.do'">공지사항게시판</button>
	</div>
</body>
</html>