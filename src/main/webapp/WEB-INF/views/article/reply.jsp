<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/css/common/common.css"/>"/>
<style type="text/css">
table {
	width: 100%;
}
</style>
<script type="text/javascript" src="<c:url value="/resources/js/jquery/jquery-1.11.3.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/smarteditor/js/HuskyEZCreator.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/article/reply.js"/>"></script>
</head>
<body>
<header>
	<jsp:include page="../common/header.jsp" flush="false"></jsp:include>
</header>
<section id="wrap">
	<h2>답변 쓰기</h2>
	<br>
	<form id="replyForm" action="reply" method="post">
		<input type="hidden" name="board_id" value="${articleVO.board_id}">
		<input type="hidden" name="bId" value="${articleVO.bId}">
		<input type="hidden" name="bGroup" value="${articleVO.bGroup}">
		<input type="hidden" name="bStep" value="${articleVO.bStep}">
		<input type="hidden" name="bIndent" value="${articleVO.bIndent}">
		<table width="500" cellpadding="0" cellspacing="0" border="1">
			<tr>
				<td> 번호 </td>
				<td> ${articleVO.bId} </td>
			</tr>
			<tr>
				<td> 히트 </td>
				<td> ${articleVO.bHit} </td>
			</tr>
			<tr>
				<td> 이름 </td>
				<td> <input type="text" name="bName" value="${articleVO.bName}"></td>
			</tr>
			<tr>
				<td> 제목 </td>
				<td> <input type="text" name="bTitle" value="${articleVO.bTitle}"></td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;
			<tr>
				<td> 내용 </td>
				<td><textarea id="ir1" rows="10" cols="120" name="bContent">${articleVO.bContent}</textarea>
			</tr>
			<tr>
				<td style="width: 10%"><label for="bSecret">비밀글 여부</label></td>
				<td style="width: 90%"><input type="radio" name="bSecret" value="T">&nbsp;감추기&nbsp;&nbsp;&nbsp;
					<input type="radio" name="bSecret" value="F" checked="checked">&nbsp;보여주기</td>
			<tr>
				<td colspan="2">&nbsp;
			<tr >
				<td colspan="2"><input type="submit" value="답변"> <a href="list">목록</a></td>
			</tr>
		</table>
	</form>
</section>
<footer>
	<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>
</footer>
</body>
</html>