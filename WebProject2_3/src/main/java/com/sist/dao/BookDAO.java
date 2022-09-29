package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.BookMapper;
import com.sist.vo.*;

@Repository
public class BookDAO {
	@Autowired
	BookMapper mapper;
	
	public List<BookVO> bookListData(Map map)
	{
		return mapper.bookListData(map);
	}
	
	//총페이지
	public int bookTotalPage()
	{
		return mapper.bookTotalPage();
	}
	
	public BookVO bookDetailData(int no)
	{
		return mapper.bookDetailData(no);
	}
	
	//도서명 검색 
	public List<BookVO> bookNameFindData(Map map)
	{
		return mapper.bookNameFindData(map);
	}
	
	
	public int bookNameTotalpage(String title)
	{
		return mapper.bookNameTotalpage(title);
	}
	
	
	public List<BookVO> bookauthorFindData(Map map)
	{
		return mapper.bookauthorFindData(map);
	}
	

	public int bookauthorFindTotalPage(String ss)
	{
		return mapper.bookauthorFindTotalPage(ss);
	}
	
	public List<BookVO> mainHitBookData()
	{
		return mapper.mainHitBookData();
	}
	
	public List<BookVO> CategoryListData(Map map)
	{
		return mapper.CategoryListData(map);
	}
	
	public int CategoryTotalPage(String type)
	{
		return mapper.CategoryTotalPage(type);
	}
}
