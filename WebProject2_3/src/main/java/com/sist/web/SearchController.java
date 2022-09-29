package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SearchController {
	
	@GetMapping("search/search.do")
	public String search_search() {
		
		return "search/search";
	}
}
