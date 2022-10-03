package com.sist.web;

import java.util.Date;
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
import com.sist.vo.BookReplyVO;

@RestController
public class BoardReplyController {
	@Autowired
	private BoardReplyDAO dao;
	
	
	// 뷰에서 v-if를 통해서 처리하는데 ${sessionScope 이게 불가능 그래서 아이디 변수가 하나 필요함 => 아이디를 뷰에 넘겨주기 위해 
	// 수정 & 삭제 시 id를 확인하기 위함
	public String board_reply_data(List<BoardReplyVO> list,String id)
	{
		/* private int no,cno;
		  private String id,name,msg,dbday;
		  private Date regdate;
		  */
		JSONArray arr=new JSONArray();
		int k=0;
		for(BoardReplyVO rvo:list)
		{
			//값 여러개 => object
			JSONObject obj=new  JSONObject();
			obj.put("no", rvo.getNo());
			obj.put("cno", rvo.getCno());
			obj.put("id", rvo.getId());
			obj.put("name", rvo.getName());
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
	
	@GetMapping(value = "board/board_reply_list.do",produces = "text/plain;charset=utf-8")
	public String board_reply_list(int cno,HttpSession session)
	{
		//아이디 세션에서 받아오기
		String id=(String)session.getAttribute("id");
		String result="";
		BoardReplyVO vo=new BoardReplyVO();
		vo.setCno(cno);
		List<BoardReplyVO> list=dao.BoardreplyListData(vo);
		
		result=board_reply_data(list,id);
		
		return result; //넘겨주는 result 데이터가 JSON이여야 하는 것 기억해라
	}
	
	@GetMapping(value = "board/board_reply_insert.do", produces = "text/plain;charset=utf-8")
	public String reply_insert(BoardReplyVO vo,HttpSession session)
	{
		String id=(String)session.getAttribute("id");
		String name=(String)session.getAttribute("name");
		vo.setId(id);
		vo.setName(name);
		dao.BoardreplyInsert(vo);
		List<BoardReplyVO> list=dao.BoardreplyListData(vo);
		String result=board_reply_data(list,id);
		
		return result;
		
	}
	
	@GetMapping(value = "board/board_reply_delete.do", produces = "text/plain;charset=UTF-8")
	public String reply_delete(BoardReplyVO vo,HttpSession session)
	{
		String result="";
		String id=(String)session.getAttribute("id");
		
		//여기서부터 삭제
		dao.BoardreplyDelete(vo.getNo());
		//삭제 후 목록을 리턴
		List<BoardReplyVO> list=dao.BoardreplyListData(vo);
		result=board_reply_data(list,id);
		return result;
	}
	
	
	 @PostMapping(value="board/board_reply_update.do",produces = "text/html;charset=utf-8")
	   public String reply_update(BoardReplyVO vo)
	   {
		   String result="<script>location.href=\"../board/detail.do?no="+vo.getCno()+"\";</script>";
		   dao.BoardreplyUpdate(vo);
		   return result;
	   }
	
}