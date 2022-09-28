package com.sist.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.text.SimpleDateFormat;
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
	//예약하기
	public void bookingRoom(BookingVO vo) {
		mapper.bookingRoom(vo);
	}
	/*
	 * 	/*
	 * 	//좌석 상태 토글
	@Update("UPDATE seat_3 SET "
			+ "state=${state} WHERE no=#{no} AND room_no=#{room_no}")*/
	public void seatStateChange(Map map) {
		mapper.seatStateChange(map);
	}
	/*
	//열람실 현황 업데이트
	//예약
	@Update("UPDATE room_3 SET "
			+ "remain_seat=remain_seat-1 "
			+ "WHERE no=#{no}")*/
	public void roomRemainSeatDecrease(int no) {
		mapper.roomRemainSeatDecrease(no);
	}
	
	//예약 취소 or 끝
	/*@Update("UPDATE room_3 SET "
			+ "remain_seat=remain_seat+1 "
			+ "WHERE no=#{no}")*/
	public void roomRemainSeatIncrease(int no) {
		mapper.roomRemainSeatIncrease(no);
	}
	
	// 예약 정보 가져오기
	/*@Select("SELECT booking_date,end_time "
			+ "FROM booking_3")*/
	public List<BookingVO> bookingGetInfo(){
		return mapper.bookingGetInfo();
	}
	
	//AOP 실시간 예약 취소
	public void bookingCancel(BookingVO vo) {
		mapper.bookingCancel(vo.getNo());
		//열람실 좌석 증가
		mapper.roomRemainSeatIncrease(vo.getRoom_no());
		Map map=new HashMap();
		map.put("room_no",vo.getRoom_no());
		map.put("no",vo.getSeat_no());
		map.put("state","remained");
		//좌석 상태 변경
		mapper.seatStateChange(map);
		System.out.println(vo.getNo()+"번 예약 삭제됨");
		
		return;
	}
	
	//예약중복확인 - 아이디 count
	/*@Select("SELECT COUNT(*) "
			+ "FROM booking_3 "
			+ "WHERE member_id=#{member_id}")*/
	public int bookingCheckID(String member_id) {
		return mapper.bookingCheckID(member_id);
	}
	
	
	
}
