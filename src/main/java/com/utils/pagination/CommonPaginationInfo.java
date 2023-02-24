package com.utils.pagination;

import com.vos.web.PaginationCommonVo;

public class CommonPaginationInfo extends PaginationInfo {

	private PaginationCommonVo pageVo;
	
	public CommonPaginationInfo(Object o) {
		pageVo = (PaginationCommonVo) o;
		this.setCurrentPageNo(pageVo.getPageIndex());
		this.setRecordCountPerPage(pageVo.getRecordCountPerPage());
		this.setPageSize(pageVo.getPageSize());
	}
	
	public Object createPaginationInfo() {
		return this;
	}
	
	public Object createCustomVo() {
		pageVo.setFirstIndex(this.getFirstRecordIndex());
		pageVo.setLastIndex(this.getLastRecordIndex());
		
		return pageVo;
	}
}
