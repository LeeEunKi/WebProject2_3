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
	@Insert("INSERT INTO booklike_3 VALUES( #{no}, #{book_no}, #{member_id},#{title}, #{author}, #{img}, #{type} )")
	public void bookLikeInsert(Map map);
	
	// 좋아요 리스트 데이타 
	@Select("SELECT no,book_no,title,author,img,type "
			+ "FROM booklike_3 "
			+ "WHERE member_id=#{member_id}")
	public List<BookLikeVO> booklikeList(String member_id);
	
	//좋아요 여부 체크
	@Select("SELECT COUNT(*) FROM booklike_3 WHERE member_id=#{member_id}")
	public int likeCountCheck(String member_id);
	
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
