package com.sist.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

public interface BookLoanMapper {
	@SelectKey(keyProperty = "no", resultType = int.class , before = true, 
			statement = "SELECT NVL(MAX(no)+1,1) AS no FROM bookloan_3")
	@Insert("INSERT INTO bookloan_3 VALUES( #{no}, #{book_no}, #{member_id},SYSDATE, SYSDATE + 7 )")
	public void bookLoanInsert(Map map);
	
	@Update("UPDATE book_3 SET "
			+ "hit= hit+1"
			+ "loancnt=loancnt-1"
			+ "WHERE no=#{no}")
	public void bookLoancntIncreament(int book_no);
	
	
	//취소
	@Delete("DELETE FROM bookloan_3 "
			+ "WHERE member_id=#{member_id} AND book_no=#{book_no}")
	public void bookloanDelete(Map map);
	
	@Update("UPDATE book_3 SET "
			+ "hit= hit-1"
			+ "loancnt=loancnt-1"
			+ "WHERE no=#{no}")
	public void bookloancntDecreament(int book_no);
	
	
}
