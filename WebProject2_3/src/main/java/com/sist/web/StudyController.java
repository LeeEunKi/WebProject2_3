package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StudyController {
	
	@GetMapping("study/room_list.do")
	public String main_main() {
		return "study/room_list";
	}
}
