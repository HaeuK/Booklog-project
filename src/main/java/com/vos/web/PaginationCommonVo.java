package com.vos.web;

public class PaginationCommonVo {
	// 현재 페이지
	private int pageIndex = 1;
	// 페이지 사이즈
	private int pageSize = 10;
	// 시작 index
	private int firstIndex = 1;
	// 마지막 index
	private int lastIndex = 10;
	// 페이지당 출력 개수
	private int recordCountPerPage = 10;
	// 페이지 처리[0: 페이징 안함, 1: 페이징 처리]
	private String pagingEnable = "1";
	// 정렬 필드
	private String condOrder = "";
	// 정렬 조건
	private String condAlign = "";
	
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getFirstIndex() {
		return firstIndex;
	}
	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}
	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}
	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}
	public String getPagingEnable() {
		return pagingEnable;
	}
	public void setPagingEnable(String pagingEnable) {
		this.pagingEnable = pagingEnable;
	}
	public String getCondOrder() {
		return condOrder;
	}
	public void setCondOrder(String condOrder) {
		this.condOrder = condOrder;
	}
	public String getCondAlign() {
		return condAlign;
	}
	public void setCondAlign(String condAlign) {
		this.condAlign = condAlign;
	}
	public int getLastIndex() {
		return lastIndex;
	}
	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}
}
