package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.sist.dao.DataBoardVO;
public interface DataBoardMapper {
   @Select("SELECT no,subject,name,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,hit,num "
		  +"FROM (SELECT no,subject,name,regdate,hit,rownum as num "
		  +"FROM (SELECT no,subject,name,regdate,hit "
		  +"FROM spring_databoard_3 ORDER BY no DESC)) "
		  +"WHERE num BETWEEN #{start} AND #{end}")
   public List<DataBoardVO> databoardListData(Map map);
   
   // 총페이지 
   @Select("SELECT CEIL(COUNT(*)/10.0) FROM spring_databoard_3")
   public int databoardTotalPage();
   // 1. sequence , 2. selectkey , 3. subquery
   /*
    *   @Insert("INSERT INTO spring_databoard_3 VALUES("
		  +"(SELECT NVL(MAX(no)+1,1) as no FROM spring_databoard_3),#{name},#{subject},#{content},#{pwd},"
		  +"SYSDATE,0,#{filename},#{filesize},#{filecount})")
    */
   @SelectKey(keyProperty = "no",resultType = int.class,before = true,
		   statement = "SELECT NVL(MAX(no)+1,1) as no FROM spring_databoard_3")
   @Insert("INSERT INTO spring_databoard_3 VALUES("
		  +"#{no},#{name},#{subject},#{content},#{pwd},"
		  +"SYSDATE,0,#{filename},#{filesize},#{filecount})")
   public void databoardInsert(DataBoardVO vo);
   
   // 상세보기 
   @Update("UPDATE spring_databoard_3 SET "
		  +"hit=hit+1 "
		  +"WHERE no=#{no}")
   public void datahitIncrement(int no);
   
   @Select("SELECT no,name,subject,content,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,filename,filesize,filecount "
		  +"FROM spring_databoard_3 "
		  +"WHERE no=#{no}")
   public DataBoardVO databoardDetailData(int no);
   
   @Select("SELECT pwd FROM spring_databoard_3 "
		   +"WHERE no=#{no}")
   public String databoardGetPassword(int no);
   
   @Update("UPDATE spring_databoard_3 SET "
		   +"name=#{name},subject=#{subject},content=#{content} "
		   +"WHERE no=#{no}")
   public void databoardUpdate(DataBoardVO vo);
   
   @Delete("DELETE FROM spring_databoard_3 "
		   +"WHERE no=#{no}")
   public void databoardDelete(int no);
   
   @Select("SELECT filename,filecount FROM spring_databoard_3 "
		  +"WHERE no=#{no}")
   public DataBoardVO databoardInfoData(int no);
   
}












