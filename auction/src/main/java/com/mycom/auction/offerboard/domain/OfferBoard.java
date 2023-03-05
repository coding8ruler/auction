package com.mycom.auction.offerboard.domain;

import java.util.Date;

import java.util.List;

public class OfferBoard {

	//필드
	private int offerno; //게시글 번호
	private String id;	//사용자 ID
	private String offertitle; //제목
	private String offerpoint; // 거래장소
	private int pay; 			//급여
	private Date offertime;	//거래 일시
	private String offercontent; //본문내용
	private int viewcnt; //조회수
	private int offercnt; //말머리
	
	
	//페이징 필드
	
	private int totalcnt;
	private int currentpage;
	private List<OfferBoard> contents;
	private int totalpages;
	private int startpage;
	private int endpage;

	//기본생성자
	public OfferBoard() {}
	
	//게시글정보 생성자
	public OfferBoard(int offerno, String id, String offertitle, String offerpoint, int pay, Date offertime,
			String offercontent, int viewcnt, int offercnt) {
		this.offerno = offerno;
		this.id = id;
		this.offertitle = offertitle;
		this.offerpoint = offerpoint;
		this.pay = pay;
		this.offertime = offertime;
		this.offercontent = offercontent;
		this.viewcnt = viewcnt;
		this.offercnt = offercnt;
	}
		//페이징 생성자
		public OfferBoard(int totalcnt, int currentPage, 
				   int size, List<OfferBoard> contents) {
			this.totalcnt = totalcnt;
			this.currentpage = currentPage;
			this.contents = contents;
			if (totalcnt == 0) { 		//게시물이 존재하지 않는 경우
				totalpages = 0;
				startpage = 0;
				endpage = 0;
			}else{ 				//게시물이 존재하는 경우
				totalpages = totalcnt/size; //총페이지수=전체게시물수/1page당 보여줄 게시물수
				if (totalcnt%size>0) {      //나머지가 0보다 크면
					totalpages++;        //전체페이수를 1씩증가
				}
				int modVal=currentPage%5;  //user가보고싶은 요청페이지를 5로 나눈 나머지를 저장
				startpage =currentPage/5*5 + 1;
				//modVal==0은 요청페이지가 5의배수인 5 10 15....
				if (modVal==0) 
				startpage-=5;//startPage=startPage-5;
				endpage = startpage + 4;
				//endPage가 전체페이수보다크면  endPage값을 전체페이수로 적용해라
				if(endpage>totalpages)endpage=totalpages;
			}
		}
	
	
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
	public void setOffercnt(int offercnt) {
		this.offercnt = offercnt;
	}
	
	
	public void setTotalCnt(int totalcnt) {
		this.totalcnt = totalcnt;
	}
	public void setCurrentpage(int currentpage) {
		this.currentpage = currentpage;
	}
	public void setContents(List<OfferBoard> contents) {
		this.contents = contents;
	}
	public void setTotalpages(int totalpages) {
		this.totalpages = totalpages;
	}
	public void setStartpage(int startpage) {
		this.startpage = startpage;
	}
	public void setEndpage(int endpage) {
		this.endpage = endpage;
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
	public int getOffercnt() {
		return offercnt;
	}

	@Override
	public String toString() {
		return "OfferBoard [offerno=" + offerno + ", id=" + id + ", offertitle=" + offertitle + ", offerpoint="
				+ offerpoint + ", pay=" + pay + ", offertime=" + offertime + ", offercontent=" + offercontent
				+ ", viewcnt=" + viewcnt + ", offercnt=" + offercnt + ", totalcnt=" + totalcnt + ", currentpage="
				+ currentpage + ", contents=" + contents + ", totalpages=" + totalpages + ", startpage=" + startpage
				+ ", endpage=" + endpage + "]";
	}
	
	
	public int getTotalCnt() {
		return totalcnt;
	}
	public int getCurrentpage() {
		return currentpage;
	}
	public List<OfferBoard> getContents() {
		return contents;
	}
	public int getTotalpages() {
		return totalpages;
	}
	public int getStartpage() {
		return startpage;
	}
	public int getEndpage() {
		return endpage;
	}

	
	
	
	
}
