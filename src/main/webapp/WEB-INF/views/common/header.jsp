<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sessionScope.id != null}">
	<script type="text/javascript" charset="utf-8">
		sessionStorage.setItem("id", "${sessionScope.id}");
		sessionStorage.setItem("kind", "${sessionScope.member.kind}");
	</script>
</c:if>
<c:if test="${sessionScope.id == null}">
	<script type="text/javascript" charset="utf-8" >
		sessionStorage.removeItem("id");
		sessionStorage.removeItem("kind");
	</script>
</c:if>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/header.css"/>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/jquery/jquery-1.11.3.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/jquery/jquery.cookie.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/common/header.js"></script>
<div id="logo">
	<a href="<c:url value='/'/>">
		<img alt="logo" src="${pageContext.request.contextPath}/resources/images/common/logo.png"/>
	</a>
</div>
<section id="hd_sec1">
	<div id="submenu">
		<a href="#openModal" class="sitem">Login</a>
		<a href="javascript:logout()" class="sitem">Logout</a>
		<a href="#termsModal" class="sitem">Join</a>
<c:if test="${sessionScope.member.kind == 3}">
		<a href="${pageContext.request.contextPath}/admin/main" class="sitem">MyPage</a>
</c:if>
<c:if test="${sessionScope.member.kind != 3}">
		<a href="javascript:getProfile()" class="sitem">MyPage</a>
</c:if>
		<a href="#">Contact</a>
		<a href="#">Sitemap</a>
	</div>
	<nav>
		<div id="gnbMenu">
			<ul id="gnb">
				<li class="item" id="item1">
					<a href="${pageContext.request.contextPath}/menu/m111" class="menu"><span></span>제공 서비스</a>
					<div class="sub" id="sub1">
						<ul>
							<li><a href="${pageContext.request.contextPath}/menu/m111">한국인이 좋아하는 명시</a></li>
							<li><a href="${pageContext.request.contextPath}/menu/m112">태교 육아 도우미</a></li>
							<li><a href="${pageContext.request.contextPath}/menu/m113">고전음악 듣기</a></li>
							<li><a href="${pageContext.request.contextPath}/menu/m114">백두산</a></li>
							<li><a href="${pageContext.request.contextPath}/menu/m115">한라산</a></li>
							<li><a href="${pageContext.request.contextPath}/menu/m116">금강산</a></li>
							<li><a href="${pageContext.request.contextPath}/menu/m117">지리산</a></li>
							<li><a href="${pageContext.request.contextPath}/menu/m118">설악산</a></li>
						</ul>
					</div>
				</li>
				<li class="item" id="item2">
					<a href="${pageContext.request.contextPath}/menu/m221" class="menu"><span></span>비지니스</a>
					<div class="sub" id="sub2">
						<ul>
							<li><a href="${pageContext.request.contextPath}/menu/m221">앱 개발(용역)</a></li>
							<li><a href="${pageContext.request.contextPath}/menu/m222">웹 사이트 구축 (자반 기반)</a></li>
							<li><a href="${pageContext.request.contextPath}/menu/m223">학생/기업 멘토링(ICT)</a></li>
							<li><a href="${pageContext.request.contextPath}/menu/m224">ICT 융합 컨설팅</a></li>
						</ul>
					</div>
				</li>
				<li class="item" id="item3">
					<a href="${pageContext.request.contextPath}/sarticle/list?boardId=1&p=1" class="menu"><span></span>지식창고</a>
					<div class="sub" id="sub3">
						<ul>
							<li><a href="${pageContext.request.contextPath}/sarticle/list?boardId=1&p=1">시 모음</a></li>
							<li><a href="${pageContext.request.contextPath}/article/list?boardId=2&p=1">육아 정보</a></li>
							<li><a href="${pageContext.request.contextPath}/article/list?boardId=3&p=1">도시농업</a></li>
							<li><a href="${pageContext.request.contextPath}/article/list?boardId=4&p=1">Android</a></li>
							<li><a href="${pageContext.request.contextPath}/article/list?boardId=5&p=1">Web(자바기반)</a></li>
							<li><a href="${pageContext.request.contextPath}/article/list?boardId=6&p=1">임베디드</a></li>
							<li><a href="${pageContext.request.contextPath}/article/list?boardId=7&p=1">함께 만들어요</a></li>
						</ul>
					</div>
				</li>
				<li class="item" id="item14">
					<a href="${pageContext.request.contextPath}/article/list?boardId=8&p=1" class="menu"><span></span>고객지원</a>
					<div class="sub" id="sub4">
						<ul>
							<li><a href="${pageContext.request.contextPath}/article/list?boardId=8&p=1">공지사항</a></li>
							<li><a href="${pageContext.request.contextPath}/qna/list?boardId=9&p=1">Q&amp;A</a></li>
							<li><a href="${pageContext.request.contextPath}/guestbook/list?boardId=10&p=1">방명록</a></li>
						</ul>
					</div>
				</li>
				<li class="item" id="item5">
					<a href="${pageContext.request.contextPath}/menu/m551" class="menu"><span></span>회사소개</a>
					<div class="sub" id="sub5">
						<ul>
							<li><a href="${pageContext.request.contextPath}/menu/m551">인사말</a></li>
							<li><a href="${pageContext.request.contextPath}/menu/m552">경영이념</a></li>
							<li><a href="${pageContext.request.contextPath}/menu/m553">회사연혁</a></li>
							<li><a href="${pageContext.request.contextPath}/menu/m554">포트포리오</a></li>
							<li><a href="${pageContext.request.contextPath}/menu/m555">찾아오시는 길</a></li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
	</nav>
