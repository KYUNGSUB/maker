<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 정보 수정</title>
<link rel="stylesheet" href="<c:url value="/resources/css/common/common.css"/>"/>
<style>
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
	<h2>게시판 정보 수정</h2>
	<br>
	<form role="form" action="modify" method="post">
		<input type="hidden" name="board_id" value="${boardVO.board_id}">
		<input type="hidden" name="page" value="${cri.page}">
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
		<div style="padding: 10px 0">
			<label for="board_id">게시판 번호</label><br>
			<input type="text" id="board_id" name="board_id" readonly="readonly" value="${boardVO.board_id}"><br>
		</div>
		<div style="padding: 10px 0">
			<label for="board_name">게시판 이름</label><br>
			<input type="text" id="board_name" name="board_name" value="${boardVO.board_name}"><br>
		</div>
		<div style="padding: 10px 0">
			<label for="ir1">게시판 유형</label><br>
			<select name="board_type">
				<c:choose>
					<c:when test="${board.type=='기본'}">
						<option value="기본" selected>기본</option>
					</c:when>
					<c:otherwise>
						<option value="기본">기본</option>
					</c:otherwise>
					</c:choose>
					<c:choose>
					<c:when test="${board.type=='Q&A'}">
						<option value="Q&A" selected>Q&#38A</option>
					</c:when>
					<c:otherwise>
						<option value="Q&A">Q&#38A</option>
					</c:otherwise>
					</c:choose>
					<c:choose>
					<c:when test="${board.type=='이미지'}">
						<option value="이미지" selected>이미지</option>
					</c:when>
					<c:otherwise>
						<option value="이미지">이미지</option>
					</c:otherwise>
					</c:choose>
					<c:choose>
					<c:when test="${board.type=='공지사항'}">
						<option value="공지사항" selected>공지사항</option>
					</c:when>
					<c:otherwise>
						<option value="공지사항">공지사항</option>
					</c:otherwise>
					</c:choose>
					<c:choose>
					<c:when test="${board.type=='자료실'}">
						<option value="자료실" selected>자료실</option>
					</c:when>
					<c:otherwise>
						<option value="자료실">자료실</option>
					</c:otherwise>
					</c:choose>
					<c:choose>
					<c:when test="${board.type=='방명록'}">
						<option value="방명록" selected>방명록</option>
					</c:when>
					<c:otherwise>
						<option value="방명록">방명록</option>
					</c:otherwise>
					</c:choose>
				</select>
		</div>
		<div style="padding: 10px 0">
			<label for="url">url</label><br>
			<input type="text" name="url" id="url" value="${boardVO.url}"><br>
		</div>
		<div style="padding: 10px 0">
			<label for="secret">비밀글 허용 여부</label><br>
			<c:choose>
			<c:when test="${boardVO.secret=='T'}">
				<input type="radio" name="secret" value="T" checked="checked">&nbsp;감추기&nbsp;&nbsp;&nbsp;
				<input type="radio" name="secret" value="F" >&nbsp;보여주기<br>
			</c:when>
			<c:otherwise>
				<input type="radio" name="secret" value="T">&nbsp;감추기&nbsp;&nbsp;&nbsp;
				<input type="radio" name="secret" value="F" checked="checked">&nbsp;보여주기<br>
			</c:otherwise>
			</c:choose>
		</div>
		<div style="padding: 10px 0">
			<label for="read_allow">읽기 권한</label><br>
			<select name="read_allow">
				<c:choose>
				<c:when test="${boardVO.read_allow=='all'}">
					<option value="all" selected>모두</option>
				</c:when>
				<c:otherwise>
					<option value="all">모두</option>
				</c:otherwise>
				</c:choose>
				<c:choose>
				<c:when test="${boardVO.read_allow=='login'}">
					<option value="login" selected>로그인 후</option>
				</c:when>
				<c:otherwise>
					<option value="login">로그인 후</option>
				</c:otherwise>
				</c:choose>
				<c:choose>
				<c:when test="${boardVO.read_allow=='customer'}">
					<option value="customer" selected>고객</option>
				</c:when>
				<c:otherwise>
					<option value="customer">고객</option>
				</c:otherwise>
				</c:choose>
				<c:choose>
				<c:when test="${boardVO.read_allow=='business'}">
					<option value="business" selected>상인</option>
				</c:when>
				<c:otherwise>
					<option value="business">상인</option>
				</c:otherwise>
				</c:choose>
				<c:choose>
				<c:when test="${boardVO.read_allow=='admin'}">
					<option value="admin" selected>관리자</option>
				</c:when>
				<c:otherwise>
					<option value="admin">관리자</option>
				</c:otherwise>
				</c:choose>
			</select>
		</div>
		<div style="padding: 10px 0">
			<label for="write_allow">쓰기 권한</label><br>
			<select name="write_allow">
				<c:choose>
				<c:when test="${boardVO.write_allow=='all'}">
					<option value="all" selected>모두</option>
				</c:when>
				<c:otherwise>
					<option value="all">모두</option>
				</c:otherwise>
				</c:choose>
				<c:choose>
				<c:when test="${boardVO.write_allow=='login'}">
					<option value="login" selected>로그인 후</option>
				</c:when>
				<c:otherwise>
					<option value="login">로그인 후</option>
				</c:otherwise>
				</c:choose>
				<c:choose>
				<c:when test="${boardVO.write_allow=='customer'}">
					<option value="customer" selected>고객</option>
				</c:when>
				<c:otherwise>
					<option value="customer">고객</option>
				</c:otherwise>
				</c:choose>
				<c:choose>
				<c:when test="${boardVO.write_allow=='business'}">
					<option value="business" selected>상인</option>
				</c:when>
				<c:otherwise>
					<option value="business">상인</option>
				</c:otherwise>
				</c:choose>
				<c:choose>
				<c:when test="${boardVO.write_allow=='admin'}">
					<option value="admin" selected>관리자</option>
				</c:when>
				<c:otherwise>
					<option value="admin">관리자</option>
				</c:otherwise>
				</c:choose>
			</select>
		</div>
		<div style="padding: 10px 0">
			<label for="reply">댓글 쓰기 권한</label><br>
			<select name="reply">
				<c:choose>
				<c:when test="${boardVO.reply=='not'}">
					<option value="not" selected>비허용</option>
				</c:when>
				<c:otherwise>
					<option value="not">비허용</option>
				</c:otherwise>
				</c:choose>
				<c:choose>
				<c:when test="${boardVO.reply=='all'}">
					<option value="all" selected>모두</option>
				</c:when>
				<c:otherwise>
					<option value="all">모두</option>
				</c:otherwise>
				</c:choose>
				<c:choose>
				<c:when test="${boardVO.reply=='login'}">
					<option value="login" selected>로그인 후</option>
				</c:when>
				<c:otherwise>
					<option value="login">로그인 후</option>
				</c:otherwise>
				</c:choose>
				<c:choose>
				<c:when test="${boardVO.reply=='customer'}">
					<option value="customer" selected>고객</option>
				</c:when>
				<c:otherwise>
					<option value="customer">고객</option>
				</c:otherwise>
				</c:choose>
				<c:choose>
				<c:when test="${boardVO.reply=='business'}">
					<option value="business" selected>상인</option>
				</c:when>
				<c:otherwise>
					<option value="business">상인</option>
				</c:otherwise>
				</c:choose>
				<c:choose>
				<c:when test="${boardVO.reply=='admin'}">
					<option value="admin" selected>관리자</option>
				</c:when>
				<c:otherwise>
					<option value="admin">관리자</option>
				</c:otherwise>
				</c:choose>
			</select>
		</div>
		<div style="padding: 10px 0">
			<label for="modify">수정 권한</label><br>
			<select name="modify">
				<c:choose>
				<c:when test="${boardVOㄴ.modify=='writer'}">
					<option value="writer" selected>작성자</option>
				</c:when>
				<c:otherwise>
					<option value="writer">작성자</option>
				</c:otherwise>
				</c:choose>
				<c:choose>
				<c:when test="${boardVO.modify=='admin'}">
					<option value="admin" selected>관리자</option>
				</c:when>
				<c:otherwise>
					<option value="admin">관리자</option>
				</c:otherwise>
				</c:choose>
			</select>
		</div>
		<div style="padding: 10px 0">
			<label for="remove">삭제 권한</label><br>
			<select name="remove">
				<c:choose>
				<c:when test="${boardVO.remove=='writer'}">
					<option value="writer" selected>작성자</option>
				</c:when>
				<c:otherwise>
					<option value="writer">작성자</option>
				</c:otherwise>
				</c:choose>
				<c:choose>
				<c:when test="${boardVO.remove=='admin'}">
					<option value="admin" selected>관리자</option>
				</c:when>
				<c:otherwise>
					<option value="admin">관리자</option>
				</c:otherwise>
				</c:choose>
			</select>
		</div>
		<div style="padding: 10px 0">
			<label for="download">다운로드 권한</label><br>
			<select name="download">
				<c:choose>
				<c:when test="${boardVO.download=='not'}">
					<option value="not" selected>비허용</option>
				</c:when>
				<c:otherwise>
					<option value="not">비허용</option>
				</c:otherwise>
				</c:choose>
				<c:choose>
				<c:when test="${boardVO.download=='all'}">
					<option value="all" selected>모두</option>
				</c:when>
				<c:otherwise>
					<option value="all">모두</option>
				</c:otherwise>
				</c:choose>
				<c:choose>
				<c:when test="${boardVO.download=='login'}">
					<option value="login" selected>로그인 후</option>
				</c:when>
				<c:otherwise>
					<option value="login">로그인 후</option>
				</c:otherwise>
				</c:choose>
				<c:choose>
				<c:when test="${boardVO.download=='customer'}">
					<option value="customer" selected>고객</option>
				</c:when>
				<c:otherwise>
					<option value="customer">고객</option>
				</c:otherwise>
				</c:choose>
				<c:choose>
				<c:when test="${boboardVOard.download=='business'}">
					<option value="business" selected>상인</option>
				</c:when>
				<c:otherwise>
					<option value="business">상인</option>
				</c:otherwise>
				</c:choose>
				<c:choose>
				<c:when test="${boardVO.download=='admin'}">
					<option value="admin" selected>관리자</option>
				</c:when>
				<c:otherwise>
					<option value="admin">관리자</option>
				</c:otherwise>
				</c:choose>
			</select>
		</div>
		<div style="padding: 10px 0">
			<label for="upload">업로드 권한</label><br>
			<select name="upload">
				<c:choose>
				<c:when test="${boardVO.upload=='not'}">
					<option value="not" selected>비허용</option>
				</c:when>
				<c:otherwise>
					<option value="not">비허용</option>
				</c:otherwise>
				</c:choose>
				<c:choose>
				<c:when test="${boardVO.upload=='all'}">
					<option value="all" selected>모두</option>
				</c:when>
				<c:otherwise>
					<option value="all">모두</option>
				</c:otherwise>
				</c:choose>
				<c:choose>
				<c:when test="${boardVO.upload=='login'}">
					<option value="login" selected>로그인 후</option>
				</c:when>
				<c:otherwise>
					<option value="login">로그인 후</option>
				</c:otherwise>
				</c:choose>
				<c:choose>
				<c:when test="${boardVO.upload=='customer'}">
					<option value="customer" selected>고객</option>
				</c:when>
				<c:otherwise>
					<option value="customer">고객</option>
				</c:otherwise>
				</c:choose>
				<c:choose>
				<c:when test="${boardVO.upload=='business'}">
					<option value="business" selected>상인</option>
				</c:when>
				<c:otherwise>
					<option value="business">상인</option>
				</c:otherwise>
				</c:choose>
				<c:choose>
				<c:when test="${boardVO.upload=='admin'}">
					<option value="admin" selected>관리자</option>
				</c:when>
				<c:otherwise>
					<option value="admin">관리자</option>
				</c:otherwise>
				</c:choose>
			</select>
		</div>
		<div style="padding: 10px 0">
			<label for="nAttach">첨부 파일 수</label><br>
			<input type="number" name="nAttach" min="0" max="5" value="${boardVO.nAttach}">
		</div>
		<div style="padding: 10px 0">
			<label for="aSize">첨부 파일 크기제한(한 개)</label><br>
			<select name="aSize">
				<c:choose>
				<c:when test="${boardVO.aSize=='0'}">
					<option value="0" selected>0</option>
				</c:when>
				<c:otherwise>
					<option value="0">0</option>
				</c:otherwise>
				</c:choose>
				<c:choose>
				<c:when test="${boardVO.aSize=='50KB'}">
					<option value="50KB" selected>50KB</option>
				</c:when>
				<c:otherwise>
					<option value="50KB">50KB</option>
				</c:otherwise>
				</c:choose>
				<c:choose>
				<c:when test="${boardVO.aSize=='200KB'}">
					<option value="200KB" selected>200KB</option>
				</c:when>
				<c:otherwise>
					<option value="200KB">200KB</option>
				</c:otherwise>
				</c:choose>
				<c:choose>
				<c:when test="${boardVO.aSize=='1MB'}">
					<option value="1MB" selected>1MB</option>
				</c:when>
				<c:otherwise>
					<option value="1MB">1MB</option>
				</c:otherwise>
				</c:choose>
				<c:choose>
				<c:when test="${boardVO.aSize=='10MB'}">
					<option value="10MB" selected>10MB</option>
				</c:when>
				<c:otherwise>
					<option value="10MB">10MB</option>
				</c:otherwise>
				</c:choose>
				<c:choose>
				<c:when test="${boardVO.aSize=='100MB'}">
					<option value="100MB" selected>100MB</option>
				</c:when>
				<c:otherwise>
					<option value="100MB">100MB</option>
				</c:otherwise>
				</c:choose>
			</select>
		</div>
		<div style="padding: 10px 0">
			<label for="display_format">내용 표시 형식</label><br>
			<select name="display_format">
				<c:choose>
				<c:when test="${boardVO.display_format=='1'}">
					<option value="1" selected>제목만 표시</option>
				</c:when>
				<c:otherwise>
					<option value="1">제목만 표시</option>
				</c:otherwise>
				</c:choose>
				<c:choose>
				<c:when test="${boardVO.display_format=='2'}">
					<option value="2" selected>내용 일부 표시</option>
				</c:when>
				<c:otherwise>
					<option value="2">내용 일부 표시</option>
				</c:otherwise>
				</c:choose>
				<c:choose>
				<c:when test="${boardVO.display_format=='3'}">
					<option value="3" selected>내용 전부 표시</option>
				</c:when>
				<c:otherwise>
					<option value="3">내용 전부 표시</option>
				</c:otherwise>
				</c:choose>
			</select>
		</div>
		<div style="padding: 10px 0">
			<label for="board_desc">게시판 설명</label><br>
			<textarea name="board_desc" cols="80" rows="5">${boardVO.board_desc}</textarea>
		</div>
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