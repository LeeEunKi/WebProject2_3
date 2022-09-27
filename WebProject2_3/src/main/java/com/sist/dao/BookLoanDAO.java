package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;
import com.sist.vo.*;
import com.sist.mapper.*;
@Repository
public class BookLoanDAO {
	@Autowired
	private BookLoanMapper mapper;
	
	public void bookLoanInsert(int book_no,Map map)
	{
		mapper.bookLoancntIncreament(book_no);
		mapper.bookLoanInsert(map);
	}
	
	public void bookloanDelete(int book_no,Map map)
	{
		mapper.bookloancntDecreament(book_no);
		mapper.bookloanDelete(map);
	}
}
