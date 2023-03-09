package com.mycom.auction.calendar.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycom.auction.calendar.domain.Calendar;
import com.mycom.auction.calendar.repository.CalendarRepository;

@Service
public class CalendarServiceImpl implements CalendarService{

	
	
	@Autowired
	private CalendarRepository calendarRepository;
	
	
	
	


	public List<Calendar> getCalendarAllList() {
		return calendarRepository.getCalendarAllList();
	}

	public List<Calendar> getCalendarAllList2() {
		return calendarRepository.getCalendarAllList2();
	}


	public Calendar getCalendarDetail(int no) {
		// TODO Auto-generated method stub
		return null;
	}



	public int updateCalendar(Calendar calendar) {
		// TODO Auto-generated method stub
		return 0;
	}


	//삭제하기
	public int deleteCalendar(int no) {
		return calendarRepository.deleteCalendar(no);
	}

	public int insertCalendar(Calendar calendar) {
		return calendarRepository.insertCalendar(calendar);
	}

	

	


	
}
