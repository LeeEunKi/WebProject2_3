package com.sist.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.SearchDAO;
import com.sist.dao.ShopDAO;
import com.sist.manager.MovieManager;
import com.sist.vo.BookVO;

@RestController
public class SearchRestController {
   @Autowired
   private SearchDAO dao;
   
   @Autowired
   private MovieManager mgr;
   
   @Autowired
   private ShopDAO sDao;
   
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
		
		int count=dao.findDataCount(map);
		System.out.println(count);
		if(count==0) {
			JSONArray arr=new JSONArray();
			JSONObject obj=new JSONObject();
			
			obj.put("ss", ss);
			obj.put("str", str);
			obj.put("curPage",1);
			obj.put("totalPage",0);
			obj.put("count",count);
			
			arr.add(obj);
			
			return arr.toJSONString();
		}
   
		int totalPage=(int)Math.ceil(count/6.0);
		List<BookVO> list=dao.integratedSearch(map);
		JSONArray arr=new JSONArray();
		
		int k=1;
		for (BookVO vo : list) {
			JSONObject obj = new JSONObject();
			
			int shop_no=sDao.getShopNo(vo.getNo());

			obj.put("shop_no", shop_no);
			obj.put("no", vo.getNo());
			obj.put("title", vo.getTitle());
			obj.put("author", vo.getAuthor());
			obj.put("publisher", vo.getPublisher());
			obj.put("type", vo.getType());
			obj.put("img", vo.getImg());
			if (k == 1) {
				obj.put("ss", ss);
				obj.put("str", str);
				obj.put("curPage", curPage);
				obj.put("totalPage", totalPage);
				obj.put("count", count);
			}
			k++;
			arr.add(obj);
		}
		
	   return arr.toJSONString();
   }
   
   @GetMapping(value = "search/search_moive_vue.do",produces = "text/plain;charset=utf-8")
   public String search_movie(String ss) throws ParseException {
	    String json = mgr.movieFind(ss);
		JSONParser jp = new JSONParser();
		JSONObject mObj = (JSONObject)jp.parse(json);

		JSONArray mArr = (JSONArray)mObj.get("items");
		JSONArray movies = new JSONArray();
		
		if(mArr.size()==0) {
			return movies.toJSONString();
		}
		
		for(int i=0; i<3;i++) {
			JSONObject movie=(JSONObject)mArr.get(i);
			movie.put("title",(String)movie.get("title"));
			movie.put("link",(String)movie.get("link"));
			movie.put("image",(String)movie.get("image"));
			movie.put("director",(String)movie.get("director"));
			movie.put("actor",(String)movie.get("actor"));
			movie.put("userRating",(String)movie.get("userRating"));
			
			movies.add(movie);
		}
	   
	   return movies.toJSONString();
   }
   
}
