<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파라미터 정보 보기</title>
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
</head>
<body>
<header>
	<jsp:include page="../common/header.jsp" flush="false"></jsp:include>
</header>
<section id="wrap">
	<h2>파라미터 정보 보기</h2>
	<br>
	<table>
		<tr>
			<td><label for="parameterName">파라미터 이름</label>
			<td style="padding: 0 0 0 10px;">${settingItem.parameterName}
		<tr>
			<td><label for="value">파라미터 값</label>
			<td style="padding: 0 0 0 10px;">${settingItem.value}
		<tr>
			<td><label for="createdAt">생성일</label>
			<td style="padding: 0 0 0 10px;"><fmt:formatDate value="${settingItem.createdAt}" pattern="yyyy-MM-dd HH:mm"/>
		<tr>
			<td><label for="modifiedAt">변경일</label>
			<td style="padding: 0 0 0 10px;"><fmt:formatDate value="${settingItem.modifiedAt}" pattern="yyyy-MM-dd HH:mm"/>
		<tr>
			<td colspan="2">
				<a href="<c:url value="/parameter/modify?parameterName=${settingItem.parameterName}&page=${cri.page}"/>">수정하기</a>
				<a href="<c:url value="/parameter/remove?parameterName=${settingItem.parameterName}&page=${cri.page}"/>">삭제하기</a>
				<a href="<c:url value="/parameter/list?page=${cri.page}"/>">목록보기</a>
			</td>
		</tr>
	</table>
</section>
<footer>
	<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>
</footer>
</body>
</html>