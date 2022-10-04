package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.BookLoanVO;
import com.sist.vo.BookVO;

public interface BookLoanMapper {
	@SelectKey(keyProperty = "no", resultType = int.class , before = true, 
			statement = "SELECT NVL(MAX(no)+1,1) AS no FROM bookloan_3")
	@Insert("INSERT INTO bookloan_3 VALUES( #{no}, #{book_no}, #{member_id},SYSDATE, SYSDATE + 7 ,#{title}, #{author}, #{img} )")
	public void bookLoanInsert(Map map);
	
	@Update("UPDATE book_3 SET "
			+ "hit= hit+1, "
			+ "loancnt=loancnt-1 "
			+ "WHERE no=#{no}")
	public void bookLoancntIncreament(int book_no);
	
	//예약화면 도서 정보
	@Select("SELECT no,book_no,TO_CHAR(regdate,'YYYY-MM-DD') AS dbday, TO_CHAR(expdate,'YYYY-MM-DD') AS dbday2, title,img,author "
			+ "FROM bookloan_3 "
			+ "WHERE member_id=#{member_id}")
	public List<BookLoanVO> loanBookInfoData(String member_id);
	
	//예약 체크
	@Select("SELECT COUNT(*) FROM bookloan_3 WHERE member_id=#{member_id}")
	public int loanCountCheck(String member_id);
	
	//취소
	@Delete("DELETE FROM bookloan_3 "
			+ "WHERE member_id=#{member_id} AND book_no=#{book_no}")
	public void bookloanDelete(Map map);
	
	@Update("UPDATE book_3 SET "
			+ "loancnt=loancnt+1 "
			+ "WHERE no=#{book_no}")
	public void bookloancntDecreament(int book_no);
	
	
}
