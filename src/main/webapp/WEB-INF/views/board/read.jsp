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
<link rel="stylesheet" href="<c:url value="/resources/css/board/list_board.css"/>"/>
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
</head>
<body>
<header>
	<jsp:include page="../common/header.jsp" flush="false"></jsp:include>
</header>
<section id="wrap">
	<h2>게시판 정보 보기</h2>
	<table>
		<tr>
			<td>번호</td>
			<td>${boardVO.board_id}</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${boardVO.board_name}</td>
		</tr>
		<tr>
			<td>유형</td>
			<td>${boardVO.board_type}</td>
		</tr>
		<tr>
			<td>URL</td>
			<td>${boardVO.url}</td>
		</tr>
		<tr>
			<td>비밀글 여부</td>
			<td>${boardVO.secret}</td>
		</tr>
		<tr>
			<td>읽기 허용 여부</td>
			<td>${boardVO.read_allow}</td>
		</tr>
		<tr>
			<td>쓰기 허용 여부</td>
			<td>${boardVO.write_allow}</td>
		</tr>
		<tr>
			<td>댓글 쓰기 허용</td>
			<td>${boardVO.reply}</td>
		</tr>
		<tr>
			<td>수정 허용 여부</td>
			<td>${boardVO.modify}</td>
		</tr>
		<tr>
			<td>삭제 허용 여부</td>
			<td>${boardVO.remove}</td>
		</tr>
		<tr>
			<td>다운로드 허용 여부</td>
			<td>${boardVO.download}</td>
		</tr>
		<tr>
			<td>첨부 허용여부</td>
			<td>${boardVO.upload}</td>
		</tr>
		<tr>
			<td>허용되는 첨부물의 수</td>
			<td>${boardVO.nAttach}</td>
		</tr>
		<tr>
			<td>첨부물 하나 크기 제한</td>
			<td>${boardVO.aSize}</td>
		</tr>
		<tr>
			<td>생성시간</td>
			<td><fmt:formatDate value="${boardVO.createdAt}"
					pattern="yyyy-MM-dd HH:mm" /></td>
		</tr>
		<tr>
			<td>내용 표시 형식</td>
			<c:choose>
			<c:when test="${boardVO.display_format==1}">
				<td>제목만 표시</td>
			</c:when>
			<c:when test="${boardVO.display_format==2}">
				<td>내용 일부 표시</td>
			</c:when>
			<c:when test="${boardVO.display_format==3}">
				<td>내용 전부 표시</td>
			</c:when>
			</c:choose>
		</tr>
		<tr>
			<td>설명</td>
			<td>${boardVO.board_desc}</td>
		</tr>
		<tr>
			<td colspan="2">
				<a href="<c:url value="/board/list?board_id=${boardVO.board_id}&p=1"/>">게시판 목록 보기</a>
				<a href="<c:url value="${boardVO.url}"/>">게시글 목록 보기</a>
				<a href="<c:url value="/board/modify?board_id=${boardVO.board_id}&p=${cri.page}"/>">수정하기</a>
				<a href="<c:url value="/board/remove?board_id=${boardVO.board_id}&p=${cri.page}"/>">삭제하기</a>
			</td>
		</tr>
	</table>
</section>
<footer>
	<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>
</footer>
</body>
</html>