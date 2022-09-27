package com.sist.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ShopInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Object no = request.getAttribute("no");
		String s = no.toString();
		Cookie cookie = new Cookie("usedbook"+s, s);
		System.out.println("pre쿠키이름:"+cookie.getName());
		System.out.println("pre쿠키값:"+cookie.getValue());
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		return super.preHandle(request, response, handler);
	}
}
