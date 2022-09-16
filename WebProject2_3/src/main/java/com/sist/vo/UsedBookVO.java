package com.sist.vo;

import lombok.Getter;
import lombok.Setter;
import java.util.*;
/*  이름              NULL?       타입       
----------- -------- -------------- 
BOOK_NO              NUMBER         
NO          NOT NULL NUMBER         
CONDITION            VARCHAR2(100)  
PRICE                NUMBER         
REGDATE              DATE           
STATE                NUMBER         
IMG                  VARCHAR2(1000) 
PUBLISHER            VARCHAR2(500)  
AUTHOR               VARCHAR2(1000) 
DISCOUNT             NUMBER         
PUB_DATE             DATE           
DESCRIPTION          CLOB           
TYPE                 VARCHAR2(100)  
TITLE                VARCHAR2(1000) */
@Getter
@Setter
public class UsedBookVO {
	private int book_no, no, price, state, discount;
	private String title, author, type, publisher, img, description, dbday;
	private String condition;
	private Date pub_date;
}