package com.sist.vo;
import java.util.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BookingVO {
	private int no,room_no,seat_no;
	private String start_time,end_time,dbday,member_id;
	private Date booking_date;
}
