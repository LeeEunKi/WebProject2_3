package com.sist.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;
import com.sist.vo.*;

import oracle.jdbc.OracleTypes;

@Repository
public class BookReplyDAO {
	private Connection conn;
	private CallableStatement cs;
	private final String URL="jdbc:oracle:thin:@211.63.89.131:1521:XE";
	
	public BookReplyDAO()
	{
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public void getConnection()
	{
		try {
			conn=DriverManager.getConnection(URL,"hr","happy");
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	public void disConnection()
	{
		try {
			if(cs!=null) cs.close();
			if(conn!=null) conn.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	// 댓글 읽기
	/*
		create or replace PROCEDURE "BOOK_REPLYLIST" (
		    pbbno BOOK_REPLY.BOOK_NO%TYPE,
		    pbResult OUT SYS_REFCURSOR
		)
		IS
		BEGIN
		   	OPEN pbResult FOR
				SELECT no,book_no, member_id,msg,score,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS')
				FROM BOOK_REPLY
				WHERE book_no =pbbno
				ORDER BY no DESC;
		END;
	 */
	public List<BookReplyVO> replyListData(BookReplyVO vo)
	{
		List<BookReplyVO> list=new ArrayList<BookReplyVO>();
		try {
			getConnection();
			String sql="{CALL BOOK_REPLYLIST(?,?)}";
			cs=conn.prepareCall(sql);
			cs.setInt(1, vo.getBook_no());
			// 1. Int형으로 값을 받아 왔다 => 여기서 OracleTypes.INTEGER
			// 1. String형으로 값을 받아 왔다 => 여기서 OracleTypes.VARCHAR
			cs.registerOutParameter(2, OracleTypes.CURSOR);
			cs.executeQuery();
			ResultSet rs=(ResultSet)cs.getObject(2);
			//Cursor ==ResultSet
			while(rs.next())
			{
				BookReplyVO rvo=new BookReplyVO();
				rvo.setNo(rs.getInt(1));
				rvo.setBook_no(rs.getInt(2));
				rvo.setMember_id(rs.getString(3));
				rvo.setMsg(rs.getString(4));
				rvo.setScore(rs.getInt(5));
				rvo.setDbday(rs.getString(6));
				list.add(rvo);
				
			}
			rs.close();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			disConnection();
		}
		return list;
	}
	// 댓글 쓰기
	/*
		create or replace PROCEDURE "BOOK_REPLYINSERT" (
		    pbbno BOOK_REPLY.BOOK_NO%TYPE,
		    pbid BOOK_REPLY.member_id%TYPE,
		    pbmsg BOOK_REPLY.msg%TYPE,
		    pbscore BOOK_REPLY.score%TYPE,
		)
		IS
		BEGIN
		    INSERT INTO book_reply VALUES(
		        (SELECT NVL(MAX(no)+1,1) FROM book_reply),
		        pbbno,pbid,pbmsg,pbscore,SYSDATE
		        );
		        COMMIT;
		END;
	 */
	public void replyInsert(BookReplyVO vo)
	{
		try {
			getConnection();
			String sql="{CALL BOOK_REPLYINSERT(?,?,?,?)}";
			cs=conn.prepareCall(sql); //프로시저 함수 호출
			// <select ~~ statement="CALLABLE">{}</select>  => select
			cs.setInt(1, vo.getBook_no());
			cs.setString(2, vo.getMember_id());
			cs.setString(3, vo.getMsg());
			cs.setInt(4, vo.getScore());
			cs.executeQuery();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			disConnection();
		}
	}
	// 댓글 수정
	/*
		create or replace PROCEDURE BOOK_replyUpdate(
		   pbno BOOK_REPLY.no%TYPE,
		   pbmsg BOOK_REPLY.msg%TYPE,
		   pbscore BOOK_REPLY.score%TYPE
		)
		IS
		BEGIN
		   UPDATE BOOK_REPLY SET
		   msg=pbmsg,
		   score=pbscore
		   WHERE no=pbno;
		   commit;
		END;

	 */
	public void replyUpdate(BookReplyVO vo)
	{
		try {
			getConnection();
			String sql="{CALL BOOK_replyUpdate(?,?,?)}";
			vo.setScore(5);
			cs=conn.prepareCall(sql);
			cs.setInt(1, vo.getNo());
			cs.setString(2, vo.getMsg());
			cs.setInt(3, vo.getScore());
			cs.executeQuery();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			disConnection();
		}
	}
	
	// 댓글 삭제 
	/*
	create or replace PROCEDURE BOOK_replyDelete(
	   pbno BOOK_REPLY.no%TYPE
	)
	IS
	BEGIN
	  DELETE FROM BOOK_REPLY
	  WHERE no=pbno;
	  COMMIT;
	END;

	 */
	public void replyDelete(int no)
	{
		try {
			getConnection();
			String sql="{CALL BOOK_replyDelete(?)}";
			cs=conn.prepareCall(sql);
			cs.setInt(1, no);
			cs.executeQuery();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			disConnection();
		}
	}
}


