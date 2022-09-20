package com.sist.mapper;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.BookVO;

import java.util.*;
public interface BookMapper {

	/*
	private int no, price;
	private String title, author, type, publisher, img, description, dbday;
	 */
	
	@Select("SELECT no,title,author,type,publisher,img,TO_CHAR(pub_date,'YYYY-MM-DD') AS dbday,num "
			+ "FROM (SELECT no,title,author,type,publisher,img,pub_date,rownum AS num "
			+ "FROM (SELECT no,title,author,type,publisher,img,pub_date "
			+ "FROM BOOK_3 ORDER BY no DESC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<BookVO> bookListData(Map map);
	
	//총페이지
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM BOOK_3")
	public int bookTotalPage();
	
	//상세보기 -Vue
	@Select("SELECT no,title,author,type,publisher,img,TO_CHAR(pub_date,'YYYY-MM-DD') AS dbday, description "
			+ "FROM BOOK_3 "
			+ "WHERE no=#{no}")
	public BookVO bookDetailData(int no);
	
	//도서명 검색
	@Select("SELECT no,title,author,type,publisher,img,TO_CHAR(pub_date,'YYYY-MM-DD') AS dbday,num "
			+ "FROM (SELECT no,title,author,type,publisher,img,pub_date,rownum AS num "
			+ "FROM (SELECT no,title,author,type,publisher,pub_date "
			+ "FROM BOOK_3 WHERE title LIKE '%'||#{title}||'%'))"
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<BookVO> bookNameFindData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM BOOK_3 "
			+ "WHERE title LIKE '%'||#{title}||'%'")
	public int bookNameTotalpage(String title);
	
	
	
}
