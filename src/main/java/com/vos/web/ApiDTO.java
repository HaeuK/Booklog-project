package com.vos.web;

public class ApiDTO {
	
	private String id;
	private String key;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	@Override
	public String toString() {
		return "ApiDTO [id=" + id + ", key=" + key + "]";
	}
	
	

}
