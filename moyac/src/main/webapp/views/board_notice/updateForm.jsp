<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	padding: 0 100px;
	widdiv: 100%;
	margin-top: 50px;
}

h3 {
	margin: 0 0 -40px 100px;
}

.content_write {
	margin: 10px;
}
</style>
</head>
<body>
	<h3>공지사항 수정</h3>
	<div class="total_content">
		<form action="/moyac/views/board_notice/update.do" method="post">
			<input type="hidden" name="boardno" value="${board_notice.boardno }">
			<input type="hidden" name="pageNum" value="${pageNum }"> <input
				type="hidden" name="nick_name" value="${nick_name }">
			<div>제목</div>
			<div>
				<input class="form-control" type="text" name="subject" required="required"
					autofocus="autofocus" value="${board_notice.subject }">
			</div>
			<p>
			<div>내용</div>
			<div>
				<textarea class="form-control" rows="16" cols="40" name="content" required="required">${board_notice.content }</textarea>
			</div>
			<div class="content_write" align="center">
				<input class="btn btn-primary" type="submit" value="확인">
			</div>
		</form>
	</div>
</body>
</html>