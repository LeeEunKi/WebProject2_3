package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RoomVO {
	private String name;
	private int no,total_seat,remain_seat,used_seat;
	private double use;
}
