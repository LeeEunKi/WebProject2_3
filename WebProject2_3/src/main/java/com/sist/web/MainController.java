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
		List<BookVO> tlist=bdao.TodayBooks();
		List<BookVO> tlist2=bdao.TodayBooks();
		
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
		for(BookVO vo:tlist)
		{
			String title=vo.getTitle();
			String desc=vo.getDescription();
			if(title.length()>16)
			{
				title=title.substring(0,16)+"...";
				vo.setTitle(title);
			}
			if(desc.length()>120) {
				desc=desc.substring(0, 120)+"...";
				vo.setDescription(desc);
			}
			vo.setDescription(desc);
			vo.setAuthor(title);
		}
		for(BookVO vo:tlist2)
		{
			String title=vo.getTitle();
			String desc=vo.getDescription();
			if(title.length()>16)
			{
				title=title.substring(0,16)+"...";
				vo.setTitle(title);
			}
			if(desc.length()>120) {
				desc=desc.substring(0, 120)+"...";
				vo.setDescription(desc);
			}
			vo.setDescription(desc);
			vo.setAuthor(title);
		}
		model.addAttribute("bhlist",blist);
		model.addAttribute("rlist", rlist);
		model.addAttribute("tlist", tlist);
		model.addAttribute("tlist2", tlist2);
		return "main";
	}
}
