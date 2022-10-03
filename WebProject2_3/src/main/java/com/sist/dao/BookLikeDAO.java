package com.sist.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.SelectKey;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;
import com.sist.mapper.*;
import com.sist.vo.*;


@Repository
public class BookLikeDAO {
	@Autowired
	private BookLikeMapper mapper;
	
	//체크
	public int likeCheck(Map map)
	{
		return mapper.likeCheck(map);
	}
	
	//좋아요
	public void bookLikeInsert(int book_no,Map map)
	{
		mapper.booklikecntIncreament(book_no);
		mapper.bookLikeInsert(map);
	}
	
	
	//취소
	public void bookLikeDelete(int book_no,Map map)
	{
		mapper.booklikecntDecreament(book_no);
		mapper.bookLikeDelete(map);
	} 
	
	
}
