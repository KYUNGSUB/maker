<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파라미터 정보 수정</title>
<link rel="stylesheet" href="<c:url value="/resources/css/common/common.css"/>"/>
<script type="text/javascript" src="<c:url value="/resources/js/jquery/jquery-1.11.3.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/parameter/modify.js"/>"></script>
</head>
<body>
<header>
	<jsp:include page="../common/header.jsp" flush="false"></jsp:include>
</header>
<section id="wrap">
	<h2>파라미터 정보 수정</h2>
	<br>
	<form role="form" action="modify" method="post">
		<input type="hidden" name="page" value="${cri.page}">
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
		<table>
			<tr>
				<td><label for="parameterName">파라미터 이름</label>
				<td><input type="text" id="parameterName" name="parameterName" readonly="readonly" value="${settingItem.parameterName}">
			<tr>
				<td><label for="value">파라미터 값</label>
				<td><input type="text" id="value" name="value" value="${settingItem.value}">
		</table>
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