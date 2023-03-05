package com.mycom.auction.offerboard.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycom.auction.offerboard.domain.OfferBoard;
import com.mycom.auction.offerboard.service.OfferListService;

// 구인구직컨트롤러
@Controller
public class OfferBoardController {

	private static final Logger logger = LoggerFactory.getLogger(OfferBoardController.class);
	
	@Autowired
	OfferListService offerListService;
	
	  //offerBoard 구인게시판 목록 보여주기
    @RequestMapping("/offerBoard/offerBoardForm")
    public String offerBoard(Model model,@RequestParam(name="ano", required=false,defaultValue="1") int no) throws Exception {
    	
    	//전체 리스트 조회
    	List<OfferBoard> list= offerListService.getOfferAllList();
    	
    	//특정글번호 조회
    	OfferBoard offerBoard = offerListService.getOfferDetail(no);
    	
    	model.addAttribute("list",list); //전체 목록 검색
    	model.addAttribute("offerBoard",offerBoard); //전체 목록 검색
    	
    	return "/offerBoard/offerBoardForm";
    }
    
    
    
    
    
    
    
    //offerinsertForm 구인등록 폼 보여주기
    @GetMapping("/offerBoard/offerInsertForm")
    public String offerinsert() {
    	
    	
    	return "/offerBoard/offerInsertForm";
    }
  
    //offerSelect 입력된 구인게시글 내용폼 보여주기
    @GetMapping("/offerBoard/offerSelectForm")
    public Object offerSelect() {
    	
    	
    	return "/offerBoard/offerSelectForm";
    }

    
}
