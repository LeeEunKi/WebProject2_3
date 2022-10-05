package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BookLikeVO {
	private int no,book_no;
	private String member_id,title,author,img,type;
}
