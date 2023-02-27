package com.mycom.auction.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

// 구인구직게시판 컨트롤러

public class OfferBoardController {

	
	
	  
    //offerinsertForm폼보기
    @GetMapping("/article/offerinsertForm")
    public Object offerinsert() {
    	
    	
    	return "/article/offerinsertForm";
    }
  
    //offerSelect폼보기
    @GetMapping("/article/offerSelectForm")
    public Object offerSelect() {
    	
    	
    	return "/article/offerSelectForm";
    }
  //offerBoard 폼보기
    @RequestMapping("/article/offerBoard")
    public Object offerBoard() {
    	
    	
    	return "/article/offerBoard";
    }
    
    
}
