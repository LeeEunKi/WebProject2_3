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
	
	@GetMapping("main/main.do")
	public String main_main(Model model) {
		List<RoomVO> rlist=dao.roomAllListData();
		
		model.addAttribute("rlist", rlist);
		return "main";
	}
}
