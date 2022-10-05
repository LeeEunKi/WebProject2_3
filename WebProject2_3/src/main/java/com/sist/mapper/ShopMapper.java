package com.sist.mapper;

import java.util.*;
import com.sist.vo.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface ShopMapper {
	//중고책 목록 불러오기
	@Select("SELECT book_no, no, title, type, condition, price, discount, state, img, publisher, author, percent, num "
			+ "FROM (SELECT book_no, no, title, type, condition, price, discount, state, img, publisher, author, percent, rownum as num "
			+ "FROM (SELECT book_no, no, title, type, condition, price, discount, state, img, publisher, author, percent "
			+ "FROM used_book_3 WHERE type LIKE '%'||#{type}||'%' ORDER BY ${order})) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<ShopVO> shopListData(Map map);
	
	
	@Select("SELECT COUNT(*) FROM used_book_3 WHERE type LIKE '%'||#{type}||'%'")
	public int shopTotalCount(Map map);
	
	//출판사별 중고책 목록
	@Select("SELECT book_no, no, title, type, condition, price, discount, state, img, publisher, author, percent, num "
			+ "FROM (SELECT book_no, no, title, type, condition, price, discount, state, img, publisher, author, percent, rownum as num "
			+ "FROM (SELECT book_no, no, title, type, condition, price, discount, state, img, publisher, author, percent "
			+ "FROM used_book_3 WHERE publisher = #{publisher} ORDER BY ${order})) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<ShopVO> shopListData_pub(Map map);
	
	@Select("SELECT COUNT(*) FROM used_book_3 WHERE publisher = #{publisher}")
	public int shopTotalCount_pub(Map map);
	
	//상세 정보 페이지
	@Select("SELECT * FROM used_book_3 WHERE no=#{no}")
	public ShopVO shopDetailData(int no);
	
//	@Select("SELECT type, COUNT(*) as count FROM used_book_3 GROUP BY type")
	@Update("UPDATE used_book_3 SET state=1 WHERE no IN(#{no})")
	public void changeState(int no);

	//구매 처리
	@Insert("INSERT INTO order_3(no,usedbook_no,member_id,price,regdate) "
			+ "VALUES((SELECT NVL(MAX(no)+1,1) FROM order_3),#{usedbook_no}, #{member_id}, #{price},SYSDATE)")
	public void purchaseInsert(OrderVO vo);
	
	//구매 내역
	@Select("SELECT no, usedbook_no, member_id, price, to_char(regdate,'yyyy-mm-dd HH24:MM:SS') as dbday "
			+ "FROM order_3 WHERE member_id=#{member_id} ORDER BY no")
	public List<OrderVO> orderListData(String member_id);
	
	//구매 취소
	@Delete("DELETE FROM order_3 WHERE no=#{no}")
	public void orderCancel(int no);
	//중고책 state 변경
	@Update("UPDATE used_book_3 SET state=0 WHERE no=#{no}")
	public void orderCancel_changeState(int no);
	
	@Select("SELECT no FROM used_book_3 WHERE book_no=#{book_no}")
	public int getShopNo(int book_no);
	
	@Select("SELECT state FROM used_book_3 WHERE no=#{no}")
	public int getBookState(int no);
}
