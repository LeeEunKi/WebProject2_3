package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
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
		
		BookVO vo=dao.bookDetailData(no);
		int loancnt=vo.getLoancnt();
		
		model.addAttribute("loancnt",loancnt);
		model.addAttribute("no",no);
		return "book/detail";
	}
	
	@PostMapping("book/insertLike.do")
	public String book_like_insert(HttpServletRequest request, HttpSession session)
	{
//		<input type="hidden" :value="vo.no" name="book_no">
//      	<input type="hidden" :value="vo.title" name="title">
//      	<input type="hidden" :value="vo.img" name="img">
//      	<input type="hidden" :value="vo.author" name="author">
//      	<input type="hidden" :value="vo.type" name="type">
		String id=(String)session.getAttribute("id");
		
		String book_no=request.getParameter("book_no");
		String title=request.getParameter("title");
		String img=request.getParameter("img");
		String author=request.getParameter("author");
		String type=request.getParameter("type");
		
		Map map=new HashMap();
		map.put("book_no", Integer.parseInt(book_no));
		map.put("member_id", id);
		map.put("title", title);
		map.put("img", img);
		map.put("author", author);
		map.put("type", type);	
		
		ldao.bookLikeInsert(Integer.parseInt(book_no),map);
		
		return "redirect:../book/detail.do?no="+book_no; 
		
	}
	
	@GetMapping("book/like.do")
	public String book_like(HttpSession session,Model model)
	{
		String id=(String)session.getAttribute("id");
		//WHERE book_no=#{no} AND member_id=#{member_id}
		//public BookVO loanBookInfoData(Map map);
		
		List<BookLikeVO> list=ldao.booklikeList(id);
		for(BookLikeVO vo:list)
		{
			String title1=vo.getTitle();
			if(title1.length()>18)
			{
				title1=title1.substring(0,18)+"...";
				vo.setTitle(title1);
			}
			vo.setTitle(title1);
			
			String author=vo.getAuthor();
			if(author.length()>7)
			{
				author=author.substring(0,7)+"...";
				vo.setAuthor(author);
			}
			vo.setAuthor(author);
		}
		
		int likeChk=ldao.likeCountCheck(id);
		
		model.addAttribute("list", list);
		model.addAttribute("likeChk",likeChk);
		return "book/like";
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
	
	
	@PostMapping("book/insertLoan.do")
	public String book_insertLoan(HttpServletRequest request,HttpSession session)
	{
		String id=(String)session.getAttribute("id");
//	 	<input type="hidden" value="${vo.no }" name="book_no">
//      <input type="hidden" value="${vo.title }" name="title">
//      <input type="hidden" value="${vo.img }" name="img">
//      <input type="hidden" value="${vo.author }" name="author">
		String book_no=request.getParameter("book_no");
		String title=request.getParameter("title");
		String img=request.getParameter("img");
		String author=request.getParameter("author");
		
		System.out.println(book_no);
		System.out.println(title);
		System.out.println(img);
		System.out.println(author);
		
		Map map=new HashMap();
		map.put("book_no", Integer.parseInt(book_no));
		map.put("member_id", id);
		map.put("title", title);
		map.put("img", img);
		map.put("author", author);
		loandao.bookLoanInsert(Integer.parseInt(book_no), map);
		
		return "redirect:../book/loan.do";
	}
	
	@GetMapping("book/loan.do")
	public String book_loan(HttpSession session,Model model)
	{
		String id=(String)session.getAttribute("id");
		//WHERE book_no=#{no} AND member_id=#{member_id}
		//public BookVO loanBookInfoData(Map map);
		
		List<BookLoanVO> list=loandao.loanBookInfoData(id);
		for(BookLoanVO vo:list)
		{
			String title1=vo.getTitle();
			if(title1.length()>14)
			{
				title1=title1.substring(0,14)+"...";
				vo.setTitle(title1);
			}
			vo.setTitle(title1);
			
			String author=vo.getAuthor();
			if(author.length()>6)
			{
				author=author.substring(0,6)+"...";
				vo.setAuthor(author);
			}
			vo.setAuthor(author);
		}
		
		int loanChk=loandao.loanCountCheck(id);
		
		model.addAttribute("list", list);
		model.addAttribute("loanChk",loanChk);
		return "book/loan";
		
	}
	
	
	@GetMapping("book/deleteLoan.do")
	public String book_deleteLoan(int no,HttpSession session)
	{
		String id=(String)session.getAttribute("id");
		Map map=new HashMap();
		map.put("book_no", no);
		map.put("member_id", id);
		loandao.bookloanDelete(no, map);
		
		return "redirect:../book/detail.do?no="+no;
	}
	
}
