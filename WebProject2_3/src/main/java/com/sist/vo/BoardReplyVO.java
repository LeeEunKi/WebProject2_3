package com.sist.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class BoardReplyVO {
	  private int no,cno;
	  private String id,name,msg,dbday;
	  private Date regdate;
}
