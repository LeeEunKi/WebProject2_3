package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;

public interface StudyMapper {
	//모든 열람실 리스트 
	@Select("SELECT no,name,total_seat,remain_seat "
			+ "FROM room_3")
	public List<RoomVO> roomAllListData();
	
	// 열람실 상세
	@Select("SELECT no,name,total_seat,remain_seat "
			+ "FROM room_3 "
			+ "WHERE no=#{no}")
	public RoomVO roomListData(int no);
	// 열람실 좌석 상세
	@Select("SELECT no,state,room_no "
			+ "FROM seat_3 "
			+ "WHERE room_no=#{room_no}")
	public List<SeatVO> seatInfoData(int room_no);
	
	//열람실 좌석 만들  기
	@Insert("insert into seat_3(no,state,room_no) "
			+ "values((SELECT NVL(MAX(no)+1,1) as no FROM seat_3 WHERE room_no=#{room_no}),'remained',#{room_no})")
	public void createRoomSeat(int room_no);
	/*
	  * NO           NOT NULL NUMBER       
		ROOM_NO      NOT NULL NUMBER       
		SEAT_NO      NOT NULL NUMBER       
		BOOKING_DATE NOT NULL DATE          
		START_TIME   NOT NULL VARCHAR2(50) 
		END_TIME     NOT NULL VARCHAR2(50) 
		MEMBER_ID             VARCHAR2(34) 
	 */
	//열람실 예약
	@Insert("INSERT INTO booking_3(no,room_no,seat_no,start_time,end_time,member_id) "
			+ "VALUES((SELECT NVL(MAX(no)+1,1) as no FROM booking_3),#{room_no},"
			+ "#{seat_no},#{start_time},#{end_time},#{member_id})")
	public void bookingRoom(BookingVO vo);
	//좌석 상태 토글
	@Update("UPDATE seat_3 SET "
			+ "state=#{state} WHERE no=#{no} AND room_no=#{room_no}")
	public void seatStateChange(Map map);
	
	//열람실 현황 업데이트
	//예약
	@Update("UPDATE room_3 SET "
			+ "remain_seat=remain_seat-1 "
			+ "WHERE no=#{no}")
	public void roomRemainSeatDecrease(int no);
	//예약 취소 or 끝
	@Update("UPDATE room_3 SET "
			+ "remain_seat=remain_seat+1 "
			+ "WHERE no=#{no}")
	public void roomRemainSeatIncrease(int no);
	
	// 예약 끝나는 시간,좌석번호 가져오기
	@Select("SELECT no,TO_CHAR(booking_date,'YYYY-MM-DD') as dbday,end_time,seat_no,room_no "
			+ "FROM booking_3")
	public List<BookingVO> bookingGetInfo();
	
	//회원 좌석정보
	@Select("SELECT no,TO_CHAR(booking_date,'YYYY-MM-DD') as dbday,start_time,end_time,seat_no,room_no "
			+ "FROM booking_3 "
			+ "WHERE member_id=#{member_id}")
	public BookingVO bookingGetMemeberInfo(String member_id);
	
	// 예약 취소
	@Delete("DELETE booking_3 WHERE no=#{no}")
	public void bookingCancel(int no);
	
	//예약중복확인 - 아이디 count
	@Select("SELECT COUNT(*) "
			+ "FROM booking_3 "
			+ "WHERE member_id=#{member_id}")
	public int bookingCheckID(String member_id);
	
	//예약 시간 연장
	@Update("UPDATE booking_3 SET "
			+ "end_time=#{end_time}")
	public void bookingExtend(String end_time);
	
	
}
