package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.BoardVO;

import lombok.Delegate;
public interface BoardMapper {
	@Select("SELECT no,subject,name,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,hit,num "
			  +"FROM (SELECT no,subject,name,regdate,hit,rownum as num "
			  +"FROM (SELECT no,subject,name,regdate,hit "
			  +"FROM spring_board_3 ORDER BY no DESC)) "
			  +"WHERE num BETWEEN #{start} AND #{end}")
	public List<BoardVO> boardListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM spring_board_3")
	public int boardTotalPage();
	
	@SelectKey(keyProperty = "no", resultType = int.class, before = true,
			statement = "SELECT NVL(MAX(no)+1,1) as no FROM spring_board_3")
	@Insert("INSERT INTO spring_board_3 VALUES(#{no},#{name},#{subject},#{content},#{pwd},SYSDATE,0)")
	public void boardInsert(BoardVO vo);
	
	//조회수 증가
	@Update("UPDATE spring_board_3 SET "
			+ "hit=hit+1 "
			+ "WHERE no=#{no}")
	public void hitIncrement(int no);
	
	//detail
	@Select("SELECT no,name,subject,content,hit,TO_CHAR(regdate,'YYYY-MM-DD') as dbday FROM spring_board_3 "
			+ "WHERE no=#{no}")
	  public BoardVO boardDetailData(int no);
	   
		//비밀번호 값 받아오기
	   @Select("SELECT pwd FROM spring_board_3 "
			  +"WHERE no=#{no}")
	   public String boardGetPassword(int no);
	   
	   //게시글 수정하기
	   @Update("UPDATE spring_board_3 SET "
			  +"name=#{name},subject=#{subject},content=#{content} "
			  +"WHERE no=#{no}")
	   public void boardUpdate(BoardVO vo);
	   
	   @Delete("DELETE FROM spring_board_3 "
			  +"WHERE no=#{no}")
	   public void boardDelete(int no);
	}
