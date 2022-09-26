package com.sist.mapper;

import java.util.*;
import com.sist.vo.*;
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
	@Update("UPDATE used_book_3 SET state=1 WHERE no IN(#{numbers})")
	public void purchase(String numbers);
}
