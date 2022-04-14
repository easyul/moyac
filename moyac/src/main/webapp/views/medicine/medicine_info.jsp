<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript">
function bookmarkClick(me_no) {
		// 약품 북마크 클릭
		$.post("/moyac/views/medicine/bookmark.do", "me_no="+me_no, function(data) {
			var imgSrc = data;
			$(".bookmark").attr("src", imgSrc);
		});
} 
function del(delMe_no) {
	var con = confirm("삭제처리 하시겠습니까?");
	if(con) {
		location.href="/moyac/views/medicine/delete.do?pageNum=${currentPage}&me_no="+delMe_no;
	}
}
</script>
</head>
<body>
<div align="center">
	<table border="1">
		<caption>${medicine.me_pic}</caption>
		<caption>${medicine.me_name } 상세 정보</caption>
		<!-- 북마크 -->
		<img class="bookmark" onclick="bookmarkClick(${medicine.me_no})" alt="북마크" src="${imgSrc}" width="2%">
		<!-- 북마크 끝 -->
		<tr><th width="100">이름</th><td>${medicine.me_name }</td></tr>
		<tr><th>색상</th><td>${medicine.me_color}</td></tr>
		<tr><th>모양</th><td>${medicine.me_shape}</td></tr>
		<tr><th>제형</th><td>${medicine.me_formulation}</td></tr>
		<tr><th>효과</th><td>${medicine.me_effect}</td></tr>
		<tr><th>용량</th><td>${medicine.me_capacity}</td></tr>
		<tr><th>판매사</th><td>${medicine.me_sales}</td></tr>
	</table>
	<c:if test="${empty bookmarkConfirm && empty adminConfirm}"><!-- 북마크, 관리자 페이지에서 들어가면 보이지 않게 -->
			<c:if test="${not empty search}">
				<button onclick="location.href='/moyac/views/search/search.do?pageNum=${pageNum }&search=${search}'">목록</button>
			</c:if>
			<c:if test="${empty search}">
				<button onclick="location.href='/moyac/views/search/filterSearch.do?pageNum=${pageNum }&color=${color}&shape=${shape }&formulation=${formulation }'">목록</button>
			</c:if>
	</c:if>
	<c:if test="${not empty adminConfirm}">
		<button onclick="location.href='/moyac/views/admin/adminMedicine.do?pageNum=${pageNum }'">목록</button>
	</c:if>
	<c:if test="${id == 'admin'}">
		<button onclick="del('${medicine.me_no}')">삭제</button>
	</c:if>
</div>
</body>
</html>