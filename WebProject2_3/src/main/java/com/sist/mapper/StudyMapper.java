package com.sist.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

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
}
