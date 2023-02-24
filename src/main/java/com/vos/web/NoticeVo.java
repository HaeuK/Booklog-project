package com.vos.web;

public class NoticeVo extends PaginationCommonVo {
	private String noticeno;
	private String noticecode;
	private String noticetitle;
	private String noticecontent;
	private String noticefile;
	private String noticewriter;
	private String noticewritetime;
	
	private String edit_role;
	
	public String getNoticeno() {
		return noticeno;
	}
	public void setNoticeno(String noticeno) {
		this.noticeno = noticeno;
	}
	public String getNoticecode() {
		return noticecode;
	}
	public void setNoticecode(String noticecode) {
		this.noticecode = noticecode;
	}
	public String getNoticetitle() {
		return noticetitle;
	}
	public void setNoticetitle(String noticetitle) {
		this.noticetitle = noticetitle;
	}
	public String getNoticecontent() {
		return noticecontent;
	}
	public void setNoticecontent(String noticecontent) {
		this.noticecontent = noticecontent;
	}
	public String getNoticefile() {
		return noticefile;
	}
	public void setNoticefile(String noticefile) {
		this.noticefile = noticefile;
	}
	public String getNoticewriter() {
		return noticewriter;
	}
	public void setNoticewriter(String noticewriter) {
		this.noticewriter = noticewriter;
	}
	public String getNoticewritetime() {
		return noticewritetime;
	}
	public void setNoticewritetime(String noticewritetime) {
		this.noticewritetime = noticewritetime;
	}
	public String getEdit_role() {
		return edit_role;
	}
	public void setEdit_role(String edit_role) {
		this.edit_role = edit_role;
	}
	@Override
	public String toString() {
		return "NoticeVo [noticeno=" + noticeno + ", noticecode=" + noticecode + ", noticetitle=" + noticetitle
				+ ", noticecontent=" + noticecontent + ", noticefile=" + noticefile + ", noticewriter=" + noticewriter
				+ ", noticewritetime=" + noticewritetime + ", noticedeleted=" + ", edit_role="
				+ edit_role + "]";
	}
}
