package com.mycom.auction.offerboard.service;

import java.util.List;

import com.mycom.auction.offerboard.domain.OfferBoard;

public interface OfferListService {

	
	public List<OfferBoard> getOfferAllList() throws Exception;
	
	
	 //특정글 상세 내용 조회
	public OfferBoard getOfferDetail(int no) throws Exception;
	
	
}
