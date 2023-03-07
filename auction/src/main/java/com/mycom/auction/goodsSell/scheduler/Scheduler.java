package com.mycom.auction.goodsSell.scheduler;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.mycom.auction.goodsSell.service.ProductService;

@Component
public class Scheduler {
	
	@Autowired
	private ProductService productService; 
	
	// 초 분 시 일 월 주 (연도)
	@Scheduled(cron = "* */30 * * * *")
	public void autoUpdate() throws Exception {
		int cnt=0;
		cnt=productService.productAutoDelete();
		if(cnt!=0) {
			System.out.println("삭제 완료");
		}
	}
}
