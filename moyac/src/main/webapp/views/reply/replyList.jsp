<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		//시작 시 수정 폼 hide
		$(".update_form").css("display", "none");
		$(".update_hide").css("display", "none");
		// 댓글 수정 폼 show
		$(".update_view").click(
				function() {
					$(this).parents(".reply_list").find(".update_form").css(
							"display", "block");
					$(this).parents(".reply_list").find(".origin_content").css(
							"display", "none");
					$(this).css("display", "none");
					$(this).siblings().css("display", "block");	
					
				});
		// 댓글 수정 폼 hide
		$(".update_hide").click(
				function() {
					$(this).parents(".reply_list").find(".update_form").css(
							"display", "none");
					$(this).parents(".reply_list").find(".origin_content").css(
							"display", "block");
					$(this).css("display", "none");
	
					$(this).siblings().css("display", "block");	
				});
		
	});
	function update() {
		alert("댓글이 수정되었습니다.");
	}
	
	function del() {
		var con = confirm("정말로 삭제하시겠습니까?")
		if (con) {
			alert("삭제되었습니다.")
			return
		} else
			alert("삭제가 취소되었습니다.")
			return false
	}
</script>
</head>
<body>
	<div align="center">
		<div>
			<c:if test="${empty list }">
				<div>댓글이 없습니다.</div>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="reply_event" items="${list }">
					<div style="border: 1px solid; width: 360px; word-break: break-all;">
						<c:if test="${reply_event.del=='y' }">
							<span>삭제된 게시물입니다.</span>
						</c:if>
						<c:if test="${reply_event.del != 'y' }">
							<div class="reply_list">
								<span>작성자: ${reply_event.nick_name}</span> 
								<span>작성일: ${reply_event.reg_date }</span> 
								추천수: <span>${reply_event.likes }</span><br>
									<!-- 추천기능 -->
									<div style="float : left; width : 40%">
										<!-- 추천을 하지 않은 사람 일 때 -->
									<c:if test="${ reply_event.likesConfirm == 0}">
										<span onclick="location.href='/moyac/views/reply/replyLikes.do?pageNum=${pageNum}&reply_no=${reply_event.reply_no}'" class="likes" >추천</span>
									</c:if>
										<!-- 추천을 한 사람 일때 -->
									<c:if test="${ reply_event.likesConfirm == 1}">
										<span onclick="location.href='/moyac/views/reply/replyLikes.do?pageNum=${pageNum}&reply_no=${reply_event.reply_no}'" class="likes_cancel">추천취소</span>
									</c:if>
									</div>
									<!-- 추천기능 끝 -->
									<!-- 수정 버튼 -->
									<div style="float : right; width : 40%">
									<c:if test="${id == reply_event.id || id == 'admin'}">
										<span class="update_view">수정</span>
										<span class="update_hide">수정취소</span>
									</c:if>
									</div><br>
									<!-- 수정버튼 끝 -->
								<div class="origin_content" style= "border: 1px solid black; width: 90%; margin-bottom: 3px;" >${reply_event.content}</div>
								<!-- 수정 기능 -->
								<div style="width: 100%; word-break: break-all;" class="update_form">
									<form action="/moyac/views/board_event/content.do" onsubmit="return update()">
											<textarea rows="5" cols="20" name="update_content" style="resize: none;" required="required">${reply_event.content}</textarea><br>
											<input type="hidden" value="${reply_event.boardno}" name="boardno"> 
											<input type="hidden" value="${pageNum}" name="pageNum"> 
											<input type="hidden" value="${reply_event.reply_no}" name="reply_no"> 
											<input type="submit" >
									</form>
								</div>
								<!-- 수정 기능 끝 -->
								<!-- 삭제기능 -->
								<div align="right">
								<c:if test="${id == reply_event.id || id == 'admin'}">
									<form action="/moyac/views/board_event/content.do" onsubmit="return del()">
										<input type="hidden" value="${reply_event.boardno}" name="boardno">
										<input type="hidden" value="1" name="delete">
										<input type="hidden" value="${reply_event.reply_no}" name="reply_no">
										<input type="hidden" value="${pageNum}" name="pageNum">
										<input type="submit" value="삭제">
									</form>
								</c:if>
								</div>
								<!-- 삭제기능 끝 -->
							</div>
						</c:if>
					</div><br>
				</c:forEach>
			</c:if>
		</div>
	</div>
</body>
</html>