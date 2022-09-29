package com.sist.aop;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sist.dao.StudyDAO;
import com.sist.vo.BookingVO;

@Component
@Aspect
public class StudyAspect {
	@Autowired
	private StudyDAO dao;
	
	@Before("execution(* com.sist.web.StudyController.*(..)) || "
			+ "execution(* com.sist.web.StudyRestController.*(..)) || "
			+ "execution(* com.sist.web.MainController.*(..))")
	public void bookingCheck() {
		try {
			
			Date date=new Date();
			SimpleDateFormat sdf=new SimpleDateFormat("HH:mm:ss");		
			SimpleDateFormat sdf2=new SimpleDateFormat("YYYY-MM-dd");
			String now_time=sdf.format(date);
			String now_date=sdf2.format(date);
			System.out.println("현재시간:"+now_time);
			System.out.println("현재날짜:"+now_date);
			
			List<BookingVO> list=dao.bookingGetInfo();
			for(BookingVO vo:list) {
				int res=vo.getDbday().compareTo(now_date);
				int res2=vo.getEnd_time().compareTo(now_time);
				/*
				 * System.out.println("예약번호:"+vo.getNo());
				 * System.out.println("예약날짜:"+vo.getDbday());
				 * System.out.println("예약종료시간:"+vo.getEnd_time());
				 * System.out.println("날짜비교:"+res); System.out.println("시간비교:"+res2);
				 */
				System.out.println("===============================");
				if(vo.getDbday().compareTo(now_date)<0) {
					dao.bookingCancel(vo);
					System.out.println("전날 비교ok");
				}
				else if(vo.getDbday().compareTo(now_date)==0) {
					if(vo.getEnd_time().compareTo(now_time)<0) {
						dao.bookingCancel(vo);
						System.out.println("같은날 비교ok");
					}
				}
			}
		} catch (Exception e) {}
	}
}
