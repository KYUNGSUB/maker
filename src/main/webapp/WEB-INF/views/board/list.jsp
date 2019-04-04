<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 목록 보기</title>
<link rel="stylesheet" href="<c:url value="/resources/css/common/common.css"/>"/>
<link rel="stylesheet" href="<c:url value="/resources/css/board/list_board.css"/>"/>
<script type="text/javascript" src="<c:url value="/resources/js/jquery/jquery-1.11.3.min.js"/>"></script>
</head>
<body>
<header>
	<jsp:include page="../common/header.jsp" flush="false"></jsp:include>
</header>
<section id="wrap">
	<h2>게시판 목록 보기</h2>
	<br>
	<button id="newBtn">게시판 만들기</button>
	<br><br>
	<table>
		<tr>
			<th style="text-align: center" width="6%">번호
			<th style="text-align: center" width="21%">게시판 이름
			<th style="text-align: center" width="13%">게시판 유형
			<th style="text-align: center" width="32%">URL
			<th style="text-align: center" width="17%">생성일
	<c:forEach items="${list}" var="boardVO">
		<tr>
			<td><a href="<c:url value="/board/read?board_id=${boardVO.board_id}"/>">${boardVO.board_id}</a>
			<td><a href="<c:url value="/article/list?board_id=${boardVO.board_id}"/>">${boardVO.board_name}</a>
			<td>${boardVO.board_type}
			<td>${boardVO.url}
			<td><fmt:formatDate value="${boardVO.createdAt}" pattern="yyyy-MM-dd" />
	</c:forEach>
	</table>
	<br>
	<div style="height:30px; margin-left:100px;">
		<ul>
			<c:if test="${pageMaker.prev}">
				<li class="paging"><a href="list${pageMaker.makeQuery(pageMaker.startPage - 1)}">&laquo;</a>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<li class="paging"
					<c:out value="${pageMaker.cri.page == idx? 'class=active':''}"/>>
					<a href="list${pageMaker.makeQuery(idx)}">${idx}</a>
				</li>
			</c:forEach>
			
			<c:if test="${pageMaker.next}">
				<li class="paging"><a href="list${pageMaker.makeQuery(pageMaker.endPage + 1)}">&raquo;</a>
			</c:if>
		</ul>
	</div>
</section>
<script type="text/javascript">
$(document).ready(function() {
	var result = '${msg}';
	if(result == 'success') {
		alert("처리가 완료되었습니다.");
	}

	$("#newBtn").on("click", function() {
		self.location = "register";
	});
});
</script>
<footer>
	<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>
</footer>
</body>
</html>