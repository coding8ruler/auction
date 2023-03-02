package com.mycom.auction.offerboard.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mycom.auction.offerboard.domain.OfferBoard;

@Repository
public class OfferRepositoryImpl implements OfferRepository {

	//필드
	@Autowired
	private SqlSession sqlSession;
	
	//전체목록조회
	public List<OfferBoard> getOfferAllList() throws DataAccessException{
		List<OfferBoard> list= sqlSession.selectList("mapper.offerBoard.offerAllList");
		return list;
	}
	
}
