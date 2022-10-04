package com.sist.web;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import oracle.jdbc.proxy.annotation.Post;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;

@Controller
public class SearchController {
	@Autowired 
	private SearchDAO dao;
	
	@RequestMapping("search/search.do")
	public String search_search(String ss,String[] checked, Model model) {
		String strArr="";
		if(ss==null)
			ss="";
		if(checked==null) {
			strArr="T";
		}
		else {
			for(int i=0; i<checked.length; i++) {
				strArr+=checked[i];
				if(i!=checked.length-1)
					strArr+=",";
			}
		}
		
		model.addAttribute("ss", ss);
		model.addAttribute("strArr", strArr);
		return "search/search";
	}
}
