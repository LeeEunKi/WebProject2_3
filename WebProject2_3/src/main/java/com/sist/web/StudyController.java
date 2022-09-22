package com.sist.web;

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
			 System.out.println("0/100="+0/100);
			 vo.setUse(vo.getUsed_seat()/vo.getTotal_seat()*100);
			 
			 System.out.println("이름"+vo.getName());
			 System.out.println("번호"+vo.getNo());
			 System.out.println("총좌석"+vo.getTotal_seat());
			 System.out.println("사용좌석"+vo.getUsed_seat());
			 System.out.println("이용률"+vo.getUse()+"%");
		 }
		 
		 model.addAttribute("list", list);
		 
		return "study/room_list";
	}

}
