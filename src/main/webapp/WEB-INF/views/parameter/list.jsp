<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파라미터 목록 보기</title>
<link rel="stylesheet" href="<c:url value="/resources/css/common/common.css"/>"/>
<link rel="stylesheet" href="<c:url value="/resources/css/board/list_board.css"/>"/>
<script type="text/javascript" src="<c:url value="/resources/js/jquery/jquery-1.11.3.min.js"/>"></script>
</head>
<body>
<header>
	<jsp:include page="../common/header.jsp" flush="false"></jsp:include>
</header>
<section id="wrap">
	<h2>파라미터 목록 보기</h2>
	<br>
	<button id="newBtn">파라미터 등록</button>
	<br><br>
	<table>
		<tr>
			<th style="text-align: center" width="20%">파라미터 이름
			<th style="text-align: center" width="30%">파라미터 값
			<th style="text-align: center" width="25%">생성일
			<th style="text-align: center" width="25%">변경일
	<c:forEach items="${list}" var="paramter">
		<tr>
			<td style="padding: 0 0 0 10px;"><a href="<c:url value="/parameter/read${pageMaker.makeQuery(pageMaker.cri.page)}&parameterName=${paramter.parameterName}"/>">${paramter.parameterName}</a>
			<td style="padding: 0 0 0 10px;">${paramter.value}
			<td style="padding: 0 0 0 10px;"><fmt:formatDate value="${paramter.createdAt}" pattern="yyyy-MM-dd" />
			<td style="padding: 0 0 0 10px;"><fmt:formatDate value="${paramter.modifiedAt}" pattern="yyyy-MM-dd" />
	</c:forEach>
<%-- 		<tr>
			<td colspan="4">
				<a href="modify${pageMaker.makeQuery(pageMaker.cri.page)}&parameterName=${paramter.parameterName}">변경</a>&nbsp;
				<a href="remove${pageMaker.makeQuery(pageMaker.cri.page)}&parameterName=${paramter.parameterName}">삭제</a>
			</td> --%>
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