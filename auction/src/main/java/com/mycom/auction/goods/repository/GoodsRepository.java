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
		 sqlSession.insert("mapper.auctionGoods.insertNewGoods",newGoodsMap);
		return (String)newGoodsMap.get("goods");
	}

	public void insertGoodsImageFile(List<ProductDTO> fileList) throws DataAccessException {
		for(int i=0; i<fileList.size();i++){ 
		ProductDTO productDTO=(ProductDTO)fileList.get(i);
		 sqlSession.insert("mapper.auctionGoods.insertGoodsImageFile",productDTO); }
		 
	}

	public void insertGoodsSize(Map newGoodsMap) throws DataAccessException {
		for(int i=0; i<newGoodsMap.size();i++){
			if(newGoodsMap.containsKey("goodsSize"+i)) {
				newGoodsMap.put("goodsSize", newGoodsMap.get("goodsSize"+i));
				System.out.println("insertGoodsSize에서 newGoodsMap.put"+newGoodsMap.get("goodsSize"));
				sqlSession.insert("mapper.auctionGoods.insertGoodsSizeFile",newGoodsMap);
			}
		}
	}

	public List<ProductDTO> selectAllGoodsList() {
		List<ProductDTO> goodsAllInfo = sqlSession.selectList("mapper.auctionGoods.selectGoodsAllInfo");
		return goodsAllInfo;
	}

	public ProductDTO selectImageInfo(String goods) {
		ProductDTO ImageInfo=sqlSession.selectOne("mapper.auctionGoods.selectImageInfo", goods);
		return ImageInfo;
	}

	public ProductDTO selectGoodsList(String goods) {
		ProductDTO goodsInfo = sqlSession.selectOne("mapper.auctionGoods.selectGoodsInfo",goods);
		return goodsInfo;
	}

	public List<ProductDTO> selectImageAllInfo(String goods) {
		List<ProductDTO> ImageAllInfo=sqlSession.selectList("mapper.auctionGoods.selectImageAllInfo", goods);
		return ImageAllInfo;
	}

	public List<ProductDTO> selectSizeAllInfo(String goods) {
		List<ProductDTO> SizeAllInfo=sqlSession.selectList("mapper.auctionGoods.selectSizeAllInfo", goods);
		return SizeAllInfo;
	}
}