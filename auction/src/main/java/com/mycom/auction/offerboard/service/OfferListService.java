package com.mycom.auction.offerboard.service;

import java.util.List;

import com.mycom.auction.offerboard.domain.OfferBoard;

public interface OfferListService {

	//전체 게시글 내용
	public List<OfferBoard> getOfferAllList() throws Exception;
	
	
	 //특정글 상세 내용 조회
	public OfferBoard getOfferDetail(int no) throws Exception;
	
	
	//전체 게시글 수 
	public int getTotalCnt() throws Exception;
	
}
