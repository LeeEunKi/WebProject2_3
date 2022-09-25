package com.sist.web;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.BookReplyDAO;
import com.sist.vo.BookReplyVO;

@RestController
public class ReplyRestController {
	@Autowired
	private BookReplyDAO dao;
	
	// 수정이나 삭제가 들어갔을 때 본인인 경우에만 처리하는데 
	// 뷰에서 v-if를 통해서 처리하는데 ${sessionScope 이게 불가능 그래서 아이디 변수가 하나 필요함 => 아이디를 뷰에 넘겨주기 위해 
	public String reply_json_data(List<BookReplyVO> list,String id)
	{
		/*
		private int no,cno,type;
		private String id,name,msg,dbday;
		 */
		JSONArray arr=new JSONArray();
		int k=0;
		for(BookReplyVO rvo:list)
		{
			JSONObject obj=new  JSONObject();
			obj.put("no", rvo.getNo());
			obj.put("book_no", rvo.getBook_no());
			obj.put("member_id", rvo.getMember_id());
			obj.put("score", rvo.getScore());
			obj.put("msg", rvo.getMsg());
			obj.put("dbday", rvo.getDbday());
			if(k==0)
			{
				obj.put("sessionId", id);
			}
			k++;
			arr.add(obj);
			
		}
		return arr.toJSONString();
	}
	
	@GetMapping(value = "book/reply_list.do",produces = "text/plain;charset=utf-8")
	public String reply_list(int book_no,HttpSession session)
	{
		String id=(String)session.getAttribute("id");
		String result="";
		BookReplyVO vo=new BookReplyVO();
		vo.setBook_no(book_no);
		List<BookReplyVO> list=dao.replyListData(vo);
		
		result=reply_json_data(list,id);
		
		return result; //넘겨주는 result 데이터가 JSON이여야 하는 것 기억해라
	}
	
	@GetMapping(value = "book/reply_insert.do", produces = "text/plain;charset=utf-8")
	public String reply_insert(BookReplyVO vo,HttpSession session)
	{
		String id=(String)session.getAttribute("id");
		vo.setMember_id(id);
		dao.replyInsert(vo);
		List<BookReplyVO> list=dao.replyListData(vo);
		String result=reply_json_data(list, id);
		
		return result;
		
	}
}
