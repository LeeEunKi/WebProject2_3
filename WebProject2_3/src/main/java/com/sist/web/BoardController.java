package com.sist.web;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.dao.BoardDAO;
import com.sist.vo.BoardVO;

@Controller
public class BoardController {
	@Autowired
	private BoardDAO dao;
	
	//사용자 요청 받기 => URI를 통하여 사용자의 요청을 받음
	@GetMapping("board/list.do")
	//사용자에게 받은 주소가 board/list.do 라면 어떤 역할을 수행할건지??
	public String board_list()
	{
		return "board/list";
	}
	

	@GetMapping("board/insert.do")
	public String board_insert()
	{
		
		return "board/insert";
	}
	
	@GetMapping("board/detail.do")
	public String board_detail(int no,Model model)
	{
		//model을 이용해서 no값 넘기기
		model.addAttribute("no",no);
		return "board/detail";
	}
	
	   @GetMapping("board/update.do")
	   public String board_update(int no,Model model)
	   {
		   model.addAttribute("no", no);
		   return "board/update";
	   }
	   
	   @GetMapping("board/delete.do")
	   public String board_delete(int no,Model model)
	   {
		   model.addAttribute("no", no);
		   return "board/delete";
	   }
	   // Vue / React ==> 화면 변경 (Router)
	   // View단 ,서버단 , DB단 
	   @GetMapping("mypage/mypage.do")
	   public String mypageboardListData()
	   {
		   return "mypage/mypage";//forward => request를 전송 
	   }

	}


