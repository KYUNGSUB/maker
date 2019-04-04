<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파라미터 등록</title>
<link rel="stylesheet" href="<c:url value="/resources/css/common/common.css"/>"/>
<link rel="stylesheet" href="<c:url value="/resources/css/board/create_board.css"/>"/>
<style>
table {
	width: 100%;
}
</style>
<script type="text/javascript" src="<c:url value="/resources/js/jquery/jquery-1.11.3.min.js"/>"></script>
</head>
<body>
<header>
	<jsp:include page="../common/header.jsp" flush="false"></jsp:include>
</header>
<section id="wrap">
	<h2>파라미터 등록</h2>
	<br>
	<form id='registerForm' action="register" role="form" method="post">
		<table>
			<tr>
				<td>파라미터 이름
				<td><input type="text" name="parameterName" size="80"/>
			<tr>
				<td>파라미터 값
				<td><input type="text" name="value" size="80"/>
			<tr>
				<td colspan="2"><input type="submit" value="파라미터 등록">
		</table>
	</form>
</section>
<footer>
	<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>
</footer>
</body>
</html>