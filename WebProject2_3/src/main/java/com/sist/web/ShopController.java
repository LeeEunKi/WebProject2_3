package com.sist.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ShopController {
	@GetMapping("shop/list.do")
	public String shop_list() {
		return "shop/list";
	}
	//쿠키용
	@GetMapping("shop/detail_before.do")
	public String shop_detail_before(int no, RedirectAttributes ra, HttpServletResponse response) {
		Cookie cookie = new Cookie("usedbook"+no, String.valueOf(no));
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		
		ra.addAttribute("no",no);
		return "redirect:../shop/detail.do";
	}
	@GetMapping("shop/detail.do")
	public String shop_detail(int no, Model model) {
		model.addAttribute("no",no);
		return "shop/detail";
	}
}