</section>
<div id="termsModal" class="termsDialog">
	<div>
	<a href="#close"><img class="closeBtn" src="${pageContext.request.contextPath}/resources/images/member/closeButton.png" style="float: right;"></a>
	<form id="agreeForm" name="agreeForm" action="javascript:joinModal()" autocomplete="off" novalidate="novalidate">
		<h3>이용약관/개인정보 취급(처리)방침</h3>
		<br/>
		<h5>이용약관에 동의하여 주십시요.</h5>
		<h6><label for="tc">이용약관</label></h6>
		<div id="tc" class="tcClass">
			<pre>
[달란트(Talanton) 인터넷서비스 이용약관 변경일자 : 2018.01.01]
제 1 조 (목적)
이 약관은 달란트(Talanton)가 운영하는 '달란트(Talanton) 인터넷 홈 페이지'(이하 '홈 페이지'라 한다)에서 제공하는 인터넷 관련
서비스(이하 '서비스'라 한다)를 이용함에 있어 달란트(Talanton)과 이용자의 권리, 의무 및 책임사항을 규정함을 목적으로 한다.

제 2 조 (정의)
이 약관에서 사용하는 용어의 정의는 다음과 같다.
①"서비스"라 함은 구현되는 단말기(PC, TV, 휴대형단말기 등의 각종 유무선 장치를 포함)와 상관없이 "회원"이 이용할 수 있는 달
  란트(Talanton) 및 달란트(Talanton) 관련 제반 서비스를 의미한다.
②"회원"이라 함은 회사의 "서비스"에 접속하여 이 약관에 따라 "회사"와 이용계약을 체결하고 "회사"가 제공하는 "서비스"를 이용
  하는 고객을 말한다.
③"아이디(ID)"라 함은 "회원"의 식별과 "서비스" 이용을 위하여 "회원"이 정하고 "회사"가 승인하는 문자와 숫자의 조합을 의미한
  다.
④"비밀번호"라 함은 "회원"이 부여 받은 "아이디와 일치되는 "회원"임을 확인하고 비밀보호를 위해 "회원" 자신이 정한 문자 또는
  숫자의 조합을 의미한다.
⑤"게시물"이라 함은 "회원"이 "서비스"를 이용함에 있어 "서비스상"에 게시한 부호ㆍ문자ㆍ음성ㆍ음향ㆍ화상ㆍ동영상 등의 정보 형
  태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미한다.

제 3 조 (약관의 명시와 개정)
①"회사"는 이 약관의 내용을 "회원"이 쉽게 알 수 있도록 서비스 초기 화면에 게시한다.
②"회사"는 "약관의규제에관한법률", "정보통신망이용촉진및정보보호등에관한법률(이하 "정보통신망법")" 등 관련법을 위배하지 않
  는 범위에서 이 약관을 개정할 수 있다.
③"회사"가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 제1항의 방식에 따라 그 개정약관의 적용일
  자 30일 전부터 적용일자 전일까지 공지한다. 다만, 회원에게 불리한 약관의 개정의 경우에는 공지 외에 일정기간 서비스내 전자
  우편, 전자쪽지, 로그인시 동의창 등의 전자적 수단을 통해 따로 명확히 통지하도록 한다.
