package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
// 버전 호환 
import java.util.*;
import com.sist.mapper.*;
@Repository
public class DataBoardDAO {
    // 필요한 객체주소를 설정 (스프링에서 관리)
	@Autowired
	private DataBoardMapper mapper;
	
	public List<DataBoardVO> databoardListData(Map map)
	{
		return mapper.databoardListData(map);
	}
	
	public void databoardInsert(DataBoardVO vo)
	{
		mapper.databoardInsert(vo);
	}
	
	public int databoardTotalPage()
	{
		return mapper.databoardTotalPage();
	}
	
	public DataBoardVO databoardDetailData(int no)
	{
		mapper.datahitIncrement(no);
		return mapper.databoardDetailData(no);
	}
	
	public DataBoardVO databoardUpdateData(int no)
	{
		return mapper.databoardDetailData(no);
	}
	
	public boolean databoardUpdate(DataBoardVO vo)
	{
		boolean bCheck=false;
		String db_pwd=mapper.databoardGetPassword(vo.getNo());
		if(db_pwd.equals(vo.getPwd()))
		{
			bCheck=true;
			mapper.databoardUpdate(vo);
		}
		return bCheck;
	}
	
	public boolean databoardDelete(int no,String pwd)
	{
		boolean bCheck=false;
		String db_pwd=mapper.databoardGetPassword(no);
		if(db_pwd.equals(pwd))
		{
			bCheck=true;
			mapper.databoardDelete(no);
		}
		return bCheck;
	}
	
	public DataBoardVO databoardInfoData(int no)
	{
		return mapper.databoardInfoData(no);
	}
}
