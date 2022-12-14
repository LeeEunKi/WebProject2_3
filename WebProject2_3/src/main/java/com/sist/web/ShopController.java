package com.sist.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

import com.sist.dao.*;
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
	@Autowired
	private MemberDAO mDao;
	
	//중고책 목록 출력
	@GetMapping("shop/list.do")
	public String shop_list(String page, Model model) {
		if(page==null)
			page="1";
		model.addAttribute("curPage",Integer.parseInt(page));
		return "shop/list";
	}
	
	//쿠키 저장
	@GetMapping("shop/detail_before.do")
	public String shop_detail_before(int no, String page, RedirectAttributes ra, HttpServletResponse response) {
		if(page==null)
			page="1";
		int _page = Integer.parseInt(page);
		Cookie cookie = new Cookie("usedbook"+no, String.valueOf(no));
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		
		ra.addAttribute("no",no);
		ra.addAttribute("page",_page);
		return "redirect:../shop/detail.do"; //shop/detail.do?no=..로 보내줌
	}
	
	//중고책 상세 페이지
	@GetMapping("shop/detail.do")
	public String shop_detail(int no, int page, Model model) {
		ShopVO vo = dao.shopDetailData(no);
		model.addAttribute("no",no);
		model.addAttribute("booktitle",vo.getTitle());
		model.addAttribute("page",page);
		return "shop/detail";
	}
	
	//출판사별 목록
	@GetMapping("shop/publisher_list.do")
	public String publisher_list(String publisher, Model model) {
		model.addAttribute("publisher", publisher);
		return "shop/publisher_list";
	}
	
	//중고책 장바구니
	@GetMapping("shop/cart_list.do")
	public String shop_cart_list(String no, HttpSession session, Model model) {
		if(no==null) 
			no="0";
		int no_ = Integer.parseInt(no);
		List<CartVO> list = (List<CartVO>)session.getAttribute("cart");
		int listsize = 0;
		if(list!=null) {
			listsize = list.size();
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
	    model.addAttribute("listsize",listsize);
	    return "shop/mycart";
	}
	@GetMapping("shop/cart_insert.do")
	public String shop_cart_insert(int no, HttpSession session, RedirectAttributes ra) {
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
	  cvo.setPrice(vo.getPrice());
	  cvo.setPublisher(vo.getPublisher());
	  cvo.setAuthor(vo.getAuthor());
	  cvo.setCondition(vo.getCondition());
	  cvo.setDiscount(vo.getDiscount());
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
	  System.out.println("------현재 장바구니에 들어 있는 책 목록------");
	  for(CartVO ccvo:list) {
		  System.out.println(ccvo.getName());
	  }
	  System.out.println("-----------------------------------");
	  //데이터 전송
	  //redirect가 나올 때는 Model로 보내 주면 안된다. request가 초기화된 후 전송되니까...불가능함.
	  return "redirect:../shop/cart_list.do?no=" + no;
	}
	
	//장바구니 담기 취소
	@GetMapping("shop/cart_cancel.do")
	public String cart_cancel(int no, HttpSession session) {
	  List <CartVO> list = (List <CartVO> ) session.getAttribute("cart");
	  for (int i = 0; i < list.size(); i++) {
	    CartVO vo = list.get(i);
	    if (vo.getNo() == no) {
	      list.remove(i);
	    }
	  }
	  return "redirect:../shop/cart_list.do?no=" + no;
	}
	
	//구매 처리
	@RequestMapping("shop/purchase.do")
	public String purchase(HttpServletRequest request, HttpSession session) {
		String name = (String)session.getAttribute("name");
		String id = (String)session.getAttribute("id");

		String[] usedBooks = request.getParameterValues("usedbooks");
		List <CartVO> list = (List <CartVO>) session.getAttribute("cart");
		for(CartVO vo:list) {
			System.out.println(vo.getName());
		}
		int totalPrice = 0;
		//체크한 상품목록을 불러와서 구매처리 한다
		int cnt = usedBooks.length;
		System.out.println("선택한 책 수:"+usedBooks.length);
		if(usedBooks!=null && usedBooks.length>0){
			for(String u:usedBooks) {
				int no = Integer.parseInt(u);
				System.out.println("usedBooks[i]:"+u);
				//Usedbook 테이블에서 해당 책 판매 상태 변경
				dao.changeState(no);
				OrderVO vo = new OrderVO();
				
				//책 정보를 가져와서 OrderVO에 넣는다
				ShopVO svo = dao.shopDetailData(no);
				vo.setUsedbook_no(no);
				vo.setMember_id((String)session.getAttribute("id"));
				vo.setPrice(svo.getDiscount());
				
				//결제 모듈에 보낼 전체 금액 계산
				totalPrice += svo.getDiscount();
				
				//Order 테이블에 row 추가
				dao.purchaseInsert(vo);
				System.out.println(no+"번 책 구매처리 완료");
				
				//구매한 책은 장바구니에서 삭제
				for(int i=0;i<list.size();i++) {
					if(list.get(i).getNo()==no) {
						list.remove(i);
					}
				}
			}
		  }
		
		//결제 창으로 전송할 멤버 정보를 가져와서 전달
		MemberVO mvo = mDao.memberUpdateData(id);
		request.setAttribute("name",name);
	    request.setAttribute("id",id);
	    request.setAttribute("totalPrice",totalPrice);
	    request.setAttribute("address",mvo.getAddr1()+mvo.getAddr2());
	    request.setAttribute("phone", mvo.getTel());
	    request.setAttribute("postcode", mvo.getPost());
		
		return "shop/purchase";
	}
	
	//중고책 구매내역
	@GetMapping("mypage/order.do")
	public String mypage_order(Model model, HttpSession session) {
		String member_id = (String)session.getAttribute("id");
		List<OrderVO> oList = dao.orderListData(member_id);
		int listsize = oList.size();
		for(OrderVO ovo:oList) {
			int no = ovo.getUsedbook_no();
			ShopVO vo = dao.shopDetailData(no);
			ovo.setTitle(vo.getTitle());
			ovo.setAuthor(vo.getAuthor());
			ovo.setPublisher(vo.getPublisher());
			ovo.setPoster(vo.getImg());
		}
		model.addAttribute("list",oList);
		model.addAttribute("listsize",listsize);
		return "mypage/order";
	}
	
	//중고책 주문취소
	@GetMapping("shop/order_cancel.do")
	public String shop_order_cancel(int no, int usedbook_no) {
		dao.orderCancel(no, usedbook_no);
		return "redirect:../mypage/order.do";
	}
}