④회사가 전항에 따라 개정약관을 공지 또는 통지하면서 회원에게 30일 기간 내에 의사표시를 하지 않으면 의사표시가 표명된 것으
  로 본다는 뜻을 명확하게 공지 또는 통지하였음에도 회원이 명시적으로 거부의 의사표시를 하지 아니한 경우 회원이 개정약관에 
  동의한 것으로 본다.
⑤회원이 개정약관의 적용에 동의하지 않는 경우 회사는 개정 약관의 내용을 적용할 수 없으며, 이 경우 회원은 이용계약을 해지할 
  수 있다. 다만, 기존 약관을 적용할 수 없는 특별한 사정이 있는 경우에는 회사는 이용계약을 해지할 수 있다.

제 4 조 (이용계약 체결)
①이용계약은 "회원"이 되고자 하는 자(이하 "가입신청자")가 약관의 내용에 대하여 동의를 한 다음 회원가입신청을 하고 "회사"가
  이러한 신청에 대하여 승낙함으로써 체결된다.
②"회사"는 "가입신청자"의 신청에 대하여 "서비스" 이용을 승낙함을 원칙으로 합니다. 다만, "회사"는 다음 각 호에 해당하는 신청
  에 대하여는 승낙을 하지 않거나 사후에 이용계약을 해지할 수 있다.
1.가입신청자가 이 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 단 "회사"의 회원 재가입 승낙을 얻은 경우에는 예외
  로 함.
2.실명이 아니거나 타인의 명의를 이용한 경우
3.허위의 정보를 기재하거나, "회사"가 제시하는 내용을 기재하지 않은 경우
4.14세 미만 아동이 법정대리인(부모 등)의 동의를 얻지 아니한 경우
5.이용자의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우
③제1항에 따른 신청에 있어 "회사"는 "회원"의 종류에 따라 전문기관을 통한 실명확인 및 본인인증을 요청할 수 있다.
④"회사"는 서비스관련설비의 여유가 없거나, 기술상 또는 업무상 문제가 있는 경우에는 승낙을 유보할 수 있다.
⑤제2항과 제4항에 따라 회원가입신청의 승낙을 하지 아니하거나 유보한 경우, "회사"는 원칙적으로 이를 가입신청자에게 알리도록
  한다.
⑥이용계약의 성립 시기는 "회사"가 가입완료를 신청절차 상에서 표시한 시점으로 한다.
⑦"회사"는 "회원"에 대해 회사정책에 따라 등급별로 구분하여 이용시간, 이용횟수, 서비스 메뉴 등을 세분하여 이용에 차등을 둘 
  수 있다.
⑧"회사"는 "회원"에 대하여 "영화및비디오물의진흥에관한법률" 및 "청소년보호법"등에 따른 등급 및 연령 준수를 위해 이용제한이
  나 등급별 제한을 할 수 있다.

제 5 조 (회원정보의 변경)
①"회원"은 개인정보관리화면을 통하여 언제든지 본인의 개인정보를 열람하고 수정할 수 있다. 다만, 서비스 관리를 위해 필요한 실
  명, 주민등록번호, 아이디 등은 수정이 불가능하다.
②"회원"은 회원가입신청 시 기재한 사항이 변경되었을 경우 온라인으로 수정을 하거나 전자우편 기타 방법으로 "회사"에 대하여 그
  변경사항을 알려야 한다.
③제2항의 변경사항을 "회사"에 알리지 않아 발생한 불이익에 대하여 "회사"는 책임지지 않는다.

제 6 조 (개인정보보호 의무)
"회사"는 "정보통신망법" 등 관계 법령이 정하는 바에 따라 "회원"의 개인정보를 보호하기 위해 노력한다. 개인정보의 보호 및 사용
에 대해서는 관련법 및 "회사"의 개인정보처리방침이 적용된다. 다만, "회사"의 공식 사이트 이외의 링크된 사이트에서는 "회사"의
개인정보처리방침이 적용되지 않는다.

제 7 조 (회원의 ID 및 비밀번호에 대한 의무)
①"회원"의 "아이디"와 "비밀번호"에 관한 관리책임은 "회원"에게 있으며, 이를 제3자가 이용하도록 하여서는 안 된다.
②"회사"는 "회원"의 "아이디"가 개인정보 유출 우려가 있거나, 반사회적 또는 미풍양속에 어긋나거나 "회사" 및 "회사"의 운영자로
  오인한 우려가 있는 경우, 해당 "아이디"의 이용을 제한할 수 있다.
