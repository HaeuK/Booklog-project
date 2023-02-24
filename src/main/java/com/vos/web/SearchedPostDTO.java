package com.vos.web;


public class SearchedPostDTO {

	private int postNo;
	private String postKey;
	private int userNo;
	private String userNickname;
	private String isbn;
	private String postTitle;
	private String postContent1;
	private String postWriteDate;
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public String getPostKey() {
		return postKey;
	}
	public void setPostKey(String postKey) {
		this.postKey = postKey;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public String getPostContent1() {
		return postContent1;
	}
	public void setPostContent1(String postContent1) {
		this.postContent1 = postContent1;
	}
	public String getPostWriteDate() {
		return postWriteDate;
	}
	public void setPostWriteDate(String postWriteDate) {
		this.postWriteDate = postWriteDate;
	}
	@Override
	public String toString() {
		return "SearchedPostDTO [postNo=" + postNo + ", postKey=" + postKey + ", userNo=" + userNo + ", userNickname="
				+ userNickname + ", isbn=" + isbn + ", postTitle=" + postTitle + ", postContent1=" + postContent1
				+ ", postWriteDate=" + postWriteDate + "]";
	}
	
	
	
	
	
}
