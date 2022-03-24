package com.greenrecipe.main.interceptor;

//자동 login

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
// import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.greenrecipe.main.member.dto.BuyerDTO;
import com.greenrecipe.main.member.service.MemberService;
import com.greenrecipe.main.session_name.MemberSessionName;

@Configuration
public class AutoLoginInterceptor extends HandlerInterceptorAdapter implements MemberSessionName {
	@Autowired MemberService ms;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		
		if(loginCookie != null) {
			BuyerDTO buyerdto = ms.BuyerSession(loginCookie.getValue());
			System.out.println("buyerdto : " + buyerdto);
			if(buyerdto != null) {
				HttpSession session = request.getSession();
				session.setAttribute(LOGIN, buyerdto.getBuyer_id());
				System.out.println("buyerdto null 아님");
			}
		}
		
		System.out.println("-----test-----");
		
		return true;
	}
	
}