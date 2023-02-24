package com.vos.web;

public class CommonVo {
	private String code_group;
	private String code;
	private String code_desc;
	
	public String getCode_group() {
		return code_group;
	}
	public void setCode_group(String code_group) {
		this.code_group = code_group;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getCode_desc() {
		return code_desc;
	}
	public void setCode_desc(String code_desc) {
		this.code_desc = code_desc;
	}
	@Override
	public String toString() {
		return "CommonVo [code_group=" + code_group + ", code=" + code + ", code_desc=" + code_desc + "]";
	}
}
