<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 수정</title>
<link rel="stylesheet" href="<c:url value="/resources/css/common/common.css"/>"/>
<style>
.fileDrop {
  width: 80%;
  height: 100px;
  border: 1px dotted gray;
  background-color: lightslategrey;
  margin: auto;
}
ul, li {
	list-style: none;
}
.paging {
	float: left;
	padding : 5px;
}
</style>
<script type="text/javascript" src="<c:url value="/resources/js/jquery/jquery-1.11.3.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/smarteditor/js/HuskyEZCreator.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/article/upload.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/article/modify.js"/>"></script>
</head>
<body>
<header>
	<jsp:include page="../common/header.jsp" flush="false"></jsp:include>
</header>
<section id="wrap">
	<h2>게시글 수정</h2>
	<br>
	<form role="form" action="modifyPage" method="post">
		<input type="hidden" name="board_id" value="${cri.board_id}">
		<input type="hidden" name="page" value="${cri.page}">
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
		<input type="hidden" name="searchType" value="${cri.searchType}">
		<input type="hidden" name="keyword" value="${cri.keyword}">
		<div style="padding: 10px 0">
			<label for="bId">번호</label><br>
			<input type="text" id="bId" name="bId" readonly="readonly" value="${articleVO.bId}"><br>
		</div>
		<div style="padding: 10px 0">
			<label for="bTitle">제목</label><br>
			<input type="text" id="bTitle" name="bTitle" value="${articleVO.bTitle}"><br>
		</div>
		<div style="padding: 10px 0">
			<label for="ir1">내용</label><br>
			<textarea id="ir1" rows="20" cols="132" name="bContent">${articleVO.bContent}</textarea>
		</div>
		<div style="padding: 10px 0">
			<label for="bName">작성자</label><br>
			<input type="text" name="bName" id="bName" value="${articleVO.bName}"><br>
		</div>
		<div class="fileDrop"></div>
		<ul class="uploadedList"></ul>
		<br style="clear: both">
		<br>
		<button type="submit" id="btn-save">저장</button>
		<button type="submit" id="btn-cancel">취소</button>
	</form>
</section>
<footer>
	<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>
</footer>
</body>
</html>