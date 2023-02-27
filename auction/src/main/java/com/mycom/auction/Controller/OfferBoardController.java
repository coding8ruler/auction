package com.mycom.auction.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

// 구인구직게시판 컨트롤러

public class OfferBoardController {

	
	
	  
    //test폼보기
    @GetMapping("/article/ttt")
    public Object tttest() {
    	
    	
    	return "/article/ttt";
    }
  
    //boardselect폼보기
    @GetMapping("/article/tttselect")
    public Object tttselect() {
    	
    	
    	return "/article/tttselect";
    }
  //offerBoard 폼보기
    @RequestMapping("/article/offerBoard")
    public Object offerBoard() {
    	
    	
    	return "/article/offerBoard";
    }
    
    
}
