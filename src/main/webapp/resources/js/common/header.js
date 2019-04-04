var submenu = null;
var passId = false;
var passPw = false;
var p_passPw1 = false;
var p_passPw2 = false;
var p_passPw3 = false;

$(document).ready(function() {
	var loginLink = $("#submenu").children;
	var gnbArea = $("#gnb");
	var menuItemAll = $("#gnb li");
	var menuItem = new Array();
	var currentItem, prevItem;
	
	for(i=0;i<menuItemAll.length;i++){
		if((menuItemAll[i].className).indexOf("item") > -1){
			menuItem.push(menuItemAll[i]);
		}
	}
	
	for(i=0;i<menuItem.length;i++){
		var link = menuItem[i].getElementsByTagName("a")[0];
		var layer = menuItem[i].getElementsByTagName("div")[0];
		var subLinks = menuItem[i].getElementsByTagName("div")[0].getElementsByTagName("a");

		link.onmouseover = layer.onmouseover = link.onfocus = function(e){
			currentItem = this.parentNode;
			if(prevItem){
				removeClass(prevItem,"on");
			}
			addClass(currentItem,"on");
			prevItem = currentItem;
		}
		link.onmouseout = layer.onmouseout = function(e){
			removeClass(this.parentNode,"on");
		}
		link.onkeydown = function(e){
			if (event.shiftKey && event.keyCode == 9){
				removeClass(this.parentNode,"on");
			}
		}
		for(j=0;j<subLinks.length;j++){
			subLinks[subLinks.length-1].onblur = function(e){
				removeClass(this.parentNode.parentNode.parentNode.parentNode,"on");
			}
		}
	}

	submenu = $(".sitem");
	var id = sessionStorage.getItem("id");
//	submenu[3].innerHTML = "MyPage";
	if(id != null) {	// 세션이 유지되는 상태. 즉, 로그인된 상태
		sessionOnActivatingState();
	}
	else {	
		sessionNotActivatingState();
	}
	
	$("#id").on("keyup", chkId);				// login
	$("#pw").on("keyup", chkPw);
	$("form").eq(2).on("submit", chkP);
	
	/* 회원가입 */
	$("#jid").on("keyup", chkIdJoin);			// join
	$("#password").on("keyup", chkPwd1Join);
	$("#cPassword").on("keyup", chkPwd2Join);
	$("form").eq(1).on("submit", chkParameter);
	$("#idCheck").on("click", chkIdValid);
	
	/* profile 변경 */
	$("#propw").on("keyup", chkPwd1Profile);	// Profile
	$("#prorepw").on("keyup", chkPwd2Profile);
	$("#propwcon").on("keyup", chkPwd3Profile);
	$("form").eq(3).on("submit", chkPProfile);
});

// 액션
function addClass(ele, cls){
	var eleCln = ele.className;
	if(eleCln.indexOf(cls) == -1){
		ele.className = eleCln + " " + cls;
	}
}

function removeClass(ele, cls){
	var eleCln = ele.className;
	ele.className = eleCln.split(" " + cls)[0];
}

function sessionOnActivatingState() {
	removeClass(submenu[0], "on");	// Login
	addClass(submenu[1], "on");		// Logout
	removeClass(submenu[2], "on");	// Join
	addClass(submenu[3], "on");		// my page
}

function sessionNotActivatingState() {
	addClass(submenu[0], "on");		// Login
	removeClass(submenu[1], "on");	// Logout
	addClass(submenu[2], "on");		// Join
	removeClass(submenu[3], "on");	// my page
}

function joinModal() {
	if($('input[name=terms1]:checked', '#agreeForm').val() == "동의" && $('input[name=terms2]:checked', '#agreeForm').val() == "동의") {
		location.href="#joinModal";
	}
	else if($('input[name=terms1]:checked', '#agreeForm').val() == "비동의") {
		alert("이용약관에 동의하셔야 합니다.");
		return false;
	}
	else if($('input[name=terms2]:checked', '#agreeForm').val() == "비동의") {
		alert("개인정보 수집 및 이용에 동의하셔야 합니다.");
		return false;
	}
}

/* join */
var chkIdValid = function() {
	if(j_passId == false) {
		alert("아이디를 올바르게 입력 하세요");
		j_passValid = false;
	}
	else {
		$.post("/member/idCheck", { id: $("#jid").val() }, function(data, status) {
			if(status == "success") {
				if(data == true) {
					alert("사용할 수 있는 아이디 입니다.")
					j_passValid = true;
				}
				else {
					alert("사용할 수 없는 아이디 입니다.");
				}
			}
			else if(status == "error") {
				alert("잠시 후에 다시 시도해 주십시요.");
			}
			else {
				alert("잠시 후에 다시 시도해 주십시요.");
			}
		});
	}
}