③"회원"은 "아이디" 및 "비밀번호"가 도용되거나 제3자가 사용하고 있음을 인지한 경우에는 이를 즉시 "회사"에 통지하고 "회사"의
  안내에 따라야 한다.
④제3항의 경우에 해당 "회원"이 "회사"에 그 사실을 통지하지 않거나, 통지한 경우에도 "회사"의 안내에 따르지 않아 발생한 불이
  익에 대하여 "회사"는 책임지지 않는다.

제 8 조 (회원에 대한 통지)
①"회사"가 "회원"에 대한 통지를 하는 경우 이 약관에 별도 규정이 없는 한 서비스 내 전자우편주소, 전자쪽지 등으로 할 수 있다.
②"회사"는 "회원" 전체에 대한 통지의 경우 7일 이상 "회사"의 게시판에 게시함으로써 제1항의 통지에 갈음할 수 있다.

제 9 조 ("회사"의 의무)
①"회사"는 관련법과 이 약관이 금지하거나 미풍양속에 반하는 행위를 하지 않으며, 계속적이고 안정적으로 "서비스"를 제공하기 위
  하여 최선을 다하여 노력한다.
②"회사"는 "회원"이 안전하게 "서비스"를 이용할 수 있도록 개인정보(신용정보 포함)보호를 위해 보안시스템을 갖추어야 하며 개인
  정보처리방침을 공시하고 준수한다.
③"회사"는 서비스이용과 관련하여 발생하는 이용자의 불만 또는 피해구제요청을 적절하게 처리할 수 있도록 필요한 인력 및 시스템
  을 구비한다.
④"회사"는 서비스이용과 관련하여 "회원"으로부터 제기된 의견이나 불만이 정당하다고 인정할 경우에는 이를 처리하여야 한다. "회
  원"이 제기한 의견이나 불만사항에 대해서는 게시판을 활용하거나 전자우편 등을 통하여 "회원"에게 처리과정 및 결과를 전달한다.

제 10 조 ("회원"의 의무)
①"회원"은 다음 행위를 하여서는 안 된다.
1.신청 또는 변경 시 허위내용의 등록
2.타인의 정보도용
3."회사"가 게시한 정보의 변경
4."회사"가 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시
5."회사"와 기타 제3자의 저작권 등 지적재산권에 대한 침해
6."회사" 및 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
7.외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 "서비스"에 공개 또는 게시하는 행위
8.회사의 동의 없이 영리를 목적으로 "서비스"를 사용하는 행위
9.기타 불법적이거나 부당한 행위
②"회원"은 관계법, 이 약관의 규정, 이용안내 및 "서비스"와 관련하여 공지한 주의사항, "회사"가 통지하는 사항 등을 준수하여야
  하며, 기타 "회사"의 업무에 방해되는 행위를 하여서는 안 된다.

제 11 조 ("서비스"의 제공 등)
①회사는 회원에게 아래와 같은 서비스를 제공합니다.
1.ICT 분야 게시판형 서비스
2.융합 분야 게시판형 서비스
3.동영상 강의 수강
②"서비스"는 연중무휴, 1일 24시간 제공함을 원칙으로 한다.
③"회사"는 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신두절 또는 운영상 상당한 이유가 있는 경우 "서비스"의 제공을
  일시적으로 중단할 수 있다. 이 경우 "회사"는 제8조["회원"에 대한 통지]에 정한 방법으로 "회원"에게 통지한다. 다만, "회사"가
  사전에 통지할 수 없는 부득이한 사유가 있는 경우 사후에 통지할 수 있다.
④"회사"는 서비스의 제공에 필요한 경우 정기점검을 실시할 수 있으며, 정기점검시간은 서비스제공화면에 공지한 바에 따른다.

제 12 조 ("서비스"의 변경)
①"회사"는 상당한 이유가 있는 경우에 운영상, 기술상의 필요에 따라 제공하고 있는 전부 또는 일부 "서비스"를 변경할 수 있다.
②"서비스"의 내용, 이용방법, 이용시간에 대하여 변경이 있는 경우에는 변경사유, 변경될 서비스의 내용 및 제공일자 등은 그 변경
  전에 해당 서비스 초기화면에 게시하여야 한다.
