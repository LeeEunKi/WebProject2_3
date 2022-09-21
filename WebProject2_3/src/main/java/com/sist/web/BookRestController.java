package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.BookDAO;
import com.sist.vo.BookVO;

import oracle.net.aso.k;
import oracle.net.aso.v;

@RestController
public class BookRestController {
	@Autowired
	private BookDAO dao;
	
	@GetMapping(value = "book/search_vue.do",produces = "text/plain;charset=utf-8")
	public String bookSearch(String page)
	{
		String result="";
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		
		Map map=new HashMap();
		int rowSize=10;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		
		map.put("start", start);
		map.put("end", end);
		
		List<BookVO> list=dao.bookListData(map);
		int totalpage=dao.bookTotalPage();
		
		JSONArray arr=new JSONArray();
		//List => Array
		int k=0;
		for(BookVO vo:list)
		{
			/*
			 no,title,author,type,publisher,
			 img,TO_CHAR(regdate,'YYYY-MM-DD') AS dbday
			 */
			JSONObject obj=new JSONObject();
			obj.put("no", vo.getNo());
			obj.put("title", vo.getTitle());
			obj.put("author", vo.getAuthor());
			obj.put("type", vo.getType());
			obj.put("publisher", vo.getPublisher());
			obj.put("img", vo.getImg());
			obj.put("dbday", vo.getDbday());
			
			if(k==0)
			{
				obj.put("curpage", curpage);
				obj.put("totalpage", totalpage);
			}
			arr.add(obj);
			k++;
		}
		result=arr.toJSONString();
		
		return result;
	}
	
	@GetMapping(value = "book/detail_vue.do",produces = "text/plain;charset=UTF-8")
	public String detail_vue(int no)
	{
		String result="";
		try
		{
			/*
			 * no,title,author,type,publisher,img,TO_CHAR(pub_date,'YYYY-MM-DD') AS dbday, description
			 */
			BookVO vo=dao.bookDetailData(no);
			JSONObject obj=new JSONObject();
			obj.put("no", no);
			obj.put("title", vo.getTitle());
			obj.put("author", vo.getAuthor());
			obj.put("type", vo.getType());
			obj.put("publisher", vo.getPublisher());
			obj.put("img", vo.getImg());
			obj.put("dbday", vo.getDbday());
			obj.put("description", vo.getDescription());
			
			result=obj.toJSONString();
		}
		catch (Exception e) {}
		return result;
	}
}
