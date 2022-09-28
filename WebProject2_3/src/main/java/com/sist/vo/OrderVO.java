package com.sist.vo;
import java.util.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderVO {
	private int no, usedbook_no, price;
	private String member_id, title, author, publisher, poster, dbday;
	private Date regdate;
}
