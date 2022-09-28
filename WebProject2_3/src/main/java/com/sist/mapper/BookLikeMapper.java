package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;

import lombok.Delegate;
public interface BookLikeMapper {
	
	@Select("SELECT COUNT(*) FROM booklike_3 WHERE book_no=#{book_no} AND member_id=#{member_id}")
	public int likeCheck(Map map);
	
	//좋아요
	@SelectKey(keyProperty = "no", resultType = int.class , before = true, 
			statement = "SELECT NVL(MAX(no)+1,1) AS no FROM booklike_3")
	@Insert("INSERT INTO booklike_3 VALUES( #{no}, #{book_no}, #{member_id} )")
	public void bookLikeInsert(Map map);
	
	@Update("UPDATE book_3 SET "
			+ "likecnt = likecnt+1"
			+ "WHERE no=#{no}")
	public void booklikecntIncreament(int book_no);
	
	//취소
	@Delete("DELETE FROM booklike_3 "
			+ "WHERE member_id=#{member_id} AND book_no=#{book_no}")
	public void bookLikeDelete(Map map);
	
	@Update("UPDATE book_3 SET "
			+ "likecnt = likecnt-1"
			+ "WHERE no=#{no}")
	public void booklikecntDecreament(int book_no);
}
