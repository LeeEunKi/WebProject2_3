package com.sist.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sist.dao.BoardReplyDAO;
import com.sist.vo.BoardReplyVO;

@RestController
public class BoardReplyController {
	@Autowired
	private BoardReplyDAO dao;
	
	

	@GetMapping(value = "reply/insert.do")
	public String board_reply_insert(BoardReplyVO vo,HttpSession session,RedirectAttributes  ra)
	{
		String id=(String)session.getAttribute("id");
		String name=(String)session.getAttribute("name");
		
		vo.setId(id);
		vo.setName(name);
		
		dao.BoardreplyInsert(vo);
		
		ra.addAttribute("no",vo.getCno());
		
		return "redirect:../board/detail.do";
		
	}
	
	@GetMapping(value = "reply/delete.do")
	public String board_reply_delete(BoardReplyVO vo,RedirectAttributes ra)
	{
		dao.BoardreplyDelete(vo.getNo());
    	ra.addAttribute("no", vo.getCno());
    	return "redirect:../board/detail.do";
	}
	
	
	 @PostMapping(value="reply/update.do")
	   public String board_reply_update(BoardReplyVO vo,RedirectAttributes ra)
	   {
		    dao.BoardreplyUpdate(vo);
	    	ra.addAttribute("no", vo.getCno());
	    	return "redirect:../board/detail.do";
	   }
}
