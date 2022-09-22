package com.sist.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.MemberVO;

public interface MemberMapper {
	 // 회원가입  ==> 비밀번호 암호화 
	   @Select("SELECT COUNT(*) FROM book_join_3 WHERE id=#{id}")
	   public int memberIdCheck(String id);
	   @Insert("INSERT INTO book_join_3 VALUES("
			  +"#{id},#{pwd},#{name},#{sex},#{birthday},#{email},#{post},"
			  +"#{addr1},#{addr2},#{tel},#{content},'',null,'ROLE_USER')")
	   public void memberJoinInsert(MemberVO vo);
	   // 로그인    ==> 복호화 ====> 자동로그인
	   @Select("SELECT pwd,name,role FROM book_join_3 "
			  +"WHERE id=#{id}")
	   public MemberVO memberJoinInfoData(String id);
	   // 회원 탈퇴  ==> 복호화 
	   // 회원 수정  ==> 복호화 
}