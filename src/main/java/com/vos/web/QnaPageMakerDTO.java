package com.vos.web;

public class QnaPageMakerDTO {
	
	private int startPage; //화면에 보이는 시작 페이지
	private int endPage; //화면에 보이는 끝 페이지
	private boolean prev,next;//이전페이지, 다음 페이지 존재유무
	private int total; //총 게시물 수
	private QnaCriteria cri; //현재 페이지,페이지당 게시물 표시 수 정보
	
	public QnaPageMakerDTO(QnaCriteria cri,int total) {
		this.cri = cri;
		this.total = total;
		
		this.endPage= (int)(Math.ceil(cri.getPageNum()/10.0))*10;
		this.startPage = this.endPage -9;
		
		int realEnd = (int)(Math.ceil(total*1.0/cri.getAmount()));
		
		
		if(realEnd<this.endPage) {
			this.endPage= realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage<realEnd;
	}

	@Override
	public String toString() {
		return "QnaPageMakerDTO [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", total=" + total + ", cri=" + cri + "]";
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public QnaCriteria getCri() {
		return cri;
	}

	public void setCri(QnaCriteria cri) {
		this.cri = cri;
	}
	
	
	
	

}
