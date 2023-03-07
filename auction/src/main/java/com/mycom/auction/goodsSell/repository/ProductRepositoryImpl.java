package com.mycom.auction.goodsSell.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mycom.auction.goodsSell.domain.Criteria;
import com.mycom.auction.goodsSell.domain.ImageFileVO;
import com.mycom.auction.goodsSell.domain.Product;
import com.mycom.auction.goodsSell.domain.ProductPurchaseDTO;

@Repository
public class ProductRepositoryImpl implements ProductRepository{

	
	@Autowired
	private SqlSession sqlSession;
	
	
	//판매하기 게시글 등록
	@Override
	public int insertProductAdd(Map productAdd) throws DataAccessException {
		sqlSession.insert("mapper.product.insertProductAdd",productAdd);
		return Integer.parseInt((String)productAdd.get("sellNo"));
	}
	
	//판매하기 게시글 이미지 등록
	@Override
	public void insertProductImageFile(List<ImageFileVO> fileList) throws DataAccessException {
		for(int i=0; i<fileList.size(); i++) {
			ImageFileVO imageFileVO=(ImageFileVO)fileList.get(i);
			sqlSession.insert("mapper.product.insertProductImageFile",imageFileVO);
		}
	}
	
	//판매하기 게시글 전체 조회
	@Override
	public List<Product> productListSelect() throws DataAccessException {
		List<Product> list = sqlSession.selectList("mapper.product.productAllList");
		return list;
	}

	//판매하기 게시글 상세조회(이미지)
	@Override
	public List<ImageFileVO> productImageSelect(int sellNo) throws DataAccessException {
		List<ImageFileVO> fileList=sqlSession.selectList("mapper.product.imageFileList",sellNo);
		return fileList;
	}
	
	//판매하기 게시글 상세조회(상품 정보)
	@Override
	public Product productSelectOne(int sellNo) throws DataAccessException {
		Product product=sqlSession.selectOne("mapper.product.productDetail",sellNo);
		return product;
	}
	
	//판매하기 게시글 상태 변경
	@Override
	public int goodsGradeUpdate(Map gradeChangeMap) throws DataAccessException {
		int cnt=sqlSession.update("mapper.product.goodsGradeUpdate",gradeChangeMap);
		return cnt;
	}
	
	//판매하기 게시글 목록 갯수 조회
	@Override
	public int productListConut() throws DataAccessException {
		int cnt=sqlSession.selectOne("mapper.product.productListConut");
		return cnt;
	}
	
	//
	@Override
	public List<Product> getListWithPaging(Criteria cri) {
		List<Product> list = sqlSession.selectList("mapper.product.getListWithPaging",cri);
		return list;
	}
	
	//판매하기 상품 자동 삭제
	@Override
	public int productAutoDelete() {
			int cnt = sqlSession.update("mapper.product.productAutoDelete");
		return cnt;
	}
	
	//구매하기 상품 상세 정보
	@Override
	public Product productBuyDetail(Map map) throws DataAccessException {
		Product product = sqlSession.selectOne("mapper.product.productBuyDetail",map);
		return product;
	}
	
	//구매 상품 등록
	@Override
	public int productBuyInsert(Map map) throws DataAccessException {
		
		int cnt=sqlSession.insert("mapper.product.productBuyInsert",map);
		return cnt;
	}

	
	
}
