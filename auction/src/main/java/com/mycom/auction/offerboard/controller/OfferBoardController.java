package com.mycom.auction.offerboard.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycom.auction.offerboard.domain.OfferBoard;
import com.mycom.auction.offerboard.domain.Page;
import com.mycom.auction.offerboard.service.OfferListService;

// 구인구직컨트롤러
@Controller
public class OfferBoardController {

	private static final Logger logger = LoggerFactory.getLogger(OfferBoardController.class);
	
	@Autowired
	OfferListService offerListService;
	/*
	  //offerBoard 구인게시판 목록 보여주기
    @RequestMapping("/offerBoard/offerBoardForm")
    public String offerBoard(Model model,@RequestParam(name="ano", required=false,defaultValue="1") int no) throws Exception {
    	
    	//전체 리스트 조회
    	List<OfferBoard> list= offerListService.getOfferAllList();
    	
    	//전체 게시글 수
    	int totalCnt = offerListService.getTotalCnt();
    	
    	
    	//특정글번호 조회
    	OfferBoard offerBoard = offerListService.getOfferDetail(no);
    	
    	model.addAttribute("list",list); //전체 목록 검색
    	model.addAttribute("offerBoard",offerBoard); //전체 목록 검색
    	model.addAttribute("totalCnt",totalCnt); //전체 게시물 수
    	
    	
    	return "/offerBoard/offerBoardForm";
    }
    */
    
    
    
    
  //게시글전체조회
  	@GetMapping("/offerBoard/offerBoardForm")
  	public String articleList(Model model,HttpServletRequest request) throws Exception {
  		
  		
  		String strPageNo = request.getParameter("pageNo"); //보고싶은페이지
  		int pageNo = 1;   
  		if(strPageNo!=null) {
  			pageNo = Integer.parseInt(strPageNo);			
  		}
  		Page page = new Page(pageNo);
  		
  		OfferBoard offerBoard  = offerListService.getArticlePage(page);
  		model.addAttribute("offerBoard", offerBoard);
  		
  		return "/offerBoard/offerBoardForm";
  	}
    
    
    
    
    
    
    
    /*
    //페이징처리
    @RequestMapping(value = "/offerBoard/offerBoardForm", method = RequestMethod.GET)
    public ModelAndView boardList(@RequestParam(value = "page", defaultValue = "1") int page) throws Exception {
        ModelAndView mv = new ModelAndView("/offerBoard/offerBoardForm");
        int totalcnt = offerListService.getTotalCnt(); // 게시글 전체 수
        
        OfferBoard offerBoard = new OfferBoard(); // 한 페이지에 보여줄 게시글 수
       // List<BoardVO> boardList = boardService.selectBoardList(pageVO); // 해당 페이지에 보여줄 게시글 목록
        List<OfferBoard> pagelist= offerListService.sele(page); // 해당 페이지에 보여줄 게시글 목록
       
        mv.addObject("pagelist", pagelist);
        mv.addObject("offerBoard", offerBoard);
        mv.addObject("totalcnt", totalcnt);
        return mv;
    }
    */
    
    
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
