package com.sist.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

import com.sist.dao.ShopDAO;
import com.sist.vo.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ShopController {
	@Autowired
	private ShopDAO dao;
	
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
	@GetMapping("shop/cart_list.do")
	public String shop_cart_list(int no, HttpSession session, Model model) {
		List<CartVO> list = (List<CartVO>)session.getAttribute("cart");
	    model.addAttribute("no", no);
	    model.addAttribute("list", list);
	    return "shop/mycart";
	}
	@GetMapping("shop/cart_insert.do")
	public String shop_cart_insert(int no, HttpSession session, Model model) {
	  List <CartVO> list = (List <CartVO> ) session.getAttribute("cart");
	  //처음 이후에는 세션에 저장된 데이터를 불러옴 -> 맨 처음에만 메모리 할당을 하도록 한다.
	  if (list == null) {
	    list = new ArrayList <CartVO> ();
	  }
	  //name, poster, price
	  ShopVO vo = dao.shopDetailData(no);
	  CartVO cvo = new CartVO();
	  cvo.setNo(no);
	  cvo.setName(vo.getTitle());
	  cvo.setPoster(vo.getImg());
	  cvo.setPrice(vo.getDiscount());

	  boolean bCheck = false;
	  for (CartVO avo: list) {
	    //이미 장바구니에 들어가 있는 상품을 또 담은 경우 수량만 증가시킨다
	    if (avo.getNo() == cvo.getNo()) {
	    	//어떻게 하지???
	      bCheck = true;
	      break;
	    }
	  }
	  //새로운 상품을 담은 경우
	  if (bCheck == false) {
	    list.add(cvo);
	    session.setAttribute("cart", list);
	  }
	  //데이터 전송
	  //		model.addAttribute("list",list);
	  //		model.addAttribute("no",no);
	  //redirect가 나올 때는 Model로 보내 주면 안된다. request가 초기화된 후 전송되니까...불가능함.
	  return "redirect:../shop/cart_list.do?no=" + no;
	}
}
