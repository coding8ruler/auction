package com.mycom.auction.goodsSell.domain;

public class ProductPurchaseDTO {
	
	private String sellNo;
	private String goodsSize;
	private int desiredPurPrice;
	private String goodsName;
	private String id;
	private int desireQuantity;
	
	
	public ProductPurchaseDTO(String sellNo, String goodsSize, int desiredPurPrice, String goodsName,
			String id, int desireQuantity) {
		this.sellNo = sellNo;
		this.goodsSize = goodsSize;
		this.desiredPurPrice = desiredPurPrice;
		this.goodsName = goodsName;
		this.id = id;
		this.desireQuantity = desireQuantity;
	}


	public String getSellNo() {
		return sellNo;
	}
	public void setSellNo(String sellNo) {
		this.sellNo = sellNo;
	}
	public String getGoodsSize() {
		return goodsSize;
	}
	public void setGoodsSize(String goodsSize) {
		this.goodsSize = goodsSize;
	}
	public int getDesiredPurPrice() {
		return desiredPurPrice;
	}
	public void setDesiredPurPrice(int desiredPurPrice) {
		this.desiredPurPrice = desiredPurPrice;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getDesireQuantity() {
		return desireQuantity;
	}
	public void setDesireQuantity(int desireQuantity) {
		this.desireQuantity = desireQuantity;
	}


	@Override
	public String toString() {
		return "ProductPurchaseDTO [sellNo=" + sellNo + ", goodsSize=" + goodsSize + ", desiredPurPrice="
				+ desiredPurPrice + ", goodsName=" + goodsName + ", id=" + id
				+ ", desireQuantity=" + desireQuantity + "]";
	}
	
	
	
}
