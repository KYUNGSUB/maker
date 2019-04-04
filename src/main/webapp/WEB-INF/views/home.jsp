<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>홈페이지</title>
<link rel="stylesheet" href="<c:url value="/resources/css/common/common.css"/>"/>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/jquery/jquery-1.11.3.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/jquery/jquery.cookie.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
});
function processLink() {
	var cookie = $.cookie('loginCookie');
	alert(cookie);
	var localCookie = localStorage.getItem("loginCookie");
	alert(localCookie);
	localCookie = sessionStorage.getItem("loginCookie");
	alert(localCookie);
}
</script>
</head>
<body>
<header>
	<jsp:include page="common/header.jsp" flush="false"></jsp:include>
</header>
<section id="wrap">
	<a href="javascript:processLink()">링크</a><br>
	<div id="area1">
		<a href="<c:url value="/resources/video/NCS기반 역량평가.zip"/>">NCS기반 역량평가</a><br>
		<a href="<c:url value="/resources/video/수업설계의 이해.zip"/>">수업설계의 이해</a><br>
		<a href="<c:url value="/resources/video/실습장 안전관리.zip"/>">실습장 안전관리</a><br>
		<a href="<c:url value="/resources/video/자격연수 교직훈련과정 강의노트.zip"/>">자격연수 교직훈련과정 강의노트</a><br>
		<a href="<c:url value="/resources/video/직업훈련교사의 책무와 역량.zip"/>">직업훈련교사의 책무와 역량</a><br>
		<a href="<c:url value="/resources/video/학습자이해와 능력개발.egg"/>">학습자이해와 능력개발</a><br>
	</div>
</section>
<footer>
	<jsp:include page="common/footer.jsp" flush="false"></jsp:include>
</footer>
</body>
</html>
