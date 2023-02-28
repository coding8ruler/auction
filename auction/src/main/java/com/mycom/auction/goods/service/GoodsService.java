package com.mycom.auction.goods.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycom.auction.goods.domain.ProductDTO;
import com.mycom.auction.goods.repository.GoodsRepository;

@Service
public class GoodsService{

	@Autowired
	GoodsRepository goodsRepository;
	

	public String insertImageGoods(Map newGoodsMap) throws Exception {
		//int article_id에는 article테이블에 지금 입력된 article테이블의 글번호
		String goods=goodsRepository.insertNewGoods(newGoodsMap);
				
			//List<ImageFileVO> imageFileList에는 첨부파일정보
			List<ProductDTO> imageFileList= (ArrayList)newGoodsMap.get("imageFileList");
			for(ProductDTO productDTO : imageFileList) {
				productDTO.setGoods(goods);
				System.out.println("서비스 for문안 imageFileVO="+productDTO);
			}
			goodsRepository.insertGoodsImageFile(imageFileList);
			goodsRepository.insertGoodsSize(imageFileList);
			return goods;
	}

	
}








