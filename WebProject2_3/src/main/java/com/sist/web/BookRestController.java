package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.BookDAO;
import com.sist.dao.BookLikeDAO;
import com.sist.vo.BookVO;

import oracle.net.aso.k;
import oracle.net.aso.v;

@RestController
public class BookRestController {
	@Autowired
	private BookDAO dao;
	
	@Autowired
	private BookLikeDAO ldao;
	
	@GetMapping(value = "book/search_vue.do",produces = "text/plain;charset=utf-8")
	public String bookSearch(String page, HttpSession session)
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
			obj.put("loancnt", vo.getLoancnt());
			
			
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
	
	@RequestMapping(value = "book/totalsearch_vue.do", produces = "text/plain;charset=UTF-8")
	public String totalsearch_vue(String page,String title)
	{

		String result="";
		if(page==null)
			page="1";
		if(title==null)
			title="행복";
		
		int curpage=Integer.parseInt(page);
		int rowSize=16;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("title", title);
		
		List<BookVO> list=dao.bookNameFindData(map);
		int totalpage=dao.bookNameTotalpage(title);
		
		JSONArray arr=new JSONArray();
		int k=0;
		for(BookVO vo:list)
		{
			String title1=vo.getTitle();
			if(title1.length()>16)
			{
				title1=title1.substring(0,16)+"...";
				vo.setTitle(title1);
			}
			vo.setTitle(title1);
			
			String author=vo.getAuthor();
			if(author.length()>7)
			{
				author=author.substring(0,author.lastIndexOf(")")+1)+" 외 다수";
				vo.setAuthor(author);
			}
			vo.setAuthor(author);
			
			//no,title,author,type,publisher,img
			JSONObject obj=new JSONObject();
			obj.put("no", vo.getNo());
			obj.put("title", vo.getTitle());
			obj.put("author", vo.getAuthor());
			obj.put("type", vo.getType());
			obj.put("publisher", vo.getPublisher());
			obj.put("img", vo.getImg());
			
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
	@RequestMapping(value = "book/authorsearch_vue.do", produces = "text/plain;charset=UTF-8")
	public String authorsearch_vue(String page,String author)
	{
		String result="";
		if(page==null)
			page="1";
		if(author==null)
			author="김";
		
		int curpage=Integer.parseInt(page);
		int rowSize=16;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("ss", author);
		
		List<BookVO> list=dao.bookauthorFindData(map);
		int totalpage=dao.bookauthorFindTotalPage(author);
		
		JSONArray arr=new JSONArray();
		int k=0;
		for(BookVO vo:list)
		{
			String title1=vo.getTitle();
			if(title1.length()>16)
			{
				title1=title1.substring(0,16)+"...";
				vo.setTitle(title1);
			}
			vo.setTitle(title1);
			
			String author1=vo.getAuthor();
			if(author1.length()>7)
			{
				author1=author1.substring(0,author1.lastIndexOf(")")+1)+" 외 다수";
				vo.setAuthor(author1);
			}
			vo.setAuthor(author1);
			
			//no,title,author,type,publisher,img
			JSONObject obj=new JSONObject();
			obj.put("no", vo.getNo());
			obj.put("title", vo.getTitle());
			obj.put("author", vo.getAuthor());
			obj.put("type", vo.getType());
			obj.put("publisher", vo.getPublisher());
			obj.put("img", vo.getImg());
			
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
	
	
		
	@GetMapping(value = "book/detail_info.do",produces = "text/plain;charset=UTF-8")
	public String detail_info_vue(int no,HttpSession session)
	{
		String id=(String)session.getAttribute("id");
		
		String result="";
		try
		{
			
			Map map=new HashMap();
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
			//좋아요 체크
			map.put("member_id", id);
			map.put("book_no", vo.getNo());
			
			//int lCheck=ldao.likeCheck(map); 
			//obj.put("lCheck", lCheck);
			 
			
			result=obj.toJSONString();
		}
		catch (Exception e) {}
		return result;
	}
}
