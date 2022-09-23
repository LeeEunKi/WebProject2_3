package com.sist.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sist.vo.*;
import com.sist.mapper.*;
@Repository
public class MemberDAO {
    @Autowired
    private MemberMapper mapper;

    public int memberIdCheck(String id)
    {
    	return mapper.memberIdCheck(id);
    }
    public void memberJoinInsert(MemberVO vo)
    {
    	mapper.memberJoinInsert(vo);
    }
    public MemberVO memberJoinInfoData(String id)
    {
    	return mapper.memberJoinInfoData(id);
    }
    //@Select("SELECT pwd FROM spring_join "
	  //+"WHERE id=#{id}")
	public String memberGetPassword(String id)
	{
		 return mapper.memberGetPassword(id);
	}
	
	/*
	*  @Select("SELECT * FROM spring_join "
		  +"WHERE id=#{id}")
	   public MemberVO memberUpdateData(String id);
	*/
	public MemberVO memberUpdateData(String id)
	{
		 return mapper.memberUpdateData(id);
	}
	/*@Update("UPADTE spring_join SET "
		   +"name=#{name},sex=#{sex},email=#{email},"
		   +"post=#{post},addr1=#{addr1},addr2=#{addr2},"
		   +"tel=#{tel},content=#{content} "
		   +"WHERE id=#{id}")*/
	public void memberUpdate(MemberVO vo)
	{
		mapper.memberUpdate(vo);
	}
}