③"회사"는 무료로 제공되는 서비스의 일부 또는 전부를 회사의 정책 및 운영의 필요상 수정, 중단, 변경할 수 있으며, 이에 대하여
  관련법에 특별한 규정이 없는 한 "회원"에게 별도의 보상을 하지 않는다.

제 13 조 ("게시물"의 저작권)
①"회원"이 "서비스" 내에 게시한 "게시물"의 저작권은 해당 게시물의 저작자에게 귀속된다.
②"회원"이 "서비스" 내에 게시하는 "게시물"은 검색결과 내지 "서비스" 및 관련 프로모션 등에 노출될 수 있으며, 해당 노출을 위
  해 필요한 범위 내에서는 일부 수정, 복제, 편집되어 게시될 수 있다. 이 경우, 회사는 저작권법 규정을 준수하며, "회원"은 언제
  든지 고객센터를 통해 해당 게시물에 대해 삭제, 검색결과 제외, 비공개 등의 조치를 취할 수 있다.
③"회사"는 제2항 이외의 방법으로 "회원"의 "게시물"을 이용하고자 하는 경우에는 전화, 팩스, 전자우편 등을 통해 사전에 "회원"
  의 동의를 얻어야 한다.
  
제 14 조 ("게시물"의 관리)
①"회원"의 "게시물"이 "정보통신망법" 및 "저작권법"등 관련법에 위반되는 내용을 포함하는 경우, 권리자는 관련법이 정한 절차에 
  따라 해당 "게시물"의 게시중단 및 삭제 등을 요청할 수 있으며, "회사"는 관련법에 따라 조치를 취하여야 한다.
②"회사"는 전항에 따른 권리자의 요청이 없는 경우라도 권리침해가 인정될 만한 사유가 있거나 기타 회사 정책 및 관련법에 위반되
  는 경우에는 관련법에 따라 해당 "게시물"에 대해 임시조치 등을 취할 수 있다.
  
제 15 조 (권리의 귀속)
①"서비스"에 대한 저작권 및 지적재산권은 "회사"에 귀속됩니다. 단, "회원"의 "게시물" 및 제휴계약에 따라 제공된 저작물 등은 
  제외한다.
②"회사"는 서비스와 관련하여 "회원"에게 "회사"가 정한 이용조건에 따라 계정, "아이디", 콘텐츠 등을 이용할 수 있는 이용권만을
  부여하며, "회원"은 이를 양도, 판매, 담보제공 등의 처분행위를 할 수 없다.

제 16 조 (계약해제, 해지 등)
①"회원"은 언제든지 서비스초기화면의 고객센터 또는 내 정보 관리 메뉴 등을 통하여 이용계약 해지 신청을 할 수 있으며, "회사"
  는 관련법 등이 정하는 바에 따라 이를 즉시 처리하여야 한다.
②"회원"이 계약을 해지할 경우, 관련법 및 개인정보처리방침에 따라 "회사"가 회원정보를 보유하는 경우를 제외하고는 해지 즉시 
 "회원"의 모든 데이터는 소멸된다.
 ③"회원"이 계약을 해지하는 경우, "회원"이 작성한 "게시물" 등은 삭제되지 않으니 사전에 삭제 후 탈퇴하여야 한다.

제 17 조 (이용제한 등)
①"회사"는 "회원"이 이 약관의 의무를 위반하거나 "서비스"의 정상적인 운영을 방해한 경우, 경고, 일시정지, 영구이용정지 등으로
 "서비스" 이용을 단계적으로 제한할 수 있다.
②"회사"는 전항에도 불구하고, "주민등록법"을 위반한 명의도용 및 결제도용, "저작권법" 및 "컴퓨터프로그램보호법"을 위반한 불
  법프로그램의 제공 및 운영방해, "정보통신망법"을 위반한 불법통신 및 해킹, 악성프로그램의 배포, 접속권한 초과행위 등과 같이
  관련법을 위반한 경우에는 즉시 영구이용정지를 할 수 있다.
③"회사"는 "회원"이 계속해서 3개월 이상 로그인하지 않는 경우, 회원정보의 보호 및 운영의 효율성을 위해 이용을 제한할 수 있다.
④본 조에 따라 "서비스" 이용을 제한하거나 계약을 해지하는 경우에는 "회사"는 제8조["회원"에 대한 통지]에 따라 통지합니다.

