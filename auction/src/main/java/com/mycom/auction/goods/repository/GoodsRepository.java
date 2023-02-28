package com.mycom.auction.goods.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mycom.auction.goods.domain.ProductDTO;

@Repository
public class GoodsRepository{

	
	 @Autowired 
	 private SqlSession sqlSession;
	 
	
	public String insertNewGoods(Map newGoodsMap) throws DataAccessException {
		/*
		 * //sqlSession.insert("실행쿼리문id",파라미터);
		 * sqlSession.insert("mapper.auctionGoods.insertNewGoods",newGoodsMap); return
		 * (String)newGoodsMap.get("goods");
		 */
		return null;
	}

	public void insertGoodsImageFile(List<ProductDTO> fileList) throws DataAccessException {
		/*
		 * //첨부파일의 수 만큼 insert문을 실행 for(int i=0; i<fileList.size();i++){ ProductDTO
		 * productDTO=(ProductDTO)fileList.get(i);
		 * sqlSession.insert("mapper.auctionGoods.insertGoodsImageFile",productDTO); }
		 */
	}

	public void insertGoodsSize(List<ProductDTO> fileList) throws DataAccessException {
		/*
		 * for(int i=0; i<fileList.size();i++){ ProductDTO
		 * productDTO=(ProductDTO)fileList.get(i);
		 * sqlSession.insert("mapper.acutionGoods.insertGoodsImageFile",productDTO); }
		 */
	}
}