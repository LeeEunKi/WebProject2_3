package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.*;

import javax.servlet.http.HttpSession;

import com.sist.dao.*;
import com.sist.vo.*;

@Controller
public class BookController {
	@Autowired
	private BookDAO dao;
	
	@Autowired
	private BookLikeDAO ldao;
	
	@Autowired
	private BookLoanDAO loandao;
	
	//인기검색
	@GetMapping("book/search.do")
	public String bookSearch()
	{
		return "book/search";
	}
	//도서명 검색
	@GetMapping("book/totalsearch.do")
	public String totalSearch()
	{
		return "book/totalsearch";
	}
	//저자명 검색
	@GetMapping("book/authorsearch.do")
	public String authorsearch()
	{
		return "book/authorsearch";
	}
	//상세보기 
	@GetMapping("book/detail.do")
	public String bookDetail(int no,Model model,HttpSession session)
	{
		String id=(String)session.getAttribute("id");
		Map map=new HashMap();
		
		if(id!=null) {
			map.put("book_no", no);
			map.put("member_id", id);
			int lcheck=ldao.likeCheck(map);
			model.addAttribute("lcheck",lcheck);
		}
		
		
		
		model.addAttribute("no",no);
		return "book/detail";
	}
	
	@GetMapping("book/bookLikeInsert.do")
	public String book_like_insert(int no,HttpSession session)
	{
		String id=(String)session.getAttribute("id");
		Map map=new HashMap();
		map.put("book_no", no);
		map.put("member_id", id);
		ldao.bookLikeInsert(no,map);
		
		return "redirect:../book/detail.do?no="+no; 
		
	}
	@GetMapping("book/bookDisLikeInsert.do")
	public String book_dislike_insert(int no,HttpSession session)
	{
		String id=(String)session.getAttribute("id");
		Map map=new HashMap();
		map.put("book_no", no);
		map.put("member_id", id);
		ldao.bookLikeDelete(no,map);
		
		return "redirect:../book/detail.do?no="+no;
		
	}
	//주제별 검색
	@GetMapping("book/categorysearch.do")
	public String book_category()
	{
		return "book/categorysearch";
	}
	
	
	@GetMapping("book/insertLoan.do")
	public String book_insertLoan(int no,HttpSession session)
	{
		String id=(String)session.getAttribute("id");
		Map map=new HashMap();
		map.put("book_no", no);
		map.put("member_id", id);
		loandao.bookLoanInsert(no, map);
		
		return "redirect:../book/loan.do";
	}
	
}