제 18 조 (책임제한)
①"회사"는 무료로 제공되는 서비스 이용과 관련하여 관련법에 특별한 규정이 없는 한 책임을 지지 않는다.
②"회사"는 "회원"이 "서비스"와 관련하여 게재한 정보, 자료, 사실의 신뢰도, 정확성 등의 내용에 관하여는 책임을 지지 않는다.
③"회사"는 "회원" 간 또는 "회원"과 제3자 상호간에 "서비스"를 매개로 하여 거래 등을 한 경우에는 책임이 면제된다.

제 19 조 (준거법 및 재판관할)
①"회사"와 "회원" 간 제기된 소송은 대한민국법을 준거법으로 한다.
②"회사"와 "회원"간 발생한 분쟁에 관한 소송은 제소 당시의 "회원"의 주소에 의하고, 주소가 없는 경우 거소를 관할하는 지방법원
  의 전속관할로 한다. 단, 제소 당시 "회원"의 주소 또는 거소가 명확하지 아니한 경우의 관할법원은 민사소송법에 따라 정한다.
③해외에 주소나 거소가 있는 "회원"의 경우 "회사"와 "회원"간 발생한 분쟁에 관한 소송은 전항에도 불구하고 대한민국 서울중앙지
  방법원을 관할법원으로 한다.

부칙
제 1조(시행일) 본 지침은 2018년 5월 1일 부터 시행한다.
			</pre>
		</div>
		<div class="agreeChk">
			<div id="agree11" class="agreeClass">
				<input type="radio" name="terms1" value="동의" required>
				<label>이 이용약관을 읽고 동의합니다.</label>
			</div>
			<div id="agree12" class="agreeClass">
				<input type="radio" name="terms1" required checked="checked" value="비동의">
				<label>동의하지 않습니다.</label>
			</div>
		</div>
		<br>
		<h6><label for="tc2">개인정보 수집 및 이용안내</label></h6>
		<div id="tc2" class="tcClass">
			<pre>
[개인정보취급방침 변경일자 : 2018.05.01]
달란트(Talanton) 인터넷 홈페이지(이하 ‘홈페이지’라고 함)를 방문하여 주셔서 대단히 감사합니다.
달란트(Talanton)은 이용자가 홈페이지 서비스를 이용하기 위해 제공하신 개인정보를 무엇보다 중요하게 생각하며, 홈페이지 이용자
의 개인정보를 보호하기 위하여 최선을 다하고 있습니다. 달란트(Talanton)은 이를 위해 ‘개인정보보호법’, 및 ‘정보통신망 이용
촉진 및 정보보호 등에 관한 법률’에 따라 이용자의 개인정보 및 권익을 보호하고 개인정보와 관련한 이용자의 고충을 원활하게 처
리할 수 있도록 다음과 같이 처리방침을 수립하여 실천하고 있습니다. 개인정보 처리방침은 정부의 법률이나 달란트(Talanton)의 내
부 방침 변경 등으로 인하여 변경될 수 있으며, 이러한 변경의 경우 이용자가 쉽게 확인하실 수 있도록 홈페이지를 통해 공지할 것
입니다.

개인정보의 수집·이용 목적, 수집하는 개인정보의 항목 및 수집방법
가.수집 및 이용목적
달란트(Talanton)이 제공하는 서비스의 원할한 이용을 위하여 개인정보를 수집하고 이를 서비스 제공을 위해 이용합니다.
나.수집하는 개인정보의 항목 및 수집방법
- 회원 가입 시에 '아이디, 비밀번호, 이름, 이메일'을 필수항목으로 수집합니다.
- 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다.
  추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이
  용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.

개인정보의 제3자 제공에 관한 사항
달란트(Talanton)은 이용자의 사전동의 없이 개인정보를 본 지침상의 정보이용 목적의 범위를 넘어 사용하거나 제3자(타인 또는 타
기업·기관)에게 제공하지 않습니다. 단, 다음의 경우는 예외로 합니다.
가. 관계 법령에 의하여 수사상의 목적으로 관계기관으로부터의 요구가 있을 경우
나. 통계작성 및 학술연구 등의 목적을 위하여 필요한 경우로서 개인을 식별하기에 특정할 수 없는 상태로 가공하여 제공하는 경우.
다. 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우

