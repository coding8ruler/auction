package com.mycom.auction.goodsSell.schedule;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.mycom.auction.goodsSell.domain.Product;
import com.mycom.auction.goodsSell.service.ProductService;

@Component
public class Scheduler {
	
	
	
	@Autowired
	ProductService productService;
	
	
	@Scheduled(cron = "* * * * */60 *")
	public void autoProductList() throws Exception{
		System.out.println("1");
		int goodsGrade = 3;
	}
}
