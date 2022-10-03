package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
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
   public String member_login_ok(String id, String pwd,boolean ck,HttpSession session,HttpServletResponse response)
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
         if(encoder.matches(pwd, vo.getPwd()))// 암호된 비밀번호 / 일반 비밀번호 비교 
         {
            session.setAttribute("id", id);
            session.setAttribute("name", vo.getName());
            session.setAttribute("role", vo.getRole());
            if(ck==true)
            {
               Cookie cookie=new Cookie("id", id);
               cookie.setPath("/");
               cookie.setMaxAge(60*60*24);
               response.addCookie(cookie);
               ////////////////////////////////
               cookie=new Cookie("name", vo.getName());
               cookie.setPath("/");
               cookie.setMaxAge(60*60*24);
               response.addCookie(cookie);
               ///////////////////////////////
               cookie=new Cookie("role", vo.getRole());
               cookie.setPath("/");
               cookie.setMaxAge(60*60*24);
               response.addCookie(cookie);
            }
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
   
 
   //회원정보 수정 전 비밀번호 확인
   @GetMapping("mypage/mypage_join_before.do")
   public String mypage_before(Model model)
   {
        //model.addAttribute("main_jsp", "../member/join_before.jsp");
        return "mypage/mypage_join_before";
   }
  
   
   //비밀번호 확인 완료
   @GetMapping("mypage/mypage_join_before_ok.do")
   @ResponseBody
   public String mypage_before_ok(String pwd,HttpSession session)
   {
      String id=(String)session.getAttribute("id");
      String result="";
      String db_pwd=dao.memberGetPassword(id);
      if(encoder.matches(pwd, db_pwd))
      {
         result="yes";
      }
      else
      {
         result="no";
      }
      return result;
   }
   
  
   //마이페이지
   @GetMapping("mypage/mypage_join_update.do")
   public String mypage_join_update(Model model,HttpSession session)
   {
      String id=(String)session.getAttribute("id");
      MemberVO vo=dao.memberUpdateData(id);
      model.addAttribute("vo", vo);
      //model.addAttribute("main_jsp", "../member/join_update.jsp");
      return "mypage/mypage_join_update";
   }
   
   
  
   
   //마이페이지
   @PostMapping("mypage/mypage_join_update_ok.do")
   public String mypage_join_update_ok(MemberVO vo,HttpSession session)
   {
      vo.setTel(vo.getTel1()+"-"+vo.getTel2());
      //DB연동 
      dao.memberUpdate(vo);
      session.setAttribute("name", vo.getName());
      return "redirect:../main/main.do";
   }
   
   @GetMapping("mypage/mypage_Volunteer.do")
   public String mypage_Volunteer(HttpSession session)
   {
      return "mypage/mypage_Volunteer";
   }
   
   @GetMapping("mypage/mypage_Volunteer_submit.do")
   public String mypage_Volunteer_submit(HttpSession session)
   {
      return "mypage/mypage_Volunteer_submit";
   }
   
   //회원정보 삭제
   @GetMapping("mypage/mypage_delete_before.do")
   public String delete_before(Model model)
   {
        //model.addAttribute("main_jsp", "../member/join_before.jsp");
        return "mypage/mypage_delete_before";
   }
   
   @GetMapping("mypage/mypage_delete_before_ok.do")
   @ResponseBody
   public String delete_before_ok(String pwd,HttpSession session)
   {
      String id=(String)session.getAttribute("id");
      String result="";
      String db_pwd=dao.memberGetPassword(id);
      if(encoder.matches(pwd, db_pwd))
      {
         result="yes";
      }
      else
      {
         result="no";
      }
      return result;
   }
   
   @RequestMapping("mypage/mypage_delete.do")
   public String mypage_delete(Model model,HttpSession session)
   {
       String id=(String)session.getAttribute("id");
       MemberVO vo=dao.memberDeleteData(id);
      //model.addAttribute("vo", vo);
      //model.addAttribute("main_jsp", "../member/join_update.jsp");
	   dao.memberDelete(vo);
	   return "mypage/mypage_delete";
   }
   
   @PostMapping("mypage/mypage_delete_ok.do")
   public String mypage_delete_ok(MemberVO vo,HttpSession session)
   {
       dao.memberDelete(vo);
     // session.setAttribute("name", vo.getName());
      return "redirect:../main/main.do";
   }
  
}


































