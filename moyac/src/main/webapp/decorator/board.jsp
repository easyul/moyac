<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="deco" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
	integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc"
	crossorigin="anonymous">
<link href="../../css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../../css/main_navi.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.js"></script>
<deco:head></deco:head>
<style type="text/css">
.container {
	display: flex;
	 margin-left: 50px;
	 padding: 0;
	 margin-bottom: -50px;
}
.current{
	background: #ededed;
	color: #222;
}
/* .container > a {
 text-decoration-line: none;
 color: gray;
 font-size: 50px;
 margin-right: 30px;
} */
.clear { clear:both;}
a.on{color:red;}
</style>
<script type="text/javascript">
/* 	$(document).ready(function() {
		$('#a-1').click(function() {
			 $('a').removeClass('current'); 
			$(this).addClass('current');
		})
	}) */
	$(function click() {		
		$('a').click(function() {
			$('a').removeClass()
			$(this).addClass('on')
			
			var click_id = $(this).attr('id');
			$(click_id).appendTo(document.body);
		});

	});
	
</script>

</head>
<body>
<div class="navigationbar">
		<div class="dropdown">
			<button class="dropbtn">
				<span class="dropbtn_icon"><i class="fas fa-bars fa-2x"></i></span>
			</button>
			<div class="dropdown-content font_family">
				<c:if test="${empty id }">
					<div>
						<a href='/moyac/views/board_QnA/list.do'>QnA게시판</a> <a
							href='/moyac/views/board_event/list.do'>event게시판</a> <a
							href='/moyac/views/board_notice/list.do'>공지사항게시판</a>
					</div>
				</c:if>
				<c:if test="${not empty id}">
					<c:if test="${id != 'admin' }">
						<div>
							<a href='/moyac/views/board_QnA/list.do'>QnA게시판</a> <a
								href='/moyac/views/board_event/list.do'>event게시판</a> <a
								href='/moyac/views/board_notice/list.do'>공지사항게시판</a>
						</div>
					</c:if>
					<c:if test="${id == 'admin' }">
						<div>
							<a href='/moyac/views/admin/adminMember.do'>회원관리</a> <a
								href='/moyac/views/admin/adminBoard.do'>게시글관리</a> <a
								href='/moyac/views/admin/adminMedicine.do'>약품관리</a>
						</div>
					</c:if>
				</c:if>
			</div>
		</div>
		<div class="moyac_logo" align="center">
			<a href="/moyac/views/main/moyac_main.do"><img alt=""
				src="../../images/moyamoyac_logo.png" height="150" width="300"></a>
		</div>
		<div class='total font_family'>
			<c:if test="${empty id }">
				<div class='btn-group_btn font_family'>
					<button class="btn btn-primary font_family"
						onclick="location.href='/moyac/views/member/loginForm.do'">로그인</button>
					<button class="btn btn-primary font_family"
						onclick="location.href='/moyac/views/member/joinForm.do'">회원가입</button>
				</div>
			</c:if>
			<c:if test="${not empty id}">
				<c:if test="${id != 'admin' }">
					<div class="btn-group">
						<div class="welcome">${nick_name_session }님 환영합니다</div>
						<div class='btn-group_btn'>
							<button class="btn btn-primary font_family"
								onclick="location.href='/moyac/views/member/logout.do'">로그아웃</button>
							<button class="btn btn-primary font_family"
								onclick="location.href='/moyac/views/myPage/myPageForm.do'">마이페이지</button>
						</div>
					</div>
				</c:if>
				<c:if test="${id == 'admin' }">
					<div class="btn-group">
						<div class="welcome">관리자님 환영합니다</div>
						<div class='btn-group_btn'>
							<button class="btn btn-primary font_family"
								onclick="location.href='/moyac/views/member/logout.do'">로그아웃</button>
						</div>
					</div>
				</c:if>
			</c:if>
		</div>
	</div>	
<div class="container">
${click_id}
		<a href="/moyac/views/board_notice/list.do?click_id=${click_id}" onclick="click()" id="a-1" class="az">공지사항</a>
		<a href="/moyac/views/board_event/list.do?click_id=${click_id}" id="a-2" class="az">이벤트게시판</a>
		<a href="/moyac/views/board_QnA/list.do?click_id=${click_id}" id="a-3" class="az">QnA게시판</a>
</div>
<deco:body></deco:body>
</body>
</html>