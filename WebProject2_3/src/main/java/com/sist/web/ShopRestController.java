package com.sist.web;

import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import com.sist.vo.*;
import com.sist.dao.*;

@RestController
public class ShopRestController {
	@Autowired
	private ShopDAO dao;
	
	@GetMapping(value="shop/list_vue.do", produces="text/plain;charset=UTF-8")
	public String shop_list_vue(String page, String type) {
		if(page==null)
			page="1";
		if(type==null)
			type="";
		String[] types = {"","순수과학","역사","언어","총류","기술과학","종교","철학","문학","예술","사회과학"};
		int curPage = Integer.parseInt(page);
		Map map = new HashMap();
		int rowSize = 15;
		int start = curPage*rowSize - (rowSize-1);
		int end = curPage*rowSize;
		
		map.put("type",type);
		map.put("start",start);
		map.put("end",end);
		
		List<ShopVO> list = dao.shopListData(map);
		int cnt = dao.shopTotalCount(map);
		
		int totalPage = (int)Math.ceil(cnt/15.0);
		
		String result = "";
		JSONArray arr = new JSONArray();
		int k=0;
		for(ShopVO vo:list) {
			JSONObject obj = new JSONObject();
			obj.put("condition",vo.getCondition());
			obj.put("no",vo.getNo());
			
			//제목 길이 자르기
			String title = vo.getTitle();
			if(title.length()>20) {
				title = title.substring(0,20)+"..";
			}
			//저자 길이 자르기
			String author = vo.getAuthor();
			if(author.length()>10) {
				author = author.substring(0,10)+"..";
			}
			obj.put("title",title);
			obj.put("img",vo.getImg());
			obj.put("author",author);
			obj.put("publisher",vo.getPublisher());
			obj.put("discount",vo.getDiscount());
			obj.put("type",vo.getType());
			if(k==0) {
				obj.put("curPage",curPage);
				obj.put("totalPage",totalPage);
				obj.put("cnt",cnt);
			}
			arr.add(obj);
			k++;
		}
		result = arr.toJSONString();
		return result;
	}
	
	@GetMapping(value="shop/detail_vue.do", produces="text/plain;charset=UTF-8")
	public String shop_detail_vue(int no) {
		ShopVO vo = dao.shopDetailData(no);
		String result = "";
		JSONObject obj = new JSONObject();
		obj.put("book_no",vo.getBook_no());
		obj.put("no",no);
		obj.put("title",vo.getTitle());
		obj.put("img",vo.getImg());
		obj.put("author",vo.getAuthor());
		obj.put("publisher",vo.getPublisher());
		obj.put("price",vo.getPrice());
		obj.put("discount",vo.getDiscount());
		obj.put("type",vo.getType());
		
		result = obj.toJSONString();
		
		return result;
	}
	
	//쿠키 리스트
	@GetMapping(value="shop/cookie_list.do", produces="text/plain;charset=UTF-8")
	public String shop_cookie_list(HttpServletRequest request) {
		String result = "";
		Cookie[] cookies = request.getCookies();
		List<ShopVO> list = new ArrayList<ShopVO>();
		if(cookies!=null) {
			for(int i=cookies.length-1; i>=0; i--) {
				if(cookies[i].getName().startsWith("usedbook")) {
					String no = cookies[i].getValue();
					ShopVO vo = dao.shopDetailData(Integer.parseInt(no));
					list.add(vo);
				}
			}
		}
		//list -> JSON
		JSONArray arr = new JSONArray();
		for(ShopVO vo:list) {
			JSONObject obj = new JSONObject();
			obj.put("no",vo.getNo());
			obj.put("title",vo.getTitle());
			obj.put("img",vo.getImg());
			arr.add(obj);
		}
		result = arr.toJSONString();
		return result;
	}
}
