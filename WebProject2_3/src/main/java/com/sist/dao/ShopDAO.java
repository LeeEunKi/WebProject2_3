package com.sist.dao;

import java.util.*;

import com.sist.mapper.ShopMapper;
import com.sist.vo.*;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ShopDAO {
	@Autowired
	private ShopMapper mapper;
	//중고책 목록 불러오기
	/*@Select("SELECT book_no, no, title, type, condition, price, discount, state, img, publisher, author, percent, num "
			+ "FROM (SELECT book_no, no, title, type, condition, price, discount, state, img, publisher, author, percent, rownum as num "
			+ "FROM (SELECT book_no, no, title, type, condition, price, discount, state, img, publisher, author, percent "
			+ "FROM used_book_3 WHERE type LIKE '%'||#{type}||'%' ORDER BY ${order})) "
			+ "WHERE num BETWEEN #{start} AND #{end}")*/
	public List<ShopVO> shopListData(Map map){
		return mapper.shopListData(map);
	}
	/*@Select("SELECT COUNT(*) FROM used_book_3 WHERE type LIKE '%'||#{type}||'%'")*/
	public int shopTotalCount(Map map) {
		return mapper.shopTotalCount(map);
	}
	
	//상세 정보 페이지
	/*@Select("SELECT * FROM used_book_3 WHERE no=#{no}")*/
	public ShopVO shopDetailData(int no) {
		return mapper.shopDetailData(no);
	}
	
	//출판사별 중고책 목록
	/*@Select("SELECT book_no, no, title, type, condition, price, discount, state, img, publisher, author, percent, num "
			+ "FROM (SELECT book_no, no, title, type, condition, price, discount, state, img, publisher, author, percent, rownum as num "
			+ "FROM (SELECT book_no, no, title, type, condition, price, discount, state, img, publisher, author, percent "
			+ "FROM used_book_3 WHERE publisher = #{publisher} ORDER BY ${order})) "
			+ "WHERE num BETWEEN #{start} AND #{end}")*/
	public List<ShopVO> shopListData_pub(Map map){
		return mapper.shopListData_pub(map);
	}
	/*@Select("SELECT COUNT(*) FROM used_book_3 WHERE publisher = #{publisher}")*/
	public int shopTotalCount_pub(Map map) {
		return mapper.shopTotalCount_pub(map);
	}
	
	/*@Update("UPDATE used_book_3 SET state=1 WHERE no IN(#{no})")*/
	public void changeState(int no) {
		mapper.changeState(no);
	}
	
	//구매 처리
	/*@Insert("INSERT INTO order_3(no,usedbook_no,member_id,price,regdate) "
			+ "VALUES((SELECT NVL(MAX(no)+1,1) FROM order_3),#{usedbook_no}, #{member_id}, #{price},SYSDATE)")*/
	public void purchase_insert(OrderVO vo) {
		mapper.purchase_insert(vo);
	}
	/*@Select("SELECT no, usedbook_no, member_id, price, regdate "
			+ "FROM order_3 WHERE member_id=#{member_id}")*/
	public List<OrderVO> orderListData(String member_id){
		return mapper.orderListData(member_id);
	}
}
