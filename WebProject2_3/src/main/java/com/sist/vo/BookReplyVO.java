package com.sist.vo;

import java.util.*;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BookReplyVO {
	private int no,book_no,score;
	private String member_id,msg,dbday;
	private Date regdate;
}
