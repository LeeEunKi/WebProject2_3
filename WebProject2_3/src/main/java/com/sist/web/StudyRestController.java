package com.sist.web;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;

import javax.servlet.http.HttpSession;

import com.sist.dao.*;
import com.sist.vo.*;

@RestController
public class StudyRestController {
	@Autowired
	private StudyDAO dao;
	
	@GetMapping(value = "study/room_state.do", produces = "text/plain;charset=utf-8")
	public String study_room_state(int room_no,HttpSession session) {
		String result= "";
		
		List<SeatVO> list=dao.seatInfoData(room_no);
		String name=(String)session.getAttribute("name");
		
		JSONArray arr=new JSONArray();
		int k=1;
		for(SeatVO vo:list) {
			JSONObject obj=new JSONObject();
			obj.put("no", vo.getNo());
			obj.put("state",vo.getState());
			obj.put("room_no",vo.getRoom_no());
			if(k==1) {
				obj.put("member_name", name);
			}
			k++;
			arr.add(obj);
		}
		result=arr.toJSONString();
		return result;
	}
	
	@GetMapping(value = "study/room_booking.do", produces = "text/plain;charset=utf-8")
	public String study_room_booking(BookingVO vo,int type,HttpSession session) {
		
		// type = 1 예약
		// type = 2 예약 취소
		String result="ok";
		String id=(String)session.getAttribute("id");
		vo.setMember_id(id); 
		
		Map map=new HashMap();
		map.put("no",vo.getSeat_no());
		map.put("room_no", vo.getRoom_no());
		
		//예약
		if(type == 1) {
			//예약한 좌석이 있을시 리턴
			int cnt=dao.bookingCheckID(vo.getMember_id());
			if(cnt>0) {
				return "NO";
			}

			dao.bookingRoom(vo);
			// 좌석 상태 토글
			map.put("state", "occupied");
			dao.seatStateChange(map);
			dao.roomRemainSeatDecrease(vo.getRoom_no());
		}
		//예약 취소
		else if(type ==2) {
			// 좌석 상태 토글
			map.put("state", "remained");
			dao.seatStateChange(map);
			dao.roomRemainSeatIncrease(vo.getRoom_no());
		}
		
		return result;
	}
}
