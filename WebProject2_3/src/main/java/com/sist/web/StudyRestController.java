package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;

@RestController
public class StudyRestController {
	@Autowired
	private StudyDAO dao;
	
	
	@GetMapping(value = "study/room_state.do", produces = "text/plain;charset=utf-8")
	public String study_room_state(int type) {
		String result= "";
		
		
		
		
		return result;
	}

}
