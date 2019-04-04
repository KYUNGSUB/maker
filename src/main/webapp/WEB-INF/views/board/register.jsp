<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 만들기</title>
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
	<h2>게시판 만들기</h2>
	<br>
	<form id='registerForm' action="register" role="form" method="post">
		<table>
			<tr>
				<td>게시판 이름
				<td><input type="text" name="board_name" size="40"/>
			<tr>
				<td>게시판 유형
				<td><select name="board_type">
						<option value="기본">기본</option>
						<option value="Q&A">Q&amp;A</option>
						<option value="이미지">이미지</option>
						<option value="공지사항">공지사항</option>
						<option value="자료실">자료실</option>
						<option value="방명록">방명록</option>
					</select>
			<tr>
				<td>url
				<td><input type="text" name="url" size="80">
			<tr>
				<td>비밀글 허용여부
				<td><input type="radio" name="secret" value="T">&nbsp;감추기&nbsp;&nbsp;&nbsp;
						<input type="radio" name="secret" value="F" checked="checked">&nbsp;보여주기
			<tr>
				<td>읽기 권한
				<td><select name="read_allow">
						<option value="all">모두</option>
						<option value="login">로그인 후</option>
						<option value="customer">고객</option>
						<option value="business">상인</option>
						<option value="admin">관리자</option>
					</select>
			<tr>
				<td>쓰기 권한
				<td><select name="write_allow">
						<option value="all">모두</option>
						<option value="login">로그인 후</option>
						<option value="customer">고객</option>
						<option value="business">상인</option>
						<option value="admin">관리자</option>
					</select>
			<tr>
				<td>댓글 쓰기 권한
				<td><select name="reply">
						<option value="not">비허용</option>
						<option value="all">모두</option>
						<option value="login">로그인 후</option>
						<option value="customer">고객</option>
						<option value="business">상인</option>
						<option value="admin">관리자</option>
					</select>
			<tr>
				<td>수정 권한
				<td><select name="modify">
						<option value="writer">작성자</option>
						<option value="admin">관리자</option>
					</select>
			<tr>
				<td>삭제 권한
				<td><select name="remove">
						<option value="writer">작성자</option>
						<option value="admin">관리자</option>
					</select>
			<tr>
				<td>다운로드 권한
				<td><select name="download">
						<option value="not">비허용</option>
						<option value="all">모두</option>
						<option value="login">로그인 후</option>
						<option value="customer">고객</option>
						<option value="business">상인</option>
						<option value="admin">관리자</option>
					</select>
			<tr>
				<td>업로드 권한
				<td><select name="upload">
						<option value="not">비허용</option>
						<option value="all">모두</option>
						<option value="login">로그인 후</option>
						<option value="customer">고객</option>
						<option value="business">상인</option>
						<option value="admin">관리자</option>
					</select>
			<tr>
				<td>첨부 파일 수
				<td><input type="number" name="nAttach" min="0" max="5">
			<tr>
				<td>첨부 파일 크기제한(한 개)
				<td><select name="aSize">
						<option value="0">0</option>
						<option value="50KB">50KB</option>
						<option value="200KB">200KB</option>
						<option value="1MB">1MB</option>
						<option value="10MB">10MB</option>
						<option value="100MB">100MB</option>
					</select>
			<tr>
				<td>내용 표시 형식
				<td><select name="display_format">
						<option value="1">제목만 표시</option>
						<option value="2">내용 일부 표시</option>
						<option value="3">내용 전부 표시</option>
					</select>
			<tr>
				<td>게시판 설명
				<td><textarea name="board_desc" cols="80" rows="5"></textarea>
			<tr>
				<td colspan="2"><input type="submit" value="게시판 만들기">
		</table>
	</form>
</section>
<footer>
	<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>
</footer>
</body>
</html>