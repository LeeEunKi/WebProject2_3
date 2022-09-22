package com.sist.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;
import com.sist.mapper.*;
import com.sist.vo.*;

@Repository
public class StudyDAO {
	@Autowired
	private StudyMapper mapper;
	
	/*
	 * //모든 열람실 리스트 
	@Select("SELECT no,name,total_seat,remain_seat "
			+ "FROM room_3")*/
	public List<RoomVO> roomAllListData(){
		return mapper.roomAllListData();
	}
	/*
	// 열람실 상세
	@Select("SELECT no,name,total_seat,remain_seat "
			+ "FROM room_3 "
			+ "WHERE no=#{no}")*/
	public RoomVO roomListData(int no) {
		return mapper.roomListData(no);
	}
	
	/*
	 * //열람실 좌석 만들기
	@SelectKey(keyProperty = "no", resultType = int.class, before=true,
			statement = "SELECT NVL(MAX(no)+1,1) as no FROM seat_3")
	@Insert("insert into seat_3(no,state,room_no) "
			+ "values(#{no},'remained',#{room_no})")*/
	public void createRoomSeat(int room_no) {
		mapper.createRoomSeat(room_no);
	}
	
	/*
	 * // 열람실 좌석 상세
	@Select("SELECT no,state "
			+ "FROM seat_3"
			+ "WHERE room_no=#{room_no}")*/
	public List<SeatVO> seatInfoData(int room_no) {
		return mapper.seatInfoData(room_no);
	}
	

}
