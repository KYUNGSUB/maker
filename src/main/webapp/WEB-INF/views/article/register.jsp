<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 쓰기</title>
<link rel="stylesheet" href="<c:url value="/resources/css/common/common.css"/>"/>
<style>
table {
	width: 100%;
}
.fileDrop {
	width: 80%;
	height: 100px;
	border: 1px dotted gray;
	background-color: lightslategrey;
	margin: auto;
}
small {
	margin-left: 3px;
	font-weight: bold;
	color: gray;
}
ul, li {
	list-style: none;
}
li {
	float: left;
	padding : 5px;
}
</style>
<script type="text/javascript" src="<c:url value="/resources/js/jquery/jquery-1.11.3.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/smarteditor/js/HuskyEZCreator.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/article/upload.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/article/register.js"/>"></script>
</head>
<body>
<header>
	<jsp:include page="../common/header.jsp" flush="false"></jsp:include>
</header>
<section id="wrap">
	<h2>게시글 쓰기</h2>
	<br>
	<form id='registerForm' role="form" method="post">
		<input type="hidden" name="board_id" value="${param.board_id}">
		<table>
			<tr>
				<td style="width: 10%"><label for="title">제목</label>
				<td style="width: 90%"><input type="text" name="bTitle" placeholder="제목 입력" required>
			<tr>
				<td style="width: 10%"><label for="ir1">내용</label>
				<td style="width: 90%"><textarea id="ir1" rows="20" cols="132" name="bContent"></textarea>
			<tr>
				<td style="width: 10%"><label for="bSecret">비밀글 여부</label></td>
				<td style="width: 90%"><input type="radio" name="bSecret" value="T">&nbsp;감추기&nbsp;&nbsp;&nbsp;
					<input type="radio" name="bSecret" value="F" checked="checked">&nbsp;보여주기</td>
			<tr>
				<td style="width: 10%"><label for="writer">작성자</label>
				<td style="width: 90%"><input type="text" name="bName" value="${member.id}" readonly>
			<tr>
				<td colspan="2">&nbsp;
			<tr>
				<td colspan="2"><div class="fileDrop"></div>
			<tr>
				<td colspan="2"><ul class="uploadedList"></ul>
			<tr>
				<td colspan="2">&nbsp;
			<tr>
				<td colspan="2"><input type="submit" value="게시글 쓰기">
		</table>
	</form>
</section>
<footer>
	<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>
</footer>
</body>
</html>