이용자의 권리와 그 행사 방법
가.홈페이지 이용자 등은 언제든지 등록되어 있는 자신의 개인정보를 조회·수정하거나 회원탈퇴를 요청할 수 있으며, 마케팅 정보
  제공 동의를 철회할 수 있습니다. 개인정보 조회·수정 및 마케팅 정보제공 동의 철회를 위해서는 회원 로그인 후 ‘개인정보수정’
  화면 및 ‘회원정 보수정’을 클릭하여 직접 열람·수정 또는 동의철회를 하실 수 있으며, 회원탈퇴를 하시고자하는 경우 ‘회원
  탈퇴’를 클릭하시면 처리가 됩니다.
나.이용자가 개인정보의 오류에 대한 정정·삭제를 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 처리위탁
  을 하지 않습니다. 또한 잘못된 개인정보의 처리위탁을 한 경우에는 정정, 탈퇴(삭제), 마케팅 정보제공 동의 철회의 처리결과를 
  수탁자에게 지체없이 통지하여 정정이 이루어지도록 하겠습니다.

회사는 이용자의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 관련 개인정보책임자를 지정하고 있습니다.
[개인정보보호 책임자]
- 개인정보보호 책임자: 서경섭
  TEL: 010-9530-3135 / E-mail: ksseo63@naver.com
			</pre>
		</div>
		<div class="agreeChk">
			<div id="agree21" class="agreeClass">
				<input type="radio" name="terms2" required value="동의">
				<label>개인정보 수집 및 이용에 동의합니다.</label>
			</div>
			<div id="agree22" class="agreeClass">
				<input type="radio" name="terms2" required checked="checked" value="비동의">
				<label>동의하지 않습니다.</label>
			</div>
		</div>
		<div class="btnAlignC">
			<input type="submit" id="btnAgree" value="계속">
		</div>
	</form>
	</div>
</div>
<!-- 회원가입 -->
<div id="joinModal" class="joinDialog">
	<div>
		<div class="title">
			<div class="loginText">회원가입</div>
			<div class="loginExit"><a href="#close" title="Close" class="close"><img class="closeBtn" src="${pageContext.request.contextPath}/resources/images/member/closeButton.png"></a></div>
		</div>
		<form action="javascript:joinPro();" method="post">
			<input type="hidden" id="kind" name="kind" value="1">
			<table style="width: 100%;">
				<tr>
					<td>아이디 </td>
					<td>
						<input type="email" id="jid" name="id" placeholder="이메일 형식의 아이디를 입력하세요" size="30" autofocus="autofocus" required>
						<input type="button" id="idCheck" name="idCheck" value="중복 확인">
						<img id="jidimg" alt="icon" src="${pageContext.request.contextPath}/resources/images/member/eye127.png">
					</td>
				</tr>
				<tr>
					<td>암호 </td>
					<td>
						<input type="password" id="password" name="password" placeholder="특수문자, 영문, 숫자의 조합으로 8자 이상" size="30" required>
						<img class="jpwimg" alt="icon" src="${pageContext.request.contextPath}/resources/images/member/eye127.png">
					</td>
				</tr>
				<tr>
					<td>암호확인 </td>
					<td>
						<input type="password" id="cPassword" name="cPassword" placeholder="특수문자, 영문, 숫자의 조합으로 8자 이상" size="30" required>
						<img class="jpwimg" alt="icon" src="${pageContext.request.contextPath}/resources/images/member/eye127.png">
					</td>
				</tr>
				<tr>
					<td>이름 </td>
					<td><input type="text" id="name" name="name" size="30" placeholder="홍길동" required></td>
				</tr>
				<tr>
					<td>전화번호 </td>
					<td>
						<input type="text" id="mobile" name="mobile" size="15" maxlength="15" placeholder="'-'없이 붙여서">
					</td>
				</tr>
				<tr>
					<td>회원유형 : </td>
					<td><select name="kind">
						<option value="1" selected="selected">Customer</option>
						<option value="2">Business</option>
					</select></td>
				</tr>
			</table>
			<div class="btnSub">
				<input type="submit" value="회원가입"> <input type="reset">
			</div>
		</form>
	</div>