var chkParameter = function() {
	var name = $("#name");
	var kind = $("select[name=kind]").val();

	if(j_passId == false) {
		alert("아이디를 올바르게 입력 하세요");
		$("#jid").focus();
		return false;
	}
	else if(j_passPw1 == false) {
		alert("비밀번호를 올바르게 입력하세요.");
		$("#password").focus();
		return false;
	}
	else if(j_passPw2 == false) {
		alert("비밀번호를 올바르게 입력하세요.");
		$("#cPassword").focus();
		return false;
	}
	else if(j_passValid == false) {
		alert("아이디 중복확인을 해야 합니다.");
		return false;
	}
	else if($("#name").val()==null || $("#name").val()=="") {
		alert("이름을 입력하세요");
		return false;
	}
	else if($("#password").val() != $("#cPassword").val()) {
		alert("비밀번호 확인을 해 주십시요.");
		$("#cPassword").focus();
		return false;
	}
	else if($("#mobile").val() == null || $("#mobile").val() == "") {
		alert("전화번호를 확인해 주십시요.");
		$("#area").focus();
		return false;
	}
	else {
		return true;
	}
}

var chkIdJoin = function() {
	var idReg = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{2,5}$/;
	if( !idReg.test($("#jid").val()) ) {
		$("#jidimg").attr("src", "/resources/images/member/eye127.png");
		$("#jid").css("color", "#EE5656");
		j_passId = false;
	}
	else {
		$("#jidimg").attr("src", "/resources/images/member/user7.png");
		$("#jid").css("color", "blue");
		j_passId = true;
	}
}

var chkPwd1Join = function() {
	var pwReg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{7,16}$/;
	if( !pwReg.test($("#password").val()) ) {
		$(".jpwimg").eq(0).attr("src", "/resources/images/member/eye127.png");
		$("#password").css("color", "#EE5656");
		j_passPw1 = false;
	}
	else {
		$(".jpwimg").eq(0).attr("src", "/resources/images/member/user7.png");
		$("#password").css("color", "blue");
		j_passPw1 = true;
	}
}

var chkPwd2Join = function() {
	var pwReg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{7,16}$/;
	var image = $(".jpwimg");
	if( !pwReg.test($("#cPassword").val()) ) {
		$(".jpwimg").eq(1).attr("src", "/resources/images/member/eye127.png");
		$("#cPassword").css("color", "#EE5656");
		j_passPw2 = false;
	}
	else {
		$(".jpwimg").eq(1).attr("src", "/resources/images/member/user7.png");
		$("#cPassword").css("color", "blue");
		j_passPw2 = true;
	}
}

function joinPro() {
	var mobile = $("#mobile").val();
	var kind = $("select[name=kind]").val();
	var query = {id: $("#jid").val(), password: $("#password").val(), name: $("#name").val(),
			mobile: mobile , kind: kind};
	$.ajax({
		type: "POST",
		url: "/member/joinMember",
		data: query,
		success: function(data) {
			var mid = data.trim();
			if(mid == 'ok') {
				alert("회원가입에 성공하였습니다.");
				$("#id").val($("#jid").val());
				window.location.href = "/#close";
			}
			else {
				var explain = "회원가입에 실패 하였습니다. 다시 시도해 주십시요.";
				alert(explain);
			}
		}
	});
}

//login
var chkId = function() {
	var idReg = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{2,5}$/;
	if( !idReg.test($("#id").val()) ) {
		$("#id").css("color", "#EE5656");
		$("#idimg").attr("src", "/resources/images/member/eye127.png");
		passId = false;
	}
	else {
		$("#id").css("color", "blue");
		$("#idimg").attr("src", "/resources/images/member/user7.png");
		passId = true;
	}
}

var chkPw = function() {
	var pwReg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{7,16}$/;
	if( !pwReg.test($("#pw").val()) ) {
		$("#pw").css("color", "#EE5656");
		$("#pwimg").attr("src", "/resources/images/member/eye127.png");
		passPw = false;
	}
	else {
		$("#pw").css("color", "blue");
		$("#pwimg").attr("src", "/resources/images/member/user7.png");
		passPw = true;
	}
}

var chkP = function() {
	if(passId == true && passPw == true) {
		return true;
	}
	else if(passId == false){
		alert("입력값을 확인하십시요.");
		$("#id").focus();
		return false;
	}
	else if(passPw == false) {
		alert("입력값을 확인하십시요.");
		$("#pw").focus();
		return false;
	}
}

