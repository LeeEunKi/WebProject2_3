package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.SearchDAO;
import com.sist.vo.BookVO;

@RestController
public class SearchRestController {
   @Autowired
   private SearchDAO dao;
   
   @GetMapping(value = "search/search_vue.do", produces = "text/plain;charset=utf-8")
   public String search_vue(String page,String ss,String str) {
	   	
	   	int curPage=Integer.parseInt(page);
	   	
	    String[] fsArr=str.split(",");
	    
	    Map map = new HashMap();
	    int rowSize=6;
	    int start=(rowSize*curPage)-(rowSize-1);
	    int end=(rowSize*curPage);
		map.put("ss", ss);
		map.put("fsArr",fsArr);
		map.put("start",start);
		map.put("end",end);
		
		int count=dao.findDataCount(map) ;
		int totalPage=(int)Math.ceil(count/6.0);
		List<BookVO> list=dao.integratedSearch(map);
		
		final int BLOCK = 5;
		int startPage=((curPage-1)/BLOCK*BLOCK)+1;
		int endPage=((curPage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalPage)
			endPage=totalPage;
		
		JSONArray arr=new JSONArray();
		int k=1;
		for(BookVO vo:list) {
			JSONObject obj=new JSONObject();
			obj.put("no", vo.getNo());
			obj.put("title", vo.getTitle());
			obj.put("author", vo.getAuthor());
			obj.put("publisher", vo.getPublisher());
			obj.put("type", vo.getType());
			obj.put("img", vo.getImg());
			if(k==1) {
				obj.put("ss", ss);
				obj.put("str", str);
				obj.put("curPage",curPage);
				obj.put("totalPage",totalPage);
				obj.put("count",count);
				obj.put("startPage", startPage);
				obj.put("endPage", endPage);
			}
			k++;
			arr.add(obj);
		}
		
		String result=arr.toJSONString();
	   return result;
   }
   
}
