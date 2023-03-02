package com.mycom.auction.offerboard.domain;

import java.util.Date;

public class OfferBoard {

	
	private int offerno;
	private String id;
	private String offertitle;
	private String offerpoint; // 거래장소
	private int pay; 			//급여
	private Date offertime;
	private String offercontent;
	private int viewcnt; //조회수
	private String offerhard; //말머리
	
	
	
	
	
	public void setOfferno(int offerno) {
		this.offerno = offerno;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setOffertitle(String offertitle) {
		this.offertitle = offertitle;
	}

	public void setOfferpoint(String offerpoint) {
		this.offerpoint = offerpoint;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public void setOffertime(Date offertime) {
		this.offertime = offertime;
	}

	public void setOffercontent(String offercontent) {
		this.offercontent = offercontent;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	public void setOfferhard(String offerhard) {
		this.offerhard = offerhard;
	}

	public int getOfferno() {
		return offerno;
	}

	public String getId() {
		return id;
	}

	public String getOffertitle() {
		return offertitle;
	}

	public String getOfferpoint() {
		return offerpoint;
	}

	public int getPay() {
		return pay;
	}

	public Date getOffertime() {
		return offertime;
	}

	public String getOffercontent() {
		return offercontent;
	}

	public int getViewcnt() {
		return viewcnt;
	}

	public String getOfferhard() {
		return offerhard;
	}

	@Override
	public String toString() {
		return "OfferBoard [offerno=" + offerno + ", id=" + id + ", offertitle=" + offertitle + ", offerpoint="
				+ offerpoint + ", pay=" + pay + ", offertime=" + offertime + ", offercontent=" + offercontent
				+ ", viewcnt=" + viewcnt + ", offerhard=" + offerhard + "]";
	}

	public OfferBoard(int offerno, String id, String offertitle, String offerpoint, int pay, Date offertime,
			String offercontent, int viewcnt, String offerhard) {
		super();
		this.offerno = offerno;
		this.id = id;
		this.offertitle = offertitle;
		this.offerpoint = offerpoint;
		this.pay = pay;
		this.offertime = offertime;
		this.offercontent = offercontent;
		this.viewcnt = viewcnt;
		this.offerhard = offerhard;
	}
	
	
	
	
}
