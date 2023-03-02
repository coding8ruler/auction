package com.mycom.auction.offerboard.repository;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.mycom.auction.offerboard.domain.OfferBoard;

public interface OfferRepository {
	
	//전체 목록조회
	public List<OfferBoard> getOfferAllList() throws DataAccessException;
	
}
