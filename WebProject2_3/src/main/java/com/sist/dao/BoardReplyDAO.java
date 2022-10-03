package com.sist.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.sist.vo.BoardReplyVO;

import oracle.jdbc.OracleTypes;

@Repository
public class BoardReplyDAO {
	private Connection conn;
	//프로시저 사용을 위한 인터페이스
	//속도, 코드의 독립성, 보안성 향상
	private CallableStatement cs;
	private final String URL="jdbc:oracle:thin:@211.63.89.131:1521:XE";
	
	public BoardReplyDAO()
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
		-- 댓글 읽기
		CREATE OR REPLACE PROCEDURE replyListData_3(
		    pCno BOOK_BOARD_REPLY_3.cno%TYPE,
		    pResult OUT SYS_REFCURSOR
		)
		IS
		BEGIN
		    OPEN pResult FOR
		     SELECT no,cno,id,name,msg,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS')
		     FROM BOOK_BOARD_REPLY_3
		     WHERE cno=pCno;
		END;
/
	 */
	public List<BoardReplyVO> BoardreplyListData(BoardReplyVO vo)
	{
		List<BoardReplyVO> list=new ArrayList<BoardReplyVO>();
		try {
			getConnection();
			String sql="{CALL replyListData_3(?,?)}";
			cs=conn.prepareCall(sql);
			cs.setInt(1, vo.getCno());
			// 1. Int형으로 값을 받아 왔다 => 여기서 OracleTypes.INTEGER
			// 1. String형으로 값을 받아 왔다 => 여기서 OracleTypes.VARCHAR
			cs.registerOutParameter(2, OracleTypes.CURSOR);
			cs.executeQuery();
			//값 넘어오는지 확인
			System.out.println("*Cno : "+cs.getString(2));
			ResultSet rs=(ResultSet)cs.getObject(2);
			//Cursor ==ResultSet
			while(rs.next())
			{
				BoardReplyVO rvo=new BoardReplyVO();
				rvo.setNo(rs.getInt(1));
				rvo.setCno(rs.getInt(2));
				rvo.setId(rs.getString(3));
				rvo.setName(rs.getString(4));
				rvo.setMsg(rs.getString(5));
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
		CREATE OR REPLACE PROCEDURE replyInsert_3(
		    pCno BOOK_BOARD_REPLY_3.cno%TYPE,
		    pId BOOK_BOARD_REPLY_3.id%TYPE,
		    pName BOOK_BOARD_REPLY_3.name%TYPE,
		    pMsg BOOK_BOARD_REPLY_3.msg%TYPE
		)
		IS
		BEGIN
		    INSERT INTO BOOK_BOARD_REPLY_3 VALUES(
		        (SELECT NVL(MAX(no)+1,1) FROM BOOK_BOARD_REPLY_3),
		        pCno,pId,pName,pMsg,SYSDATE
		    );
		    COMMIT;
		END;
	/
	 */
	public void BoardreplyInsert(BoardReplyVO vo)
	{
		try {
			getConnection();
			String sql="{CALL replyInsert_3(?,?,?,?)}";
			cs=conn.prepareCall(sql); //프로시저 함수 호출
			cs.setInt(1, vo.getCno());
			cs.setString(2, vo.getId());
			cs.setString(3, vo.getName());
			cs.setString(4, vo.getMsg());
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
		CREATE OR REPLACE PROCEDURE replyUpdate_3(
		    pNo BOOK_BOARD_REPLY_3.no%TYPE,
		    pMsg BOOK_BOARD_REPLY_3.msg%TYPE
		)
		IS
		BEGIN
		        UPDATE BOOK_BOARD_REPLY_3 SET
		        msg=pMsg
		        WHERE no=pNo;
		        commit;
		END;
		/

	 */
	public void BoardreplyUpdate(BoardReplyVO vo)
	{
		try {
			getConnection();
			String sql="{CALL replyUpdate_3(?,?)}";
			cs=conn.prepareCall(sql);
			cs.setInt(1, vo.getNo());
			cs.setString(2, vo.getMsg());
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
		CREATE OR REPLACE PROCEDURE replyDelete_3(
		    pNo BOOK_BOARD_REPLY_3.no%TYPE
		)
		IS
		BEGIN
		        DELETE FROM BOOK_BOARD_REPLY_3
		        WHERE no=pNo;
		        commit;
		END;
		/

	 */
	public void BoardreplyDelete(int no)
	{
		try {
			getConnection();
			String sql="{CALL replyDelete_3(?)}";
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
