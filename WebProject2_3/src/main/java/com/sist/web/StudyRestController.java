package com.sist.web;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
	public String study_room_state(int room_no) {
		String result= "";
		
		List<SeatVO> list=dao.seatInfoData(room_no);
		JSONArray arr=new JSONArray();
		for(SeatVO vo:list) {
			JSONObject obj=new JSONObject();
			obj.put("no", vo.getNo());
			obj.put("state",vo.getState());
			obj.put("room_no",vo.getRoom_no());
			arr.add(obj);
		}
		result=arr.toJSONString();
		return result;
	}



}
