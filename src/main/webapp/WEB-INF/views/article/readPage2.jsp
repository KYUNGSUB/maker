<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 상세 보기</title>
<link rel="stylesheet" href="<c:url value="/resources/css/common/common.css"/>"/>
<style type="text/css">
ul, li {
	list-style: none;
}
.paging {
	float: left;
	padding : 5px;
}
</style>
<script type="text/javascript" src='<c:url value="/resources/js/jquery/jquery-1.11.3.min.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/js/article/read2.js"/>'></script>
</head>
<body>
<header>
	<jsp:include page="../common/header.jsp" flush="false"></jsp:include>
</header>
<section id="wrap">
	<h2>게시글 상세 보기</h2>
	<br>
	<div style="padding:10px 0">
		<label for="bTitle">제목</label><br>
		${articleVO.bTitle}
	</div>
	<div style="padding:10px 0">
		<label for="bContent">내용</label><br>
		${articleVO.bContent}
	</div> 
	<div style="padding:10px 0">
		<label for="bName">작성자</label><br>
		${articleVO.bName}
	</div>
	<div style="padding:10px 0">
		<label for="bHit">조회</label><br>
		${articleVO.bHit}
	</div>
	<div style="padding:10px 0">
		<label for="bName">좋아요</label><br>
		${articleVO.bLike}
	</div>
	<div style="padding:10px 0">
		<label for="bComment">댓글</label><br>
		${articleVO.bComment}
	</div>
	<div style="padding:10px 0">
		<label for="bCreatedAt">작성시간</label><br>
		<fmt:formatDate value="${articleVO.bCreatedAt}" pattern="yyyy-MM-dd HH:mm"/>
	</div>
	<div style="padding:10px 0">
		<label for="bModifiedAt">변경시간</label><br>
		<fmt:formatDate value="${articleVO.bModifiedAt}" pattern="yyyy-MM-dd HH:mm"/>
	</div>
	<ul class="uploadedList"></ul>
	<br style="clear: both">
	<form role="form" action="modifyPage" method="post">
		<input type="hidden" id="bId" name="bId" value="${articleVO.bId}">
		<input type="hidden" name="board_id" value="${cri.board_id}">
		<input type="hidden" name="page" value="${cri.page}">
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
		<input type="hidden" name="searchType" value="${cri.searchType}">
		<input type="hidden" name="keyword" value="${cri.keyword}">
		<br>
		<c:if test="${member.id == articleVO.bName}">
			<button type="submit" id="btn-modify">수정</button>
			<button type="submit" id="btn-remove">제거</button>
		</c:if>
		<button type="submit" id="btn-listAll">목록보기</button>
		<button type="submit" id="btn-reply">답변</button>
	</form>
</section>
<footer>
	<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>
</footer>
</body>
</html>