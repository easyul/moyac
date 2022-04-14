<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="../sessionChk.jsp"%>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.only_image {
	width: 200px;
	height: 200px;
	float: left;
	margin-right: 80px; 
	margin-bottom: 10px; 
}
.myPage {
	display: flex;
	justify-content: center;
	align-items: center;
}

.myPage_Button {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 150px;
	width: 150px;
	border: 1px solid;
	margin: 0px 25px;
}
/* 내가 쓴글 css */
.myWrite  {
	display: none;
	position: fixed;
	width: 100%;
	height: 100vh;
	z-index: 100;
	top: 0;
}

.myWrite .myWrite_dis {
	height: 100%;
	width: 100%;
	background-color: black;
	opacity: 0.3;
}

.myWrite .myWrite_content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	width: 50%;
	min-height: 50vh;
	padding: 30px;
}
/* 내가 쓴글 css 끝*/
/* 북마크 css*/
.myBookmark  {
	display: none;
	position: fixed;
	width: 100%;
	height: 100vh;
	z-index: 100;
	top: 0;
}

.myBookmark .myBookmark_dis {
	height: 100%;
	width: 100%;
	background-color: black;
	opacity: 0.3;
}

.myBookmark .myBookmark_content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	width: 50%;
	min-height: 50vh;
	padding: 30px;
}

.scroll-container {
	width: 270px;
	height: 350px;
	overflow-y: scroll;
	scroll-behavior: smooth;
	background-color: rgba(147, 207, 206, 0.7);

}
.one {
	border:1px solid; 
	padding:10px;
	margin: 10px;
	border-radius: 15px;
	width: 100px;
	height: 100px;
	float: left;
}
.del_btn {
  position: fixed;
     bottom: 30px;
     right: 30px;
}
.myWrite_content::-webkit-scrollbar {
	width: 10px;
}
.myWrite_content::-webkit-scrollbar-thumb {
    background-color: rgba(147, 207, 206, 0.7);
    border-radius: 10px;
    opacity: 0.2;
  }
.myWrite_content::-webkit-scrollbar-track {
    border-radius: 10px;
    box-shadow: inset 0px 0px 5px white;
  }
/* 북마크 css 끝*/
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	/* 내가쓴글,북마크 제이쿼리 */
	$(function() {
		$('#myWrite').click(function() {
			if ($('.myWrite').css('display') == 'none') {
				$('.myWrite').show();
			}
		});
		$('.myWrite_dis').on('click', function() {
			$('.myWrite').hide();
			$('html body').css('overflow', 'auto');
		});
		$('#myBookmark').click(function() {
			if ($('.myBookmark').css('display') == 'none') {
				$('.myBookmark').show();
			}
		});
		$('.myBookmark_dis').on('click', function() {
			$('.myBookmark').hide();
			$('html body').css('overflow', 'auto');
		});
	});
	/* 내가쓴글,북마크 제이쿼리 끝 */
	/* 회원탈퇴 */
	function del() {
		var con = confirm("정말로 탈퇴하시겠습니까?")
		if (con) {
			location.href = "/moyac/views/myPage/delete.do"
		} else
			alert("삭제가 취소되었습니다.")
	}
	/* 회원탈퇴 끝 */
</script>
</head>
<body>
	<div class="myPage">
		<a href="/moyac/views/myPage/updateForm.do"><img src="/moyac/images/update_member.png" title="회원정보수정" class="only_image"></a>
		<a id="myBookmark"><img src="/moyac/images/bookmark.png" title="즐겨찾기" class="only_image"  style="cursor:pointer;"></a>
		<a id="myWrite"><img src="/moyac/images/write.png" title="내가쓴글" class="only_image"  style="cursor:pointer;"></a>
		<!-- <button class="myPage_Button" onclick="location.href='/moyac/views/myPage/updateForm.do'">회원정보수정</button> -->
		<!-- <button class="myPage_Button" id="myBookmark">즐겨찾기</button>
		<button class="myPage_Button" id="myWrite">내가 쓴 글</button> -->
	</div>
	<div class="del_btn">
	<button onclick="return del()" class="btn btn-primary font_family">회원탈퇴</button>
	</div>
	<!-- 내가 쓴글 구현 -->
	<div class="myWrite" style="display: none;">
		<div class="myWrite_dis"></div>
		<div class="myWrite_content scroll-container">
			<!-- 내가 쓴글 - QnA게시판 -->
			<h2>내가 쓴 글</h2>
			<h4>QnA 게시판</h4>
			<h5>작성한 QnA ${total}개</h5>
			<div style="width: 420px; height: 200px; overflow: scroll;">
				<table border="1" style="width: 400px;">
					<tr>
						<th>제목</th>
						<th>내용</th>
						<th>작성일자</th>
						<th>조회수</th>
						<th>좋아요</th>
					</tr>
					<c:if test="${list.size() == 0 }">
						<tr>
							<th colspan="5">작성한 QnA가 없습니다</th>
						</tr>
					</c:if>
					<c:if test="${list.size() != 0 }">
						<c:forEach var="board_QnA" items="${list}">
							<tr>
								<td>${board_QnA.subject }</td>
								<td><a href='/moyac/views/board_QnA/content.do?boardno=${board_QnA.boardno}'>${board_QnA.subject }</a></td>
								<td>${board_QnA.reg_date }</td>
								<td>${board_QnA.read_cnt }</td>
								<td>${board_QnA.likes }</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
			<!-- 내가 쓴글 - event게시판 -->
			<h4>이벤트 게시판</h4>
			<h5>작성한 이벤트 댓글 ${total1}개</h5>
			<div style="width: 320px; height: 200px; overflow: scroll;">
				<table border="1" style="width: 300px;">
					<tr>
						<th>내용</th>
						<th>작성일자</th>
						<th>추천</th>
					</tr>
					<c:if test="${list1.size() == 0 }">
						<tr>
							<th colspan="4">작성한 댓글이 없습니다</th>
						</tr>
					</c:if>
					<c:if test="${list1.size() != 0 }">
						<c:forEach var="reply_event" items="${list1}">
							<tr onclick="location.href='/moyac/views/board_event/content.do?boardno=${reply_event.boardno}'">
								<td>${reply_event.content }</td>
								<td>${reply_event.reg_date }</td>
								<td>${reply_event.likes }</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
		</div>
	</div>
	<!-- 내가 쓴글 구현 끝-->
	<!-- 	북마크 목록 조회 시작 -->
	<div class="myBookmark" style="display: none;">
		<div class="myBookmark_dis"></div>
		<div class="myBookmark_content scroll-container">
		<h2>북마크 ${total2 }개</h2>
			<div>
				<c:if test="${list2.size() == 0 }">
					<div>
					즐겨찾기한 약품이 없습니다
					</div>
				</c:if>
				<c:if test="${list2.size() != 0 }">
					<c:forEach var="bookmark" items="${list2}">
						<div class="one"><a href='/moyac/views/medicine/medicine_info.do?me_no=${bookmark.me_no}&bookmarkConfirm=1'>
						<div>${bookmark.me_pic }</div>
						<div>${bookmark.me_name }</div>
						</a></div>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>