package com.sist.web;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;

@Controller
public class StudyController {
	@Autowired
	private StudyDAO dao;
	
	@GetMapping("study/room_list.do")
	public String study_room_list(Model model) {
		
		List<RoomVO> list=dao.roomAllListData(); 
		 for(RoomVO vo:list) {
			 vo.setUsed_seat(vo.getTotal_seat()-vo.getRemain_seat());
			 vo.setUse((double)(vo.getUsed_seat())/(double)(vo.getTotal_seat())*100);
		 }
		 
		model.addAttribute("list", list);
		 
		return "study/room_list";
	}
	
	
}
