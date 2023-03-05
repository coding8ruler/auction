package com.mycom.auction.offerboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycom.auction.offerboard.domain.OfferBoard;
import com.mycom.auction.offerboard.repository.OfferRepository;

@Service
public class OfferListServiceImpl implements OfferListService {

	@Autowired
	OfferRepository offerRepository ;
	
	//전체 데이터 리스트 조회
	public List<OfferBoard> getOfferAllList() throws Exception{
		
		return offerRepository.getOfferAllList();
	}
	//특정글 상세조회
	 @Override 
	 public OfferBoard getOfferDetail(int no) throws Exception {
	 
	 return offerRepository.getOfferDetail(no);
	 
	 }
	@Override
	public int getTotalCnt() throws Exception {
		return  offerRepository.getTotalCnt();
	}
	 
	
	
	
	
	
	
	
	
	
	
	
	
}
