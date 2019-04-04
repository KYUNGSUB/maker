package com.talanton.platform.member.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.talanton.platform.member.domain.MemberVO;
import com.talanton.platform.member.service.MemberService;

public class AuthInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	@Inject
	private MemberService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("id") == null) {
			logger.info("current user is not logined");
			
			saveDest(request);
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if(loginCookie != null) {
				MemberVO member = service.checkLoginBefore(loginCookie.getValue());
				logger.info("MemberVO : " + member);
				if(member != null) {
					session.setAttribute("id", member.getId());
					session.setAttribute("member", member);
					return true;
				}
			}
			
//			response.sendRedirect(request.getContextPath() + "#openModal");
			if(session.getAttribute("dest").equals("/member/sessionCheck")) {
				response.sendRedirect("/member/noSession");
			} else {
				response.sendRedirect("/#openModal");
			}
			return false;
		}
		return true;
	}

	private void saveDest(HttpServletRequest request) {
		String uri = request.getRequestURI();
		String query = request.getQueryString();
		if(query == null || query.equals("null")) {
			query = "";
		} else {
			query = "?" + query;
		}
		
		if(request.getMethod().equals("GET")) {
			logger.info("dest: " + (uri + query));
			request.getSession().setAttribute("dest", uri + query);
		}
	}
}
