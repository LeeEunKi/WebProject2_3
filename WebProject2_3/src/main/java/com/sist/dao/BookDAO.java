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
	
}
