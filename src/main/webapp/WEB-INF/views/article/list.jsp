<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 목록 보기</title>
<link rel="stylesheet" href="<c:url value="/resources/css/common/common.css"/>"/>
<link rel="stylesheet" href="<c:url value="/resources/css/board/list_board.css"/>"/>
<script type="text/javascript" src="<c:url value="/resources/js/jquery/jquery-1.11.3.min.js"/>"></script>
</head>
<body>
<header>
	<jsp:include page="../common/header.jsp" flush="false"></jsp:include>
</header>
<section id="wrap">
	<h2>게시글 목록 보기 : ${param.board_id}</h2>
	<br>
	<select name="searchType">
		<option value="n"
			<c:out value="${cri.searchType == null ? 'selected' : ''}"/>>
			---</option>
		<option value="t"
			<c:out value="${cri.searchType eq 't' ? 'selected' : ''}"/>>
			Title</option>
		<option value="c"
			<c:out value="${cri.searchType eq 'c' ? 'selected' : ''}"/>>
			Content</option>
		<option value="w"
			<c:out value="${cri.searchType eq 'w' ? 'selected' : ''}"/>>
			Writer</option>
		<option value="tc"
			<c:out value="${cri.searchType eq 'tc' ? 'selected' : ''}"/>>
			Title OR Content</option>
		<option value="cw"
			<c:out value="${cri.searchType eq 'cw' ? 'selected' : ''}"/>>
			Content OR Writer</option>
		<option value="tcw"
			<c:out value="${cri.searchType eq 'tcw' ? 'selected' : ''}"/>>
			Title OR Content OR Writer</option>
	</select>
	<input type="text" name="keyword" id="keyword" value="${cri.keyword}">
	<button id="searchBtn">검색</button>
	<button id="newBtn">글쓰기</button>
	<br><br>
	<table>
		<tr>
			<th style="width: 8%">번호
			<th>제목
			<th>작성자
			<th>게시판 ID
			<th>작성일
			<th>수정일
			<th style="width: 10%">조회수
	<c:forEach items="${list}" var="articleVO">
		<tr>
			<td>${articleVO.bId}
			<td><a href='<c:url value="/article/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bId=${articleVO.bId}"/>'>${articleVO.bTitle}</a>
			<td>${articleVO.bName}
			<td>${articleVO.board_id}
			<td><fmt:formatDate value="${articleVO.bCreatedAt}" pattern="yyyy-MM-dd HH:mm"/>
			<td><fmt:formatDate value="${articleVO.bModifiedAt}" pattern="yyyy-MM-dd HH:mm"/>
			<td><span>${articleVO.bHit}</span>
	</c:forEach>
	</table>
	<br>
	<div id="pArea" style="height:30px; margin-left: 200px;">
		<ul>
			<c:if test="${pageMaker.prev}">
				<li class="paging"><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}&board_id=${param.board_id}">&laquo;</a>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<li class="paging"
					<c:out value="${pageMaker.cri.page == idx? 'class=active':''}"/>>
					<a href="list${pageMaker.makeSearch(idx)}&board_id=${param.board_id}">${idx}</a>
				</li>
			</c:forEach>
			
			<c:if test="${pageMaker.next}">
				<li class="paging"><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}&board_id=${param.board_id}">&raquo;</a>
			</c:if>
		</ul>
	</div>
</section>
<%--
<script type="text/javascript" src="<c:url value="/resources/js/article/list.js"/>"></script>
 --%>
<script type="text/javascript">
$(document).ready(function() {
	var result = '${msg}';
	if(result == 'success') {
		alert("처리가 완료되었습니다.");
	}
	
	$("#searchBtn").on("click", function() {
		var type = $("select[name=searchType]");
		self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType="
			+ $("select[name=searchType]").val() + "&keyword=" + encodeURIComponent($("#keyword").val());
	});
	
	$("#newBtn").on("click", function() {
		self.location = "register?board_id=${pageMaker.getCri().getBoard_id()}";
	});
});
</script>
<footer>
	<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>
</footer>
</body>
</html>