function loginPro() {
	var query = {id: $("#id").val(), password: $("#pw").val(), useCookie: $("input[name=useCookie]:checked").val()};
	$.ajax({
		type: "POST",
		url: "/member/loginPro",
		data: query,
		success: function(data) {
			var json = eval('(' + data + ')');
			if(json.result == 1) {
				alert("로그인 성공");
				//location.reload();
				// $.removeCookie('loginCookie');
				var cookie = $.cookie('loginCookie');
				if(cookie == undefined && json.id != null) {
					$.cookie('loginCookie', json.id, { expires: 60*60*24*7, path: '/'});
					localStorage.setItem("loginCookie", json.id);
					sessionStorage.setItem("loginCookie", json.id);
				}
				window.location.href = json.dest;
				sessionOnActivatingState();
			}
			else if(json.result == -1){	// 존재하지 않는 아이디
				alert("로그인 실패");
			} else {	// 비밀번호 불일치
				alert("로그인 실패");
			}
		}
	});
}

function logout() {
	var query = { };
	$.ajax({
		type: "POST",
		url: "/member/logout",
		data: query,
		success: function(data) {
			alert("로그아웃 되었습니다.");
			location.href = "/";
		}
	});
}

function getProfile() {
	var query = { id: $("#id").val() };
	$.ajax({
		type: "POST",
		url: "/member/getProfile",
		data: query,
		success: function(data) {
			//alert(data);
			$("#proid").val(data.id);
			$("#proname").val(data.name);
			$("#promobile").val(data.mobile);
			$("#propw").val("");
			$("#prorepw").val("");
			$("#propwcon").val("");
			var kind = data.kind;
			$("select option").filter(function() {
			    //may want to use $.trim in here
			    return $(this).text() == kind; 
			}).attr('selected', true);
			
			location.href = "#profileModal";
		}
	});
}

// profile change
var chkPwd1Profile = function() {
	var pwReg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{7,16}$/;
	if( !pwReg.test($("#propw").val()) ) {
		$(".propwimg").eq(0).attr("src", "/resources/images/member/eye127.png");
		$("#propw").css("color", "#EE5656");
		p_passPw1 = false;
	}
	else {
		$(".propwimg").eq(0).attr("src", "/resources/images/member/user7.png");
		$("#propw").css("color", "blue");
		p_passPw1 = true;
	}
}

var chkPwd2Profile = function() {
	var pwReg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{7,16}$/;
	if( !pwReg.test($("#prorepw").val()) ) {
		$(".propwimg").eq(1).attr("src", "/resources/images/member/eye127.png");
		$("#prorepw").css("color", "#EE5656");
		p_passPw2 = false;
	}
	else {
		$(".propwimg").eq(1).attr("src", "/resources/images/member/user7.png");
		$("#prorepw").css("color", "blue");
		p_passPw2 = true;
	}
}

var chkPwd3Profile = function() {
	var pwReg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{7,16}$/;
	if( !pwReg.test($("#propwcon").val()) ) {
		$(".propwimg").eq(2).attr("src", "/resources/images/member/eye127.png");
		$("#propwcon").css("color", "#EE5656");
		p_passPw3 = false;
	}
	else {
		$(".propwimg").eq(2).attr("src", "/resources/images/member/user7.png");
		$("#propwcon").css("color", "blue");
		p_passPw3 = true;
	}
}

var chkPProfile = function() {
	if(p_passPw1 == false) {
		alert("기존 비밀번호를 올바르게 입력하세요.");
		$("#propw").focus();
		return false;
	}
	p_passPw4 = false;	// 비밀번호 변경을 요구하지 않음
	if(p_passPw2 == true && p_passPw3 == false) {
		alert("신규 비밀번호 확인을 올바르게 입력하세요.");
		$("#propwcon").focus();
		return false;
	}
	if(p_passPw2 == false && p_passPw3 == true) {
		alert("신규 비밀번호를 올바르게 입력하세요.");
		$("#prorepw").focus();
		return false;
	}
	if(p_passPw2 == true && p_passPw3 == true) {
		if($("#prorepw").val() != $("#propwcon").val()) {
			alert("신규 비밀번호 확인을 올바르게 입력하세요.");
			$("#propwcon").focus();
			return false;
		} else {
			p_passPw4 = true;	// 비밀번호 변경을 요구함
		}
	}
	if($("#proname").val()==null || $("#proname").val()=="") {
		alert("이름을 입력하세요");
		return false;
	}
	else if($("#promobile").val() == null || $("#promobile").val() == "") {
		alert("전화번호를 확인해 주십시요.");
		$("#proamobile").focus();
		return false;
	}
	else {
		return true;
	}
}

function profilePro() {
	var kind = $("select[name=kind]").val();
	var query = {id: $("#proid").val(), password: $("#propw").val(), name: $("#proname").val(),
			mobile: $("#promobile").val() , kind: kind,
			newPass: $("#prorepw").val()
		};
	$.ajax({
		type: "POST",
		url: "/member/updateProfile",
		data: query,
		success: function(data) {
			if(data == 1) {
				alert("회원정보 변경에 성공하였습니다.");
				$("#id").val($("#proid").val());
				window.location.href = "/#close";
			}
			else {
				var explain = "회원정보 변경에 실패 하였습니다. 다시 시도해 주십시요.";
				alert(explain);
			}
		}
	});
}