package com.vos.web;

public class QnaCodeVo {

	private String code_desc;
	private String code;
	
	public String getCode_desc() {
		return code_desc;
	}

	public void setCode_desc(String code_desc) {
		this.code_desc = code_desc;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Override
	public String toString() {
		return "QnaCodeVo [code_desc=" + code_desc + ", code=" + code + "]";
	}

	
	
	
	
}
