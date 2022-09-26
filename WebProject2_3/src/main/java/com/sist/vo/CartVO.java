package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CartVO {
	private int no, total, price;
	private String name, poster, publisher, author;
}