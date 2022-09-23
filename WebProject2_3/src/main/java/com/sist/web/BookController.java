package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;

@Controller
public class BookController {
	@Autowired
	private BookDAO dao;
	
	@GetMapping("book/search.do")
	public String bookSearch()
	{
		return "book/search";
	}
	
	@GetMapping("book/totalsearch.do")
	public String totalSearch()
	{
		return "book/totalsearch";
	}
	
	@GetMapping("book/detail.do")
	public String bookDetail(int no,Model model)
	{
		model.addAttribute("no",no);
		return "book/detail";
	}
}
