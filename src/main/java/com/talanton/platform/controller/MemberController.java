package com.talanton.platform.controller;

import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.talanton.platform.member.domain.LoginRequest;
import com.talanton.platform.member.domain.MemberVO;
import com.talanton.platform.member.service.MemberService;
import com.talanton.platform.utils.crypt.BCrypt;
import com.talanton.platform.utils.crypt.SHA256;

@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	private MemberService service;
	
	@RequestMapping(value="/idCheck", method=RequestMethod.POST)
	public @ResponseBody boolean idCheck(String id) throws Exception {
		return service.idCheck(id);
		
	}
	
	@RequestMapping(value="/joinMember", method=RequestMethod.POST)
	public @ResponseBody String joinMember(@ModelAttribute("member") @Valid MemberVO member, BindingResult result) throws Exception {
		String data = "nok";
		if(!result.hasErrors()) {
			if(service.idCheck(member.getId())) {	// 미회원
				SHA256 sha = SHA256.getInsatnce();
				String orgPass = member.getPassword();
				String shaPass = sha.getSha256(orgPass.getBytes());
				member.setPassword(BCrypt.hashpw(shaPass, BCrypt.gensalt()));
				if(service.joinMember(member) == 1) {	// 1: 성공, 그외: 실패
					data = "ok";
				}
			}
		}
		return data;
	}
	
	@RequestMapping(value="/loginPro", method=RequestMethod.POST)
	public @ResponseBody String loginPro(@ModelAttribute("login") @Valid LoginRequest loginRequest, BindingResult result, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		StringBuilder sb = new StringBuilder();
		Object dest = "";
		int data = 2;
		if(!result.hasErrors()) {
			MemberVO member = service.loginPro(loginRequest.getId());
			if(member != null) {
				String orgPass = loginRequest.getPassword();
				String dbPasswd = member.getPassword();
				if(dbPasswd == null || dbPasswd == "") {
					data = -1;	// 존재하지 않는 아이디
				}
				SHA256 sha = SHA256.getInsatnce();
				String shaPass = sha.getSha256(orgPass.getBytes());
				if(BCrypt.checkpw(shaPass, dbPasswd)) {	// 인증 성공
					request.setAttribute("memberVO", member);
					dest = session.getAttribute("dest");
					if(loginRequest.isUseCookie()) {
						int amount = 60 * 60 * 24 * 7;
						Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));
						service.keepLogin(member.getId(), session.getId(), sessionLimit);
					}
					data = 1;
				}
				else {
					data = 0;
				}
			} else {
				data = -1;
			}
		}
		
		sb.append("{ 'result': ").append(data).append(", 'dest': '");
		if(dest == null || dest.equals("")) {
			sb.append(request.getContextPath()).append("#close'");
		} else {
			sb.append(dest).append("#close'");
		}
		if(data == 1 && request.getParameter("useCookie") != null) {
			sb.append(", 'id': '").append(session.getId()).append("'");
		}
		sb.append(" }");
		return sb.toString();	// 1: 성공, -1: 존재하지 않는 ID, 0: 비밀번호 불일치, 2: 아이디 입력 오류, 3: 비밀번호 입력 오류
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.POST)
	public @ResponseBody String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception  {
		Object obj = session.getAttribute("member");
		if(obj != null) {
			MemberVO vo = (MemberVO) obj;
			session.removeAttribute("member");
			session.invalidate();
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if(loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				service.keepLogin(vo.getId(), session.getId(), new Date());
			}
		}
		
		return "ok";
	}
	
	@RequestMapping(value="/getProfile", method=RequestMethod.POST)
	public @ResponseBody MemberVO getProfile(String id) throws Exception {
		return service.loginPro(id);
	}
	
	@RequestMapping(value="updateProfile", method=RequestMethod.POST)
	public @ResponseBody int updateProfile(@ModelAttribute("member") @Valid MemberVO member, String newPass, BindingResult result) throws Exception {
		if(result.hasErrors()) {
			return 0;	// 파라미터 입력 오류
		}
		String dbPasswd = service.getPassword(member.getId());
		if(dbPasswd == null || dbPasswd == "") {	// 가입되지 않은 회원
			return -2;	// 가입되지 않은 회원
		}
		String orgPass = member.getPassword();
		SHA256 sha = SHA256.getInsatnce();
		String shaPass = sha.getSha256(orgPass.getBytes());
		if(!BCrypt.checkpw(shaPass, dbPasswd)) {	// 인증 성공
			return -3;	// 비밀번호 불일치
		}
		if(newPass != null && newPass != "") {	// 비밀번호 변경
			String pwReg = "^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{7,16}$";
			Matcher matcher = Pattern.compile(pwReg).matcher(newPass);
			if(!matcher.matches()){
				return -1;	// 새로운 비밀번호 입력 오류
			}
			// 비밀번호 변경 요청
			orgPass = newPass;
			shaPass = sha.getSha256(orgPass.getBytes());
			member.setPassword(BCrypt.hashpw(shaPass, BCrypt.gensalt()));
		} else {
			member.setPassword("1");
		}
		return service.updateProfile(member);
	}
	
	@RequestMapping(value="/sessionCheck", method=RequestMethod.GET)
	public @ResponseBody String sessionCheck() {
		return "ok";
	}
}