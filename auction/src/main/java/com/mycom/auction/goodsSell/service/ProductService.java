package com.mycom.auction.goodsSell.service;

import java.util.List;
import java.util.Map;
import com.mycom.auction.goodsSell.domain.*;

public interface ProductService {
	
	//판매 상품 등록
	public int productAdd(Map productAdd) throws Exception;
	
	//판매 상품 리스트 조회
	public List<Product> productList() throws Exception;
	
	
	 //업로드 사진 조회 
	public List<ImageFileVO> productImageList(int sellNo) throws Exception;
	
	//판매 상품 상세 조회
	public Product productDetail(int sellNo) throws Exception;
	
	//판매 상품 등급 변경
	public int goodsGradeChange(Map gradeMap) throws Exception;
	
	//판매하기 게시글 갯수 조회 (페이징 처리)
	public int productListCount() throws Exception;
	
	//페이징 처리
	public List<Product> getListWithPaging(Criteria cri) throws Exception;
	 
	
	//판매글 자동 삭제 메서드 (스캐줄러)
	public int productAutoDelete() throws Exception;
	
	//구매 상품상세 정보
	public Product productBuyDetail(Map map) throws Exception;
	
	//구매 상품 등록
	public int productBuy(Map map) throws Exception;
	
	//판매 완료 상태물품 목록 조회
	public List<Product> productAutoList(int goodsGrade) throws Exception;
		
 }