</div>
<!-- 로그인 -->
<div id="openModal" class="modalDialog">
	<div>
		<form action="javascript:loginPro()" method="post" name="loginPro" id="loginPro">
		<fieldset>
			<div class="title">
				<div class="loginText">로그인</div>
				<div class="loginExit"><a href="#close" title="Close" class="close"><img class="closeBtn" src="${pageContext.request.contextPath}/resources/images/member/closeButton.png"></a></div>
			</div>
			<div class="input-wrap">
				<label for="id">ID(이메일)</label>
				<div class="input">
					<c:choose>
						<c:when test="${id == null || id == ''}">
							<input type="text" maxlength="100" placeholder="이메일 형식으로 입력하세요" size="50" autocomplete="off" id="id" name="id" autofocus="autofocus" required>
						</c:when>
						<c:otherwise>
							<input type="text" maxlength="100" placeholder="이메일 형식으로 입력하세요" size="50" autocomplete="off" id="id" name="id" autofocus="autofocus" required value="${id}">
						</c:otherwise>
					</c:choose>
					<img id="idimg" alt="icon" src="${pageContext.request.contextPath}/resources/images/member/eye127.png">
				</div>
			</div>
			<div>
				<label for="pw">비밀번호</label>
				<div class="input">
					<input type="password" name="password" id="pw" placeholder="특수문자, 영문, 숫자의 조합으로 8자 이상" size="50" autocomplete="off" maxlength="100" required>
					<img id="pwimg" alt="icon" src="${pageContext.request.contextPath}/resources/images/member/eye127.png">
				</div>
			</div>
			<div>
				<div class="input">
					<input type="checkbox" name="useCookie" id="useCookie"> Remember Me
				</div>
			</div>
			<p class="sign-link"><a href="#idModal">ID / 비밀번호 찾기</a></p>
			<div class="btn-wrap">
				<input type="submit" value="로그인"/>
				<div id="signup-wrap">
					<p>아직 회원이 아니세요? <a href="#termsModal" class="sign-up-btn">회원가입</a></p>
				</div>
			</div>
		</fieldset>
		</form>
	</div>
</div>
<!-- 회원정보 변경 -->
<div id="profileModal" class="profileDialog">
	<div>
		<form action="javascript:profilePro()" method="post" name="profilePro" id="profilePro">
		<fieldset>
			<div class="title">
				<div class="loginText">회원정보 보기/변경</div>
				<div class="loginExit"><a href="#close" title="Close" class="close"><img class="closeBtn" src="${pageContext.request.contextPath}/resources/images/member/closeButton.png"></a></div>
			</div>
			<div class="input-wrap">
				<label for="proid">ID(이메일)</label>
				<div class="input">
					<input type="text" maxlength="100" placeholder="이메일 형식으로 입력하세요" size="50" autocomplete="off" id="proid" name="id" readonly="readonly" disabled value="${id}">
				</div>
			</div>
			<div>
				<label for="propw">현재 비밀번호</label>
				<div class="input">
					<input type="password" name="password" id="propw" placeholder="특수문자, 영문, 숫자의 조합으로 8자 이상" size="50" autocomplete="off" maxlength="100" required>
					<img class="propwimg" alt="icon" src="${pageContext.request.contextPath}/resources/images/member/eye127.png">
				</div>
			</div>
			<div>
				<label for="prorepw">신규 비밀번호</label>
				<div class="input">
					<input type="password" name="repass" id="prorepw" placeholder="특수문자, 영문, 숫자의 조합으로 8자 이상" size="50" autocomplete="off" maxlength="100">
					<img class="propwimg" alt="icon" src="${pageContext.request.contextPath}/resources/images/member/eye127.png">
				</div>
			</div>
			<div>
				<label for="propwcon">신규 비밀번호 확인</label>
				<div class="input">
					<input type="password" name="repass2" id="propwcon" placeholder="특수문자, 영문, 숫자의 조합으로 8자 이상" size="50" autocomplete="off" maxlength="100">
					<img class="propwimg" alt="icon" src="${pageContext.request.contextPath}/resources/images/member/eye127.png">
				</div>
			</div>
			<div>
				<label for="proname">이름</label>
				<div class="input">
					<input type="text" name="name" id="proname" size="50" autocomplete="off" maxlength="100" required>
				</div>
			</div>
			<div>
				<label for="promobile">전화번호</label>
				<div class="input">
					<input type="text" id="promobile" name="mobile" size="16" maxlength="16" placeholder="'-'없이">
				</div>
			</div>
			<div>
				<label for="prokind">회원유형 : </label>
				<div class="input">
					<select name="kind">
						<option value="1">Customer</option>
						<option value="2">Business</option>
					</select>
				</div>
			</div>
			<div class="btnSub">
				<input type="submit" value="회원정보 수정"/><input type="reset">
			</div>
		</fieldset>
		</form>
	</div>
</div>