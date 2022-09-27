package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;

@Controller
public class MainController {
	@Autowired
	private StudyDAO dao;
	
	@Autowired
	private BookDAO bdao;
	
	@GetMapping("main/main.do")
	public String main_main(Model model) {
		List<RoomVO> rlist=dao.roomAllListData();
		List<BookVO> blist=bdao.mainHitBookData();
		for(BookVO vo:blist)
		{
			String author=vo.getAuthor();
			if(author.length()>6)
			{
				author=author.substring(0,6)+"...";
				vo.setAuthor(author);
			}
			vo.setAuthor(author);
		}
		model.addAttribute("bhlist",blist);
		model.addAttribute("rlist", rlist);
		return "main";
	}
}
