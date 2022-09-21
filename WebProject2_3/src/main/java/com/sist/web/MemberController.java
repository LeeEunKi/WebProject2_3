package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

import javax.servlet.http.HttpSession;

import com.sist.dao.*;
import com.sist.vo.*;
// 커스터마이징 , 리팩토링  
@Controller
public class MemberController {
   @Autowired
   private MemberDAO dao;
   
   @Autowired
   private BCryptPasswordEncoder encoder;
   
   @GetMapping("member/join.do")
   public String member_join(Model model)
   {
	   //model.addAttribute("main_jsp", "../member/join.jsp");
	   return "member/join";//forward => request를 전송 
   }
   
   @PostMapping("member/join_ok.do")
   public String member_join_ok(MemberVO vo)
   {
	   vo.setTel(vo.getTel1()+"-"+vo.getTel2());
	   String en=encoder.encode(vo.getPwd());// 암호화 
	   vo.setPwd(en);
       dao.memberJoinInsert(vo);	   
	   return "redirect:../main/main.do"; //재전송 (sendRedirect()) => request초기화 
   }
   
   @PostMapping("member/idcheck.do")
   @ResponseBody
   // JSP파일명 , .do 전송 ==> 일반 데이터, JSON ==> @RestController
   public String member_idcheck(String id)
   {
	   String result="";
	   int count=dao.memberIdCheck(id);
	   if(count==0)
	   {
		   result="YES";
	   }
	   else
	   {
		   result="NO";
	   }
	   return result;
   }
   
   @GetMapping("member/login.do")
   public String member_login(Model model)
   {
	   //model.addAttribute("main_jsp","../member/login.jsp");
	   return "member/login";
   }
   
   @PostMapping("member/login_ok.do")
   //현재 떠있는창(로그인창)에 결과값만 보내기
   @ResponseBody
   //HttpSession session => 아이디 세션에 저장
   public String member_login_ok(String id, String pwd,HttpSession session)
   {
	   String result="";
	   int count=dao.memberIdCheck(id);
	   if(count==0)
	   {
		   result="NOID";
	   }
	   else
	   {
		   MemberVO vo=dao.memberJoinInfoData(id);
		   //pwd와 암호화된 pwd(vo.getPwd)를 매칭(서로 같은지 확인)
		   if(encoder.matches(pwd, vo.getPwd()))
		   {
			   session.setAttribute("id", id);
			   session.setAttribute("name", vo.getName());
			   session.setAttribute("role", vo.getRole());
			   result="OK";
		   }
		   else
		   {
			   result="NOPWD";
		   }
	   }
	   return result;
   }
   
   @GetMapping("member/logout.do")
   public String member_logout(HttpSession session)
   {
	   session.invalidate();
	   return "redirect:../main/main.do";
   }
}



































