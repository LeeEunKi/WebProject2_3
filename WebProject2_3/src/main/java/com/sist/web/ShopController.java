package com.sist.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ShopController {
	@Autowired
	private ShopDAO dao;
	
	//중고책 목록 출력
	@GetMapping("shop/list.do")
	public String shop_list() {
		return "shop/list";
	}
	
	//쿠키 저장
	@GetMapping("shop/detail_before.do")
	public String shop_detail_before(int no, RedirectAttributes ra, HttpServletResponse response) {
		Cookie cookie = new Cookie("usedbook"+no, String.valueOf(no));
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		
		ra.addAttribute("no",no);
		return "redirect:../shop/detail.do";
	}
	
	//중고책 상세 페이지
	@GetMapping("shop/detail.do")
	public String shop_detail(int no, Model model) {
		model.addAttribute("no",no);
		return "shop/detail";
	}
	
	//출판사별 목록
	@GetMapping("shop/publisher_list.do")
	public String publisher_list(String publisher, Model model) {
		model.addAttribute("publisher", publisher);
		return "shop/publisher_list";
	}
	@RequestMapping("shop/purchase.do")
	public void purchase(HttpServletRequest request, HttpSession session) {
		String name = (String)session.getAttribute("name");
		String id = (String)session.getAttribute("id");
		String[] usedBooks = request.getParameterValues("usedbooks");
		List <CartVO> list = (List <CartVO>) session.getAttribute("cart");
		if(usedBooks!=null && usedBooks.length>0){
			for(int i=0;i<usedBooks.length;i++) {
				int no = Integer.parseInt(usedBooks[i]);
				dao.purchase(no);
				for(CartVO vo:list) {
					if(vo.getNo()==Integer.parseInt(usedBooks[i])) {
						list.remove(vo);
					}
				}
				System.out.println(no+"번 책 구매처리 완료");
			}
		  }
		
		request.setAttribute("name",name);
	    request.setAttribute("id",id);
	    request.setAttribute("phone","10124");
	    request.setAttribute("totalPrice",100);
	    request.setAttribute("address","dfaddaf");
		
//		return "shop/purchase";
	}
	
	//중고책 장바구니
	@GetMapping("shop/cart_list.do")
	public String shop_cart_list(String no, HttpSession session, Model model) {
		if(no==null) 
			no="1";
		int no_ = Integer.parseInt(no);
		List<CartVO> list = (List<CartVO>)session.getAttribute("cart");
		if(list!=null) {
			for(CartVO vo:list) {
				//저자 길이 자르기
				String author = vo.getAuthor();
				if(author.length()>15) {
					author = author.substring(0,15)+"..";
				}
				vo.setAuthor(author);
				//출판사 길이 자르기
				String publisher = vo.getPublisher();
				if(publisher.length()>15) {
					publisher = publisher.substring(0,15)+"..";
				}
				vo.setPublisher(publisher);
			}
		}
	    model.addAttribute("no", no_);
	    model.addAttribute("list", list);
	    return "shop/mycart";
	}
	@GetMapping("shop/cart_insert.do")
	public String shop_cart_insert(int no, HttpSession session, Model model) {
	  List <CartVO> list = (List <CartVO>) session.getAttribute("cart");
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
	  cvo.setPublisher(vo.getPublisher());
	  cvo.setAuthor(vo.getAuthor());

	  boolean bCheck = false;
	  for (CartVO avo: list) { 
		  //이미 장바구니에 있는걸 담은 경우
	    if (avo.getNo() == cvo.getNo()) {
	      bCheck = true;
	      break;
	    }
	  }
	  //새로운 상품을 담은 경우
	  if (bCheck == false) {
	    list.add(cvo);
	    session.setAttribute("cart", list);
	    session.setMaxInactiveInterval(60*60*24);
	  }
	  //데이터 전송
	  //		model.addAttribute("list",list);
	  //		model.addAttribute("no",no);
	  //redirect가 나올 때는 Model로 보내 주면 안된다. request가 초기화된 후 전송되니까...불가능함.
	  return "redirect:../shop/cart_list.do?no=" + no;
	}
	
	@GetMapping("shop/cart_cancel.do")
	public String cart_cancel(int no, HttpSession session) {
	  List <CartVO> list = (List <CartVO> ) session.getAttribute("cart");
	  for (int i = 0; i < list.size(); i++) {
	    CartVO vo = list.get(i);
	    if (vo.getNo() == no) {
	      list.remove(i);
	    }
	  }
	  return "redirect:cart_list.do?no=" + no;
	}
}
