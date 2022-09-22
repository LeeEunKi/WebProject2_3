package com.sist.dao;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;
import com.sist.mapper.*;
import com.sist.vo.*;

@Repository
public class StudyDAO {
	@Autowired
	private static StudyMapper mapper;
	
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
	

}
