package com.sist.vo;
import java.util.*;

import lombok.Getter;
import lombok.Setter;

/*
 * "NO" NUMBER, 
	"BOOK_NO" NUMBER, 
	"MEMBER_ID" VARCHAR2(20 BYTE), 
	"REGDATE" DATE DEFAULT SYSDATE, 
 */
@Getter
@Setter
public class BookLoanVO {
	private int no,book_no;
	private String member_id,dbday;
	private Date regdate;
}
