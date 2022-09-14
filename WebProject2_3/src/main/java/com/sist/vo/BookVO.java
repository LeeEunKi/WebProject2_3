package com.sist.vo;

import lombok.Getter;
import lombok.Setter;
import java.util.*;
/*  이름              NULL?       타입             
----------- -------- -------------- 
NO          NOT NULL NUMBER         
TITLE       NOT NULL VARCHAR2(1000) 
AUTHOR      NOT NULL VARCHAR2(1000) 
TYPE        NOT NULL VARCHAR2(100)  
PUBLISHER   NOT NULL VARCHAR2(500)  
PRICE       NOT NULL NUMBER         
IMG         NOT NULL VARCHAR2(1000) 
PUB_DATE    NOT NULL DATE           
DESCRIPTION          CLOB           */
@Getter
@Setter
public class BookVO {
	private int no, price;
	private String title, author, type, publisher, img, description, dbday;
	private Date pub_date;
}
