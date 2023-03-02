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
	
	public List<OfferBoard> getOfferAllList() throws Exception{
		
		return offerRepository.getOfferAllList();
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
