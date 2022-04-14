<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../sessionChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../../js/summernote/summernote-lite.js"></script>
<script src="../../js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="../../css/summernote/summernote-lite.css">
<style type="text/css">
.total_content {
	display: flax;
	justify-content: center;
	align-items: center;
	padding: 0 100px;
	width: 100%;
	margin-top: 50px;
}

h2 {
	margin: 0 0 -40px 100px;
}

.write_ok {
	margin: 10px;
}
.subject_css{
	width: 350px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$('#summernote').summernote({
			height : 400, // 에디터 높이
			minHeight : 400, // 최소 높이
			maxHeight : null, // 최대 높이
			focus : true, // 에디터 로딩후 포커스를 맞출지 여부
			lang : "ko-KR", // 한글 설정
			placeholder : '최대 2048자까지 쓸 수 있습니다', //placeholder 설정
			disableResizeEditor: true,	// 크기 조절 기능 삭제
		    toolbar: [
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		   		['color', ['forecolor','color']],
		   		//['table', ['table']],
		 	  	['para', ['ul', 'ol', 'paragraph']],
			  	['height', ['height']],
			    //['insert',['picture','link','video']],
			    ['view', ['fullscreen', 'help']]
			    ],
			fontNames: ['맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체','Arial', 'Arial Black', 'Comic Sans MS', 'Courier New'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
		});
	$('#summernote').summernote('fontName', '맑은 고딕');
	})	
</script>
</head>
<body>
	<h2>QnA 작성</h2>
	<div class="total_content">
		<form action="/moyac/views/board_QnA/write.do" method="post">
			<input type="hidden" name="boardno" value="${boardno }"> 
			<input type="hidden" name="id" value=${id }> 
			<input type="hidden" name="nick_name" value="${nick_name }"> 
			<input type="hidden" name="pageNum" value="${pageNum }"> 
			<input type="hidden" name="ref" value="${ref }"> 
			<input type="hidden" name="re_level" value="${re_level }"> 
			<input type="hidden" name="re_step" value="${re_step }"> 
			<input type="hidden" name="id" value="${id }">

			<c:if test="${boardno == 0 }">

				<div>제목</div>
				<div class="subject_css">
					<input class="form-control" type="text" name="subject"
						required="required" autofocus="autofocus">
				</div>

			</c:if>
			<c:if test="${boardno != 0 }">

				<div>제목</div>
				<div class="subject_css">${subject} =><input class="form-control" type="text" name="subject"
						required="required" autofocus="autofocus">
				</div>

			</c:if>
			<p>
			<div>질문</div>
			<div>
<!-- 				<textarea id="summernote" name="content"></textarea> -->
				<textarea class="form-control" rows="16" cols="40" name="content" required="required">${board_QnA.content }</textarea>

			</div>


			<div align="center" class="write_ok">
				<input class="btn btn-primary" type="submit" value="확인">
			</div>
		</form>
	</div>
</body>
</html>