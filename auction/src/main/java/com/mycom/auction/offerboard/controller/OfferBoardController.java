package com.mycom.auction.offerboard.controller;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

// 구인구직컨트롤러
@Controller
public class OfferBoardController {

	private static final Logger logger = LoggerFactory.getLogger(OfferBoardController.class);
	
	
	
	  
    //offerinsertForm�뤌蹂닿린
    @GetMapping("/offerBoard/offerInsertForm")
    public String offerinsert() {
    	
    	
    	return "/offerBoard/offerInsertForm";
    }
  
    //offerSelect�뤌蹂닿린
    @GetMapping("/offerBoard/offerSelectForm")
    public Object offerSelect() {
    	
    	
    	return "/offerBoard/offerSelectForm";
    }
  //offerBoard �뤌에ㅇ
    @RequestMapping("/offerBoard/offerBoardForm")
    public Object offerBoard() {
    	
    	
    	return "/offerBoard/offerBoardForm";
    }
    
    
}
