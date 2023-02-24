package com.vos.web;

public class PostVo extends PaginationCommonVo {
	private String postno;
	private String postkey;
	private String userno;
	private String bookcaseno;
	private String isbn;
	private String booktitle;
	private String bookauthor;
	private String bookcover;
	private String bookcontent;
	private String rate;
	private String posttitle;
	private String periodstart;
	private String periodfinish;
	private String postcontent1;
	private String postcontent2;
	private String postcontent2page;
	private String postcontent3;
	private String postlikecount;   
	private String postwritedate;   
	private String temppostno;
	private String tempsaveddate;
	
	private String edit_role;
	
	public String getPostno() {
		return postno;
	}
	public void setPostno(String postno) {
		this.postno = postno;
	}
	public String getPostkey() {
		return postkey;
	}
	public void setPostkey(String postkey) {
		this.postkey = postkey;
	}
	public String getUserno() {
		return userno;
	}
	public void setUserno(String userno) {
		this.userno = userno;
	}
	public String getBookcaseno() {
		return bookcaseno;
	}
	public void setBookcaseno(String bookcaseno) {
		this.bookcaseno = bookcaseno;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getBooktitle() {
		return booktitle;
	}
	public void setBooktitle(String booktitle) {
		this.booktitle = booktitle;
	}
	public String getBookauthor() {
		return bookauthor;
	}
	public void setBookauthor(String bookauthor) {
		this.bookauthor = bookauthor;
	}
	public String getBookcover() {
		return bookcover;
	}
	public void setBookcover(String bookcover) {
		this.bookcover = bookcover;
	}
	public String getBookcontent() {
		return bookcontent;
	}
	public void setBookcontent(String bookcontent) {
		this.bookcontent = bookcontent;
	}
	public String getRate() {
		return rate;
	}
	public void setRate(String rate) {
		this.rate = rate;
	}
	public String getPosttitle() {
		return posttitle;
	}
	public void setPosttitle(String posttitle) {
		this.posttitle = posttitle;
	}
	public String getPeriodstart() {
		return periodstart;
	}
	public void setPeriodstart(String periodstart) {
		this.periodstart = periodstart;
	}
	public String getPeriodfinish() {
		return periodfinish;
	}
	public void setPeriodfinish(String periodfinish) {
		this.periodfinish = periodfinish;
	}
	public String getPostcontent1() {
		return postcontent1;
	}
	public void setPostcontent1(String postcontent1) {
		this.postcontent1 = postcontent1;
	}
	public String getPostcontent2() {
		return postcontent2;
	}
	public void setPostcontent2(String postcontent2) {
		this.postcontent2 = postcontent2;
	}
	public String getPostcontent2page() {
		return postcontent2page;
	}
	public void setPostcontent2page(String postcontent2page) {
		this.postcontent2page = postcontent2page;
	}
	public String getPostcontent3() {
		return postcontent3;
	}
	public void setPostcontent3(String postcontent3) {
		this.postcontent3 = postcontent3;
	}
	public String getPostlikecount() {
		return postlikecount;
	}
	public void setPostlikecount(String postlikecount) {
		this.postlikecount = postlikecount;
	}
	public String getPostwritedate() {
		return postwritedate;
	}
	public void setPostwritedate(String postwritedate) {
		this.postwritedate = postwritedate;
	}
	public String getTemppostno() {
		return temppostno;
	}
	public void setTemppostno(String temppostno) {
		this.temppostno = temppostno;
	}
	public String getTempsaveddate() {
		return tempsaveddate;
	}
	public void setTempsaveddate(String tempsaveddate) {
		this.tempsaveddate = tempsaveddate;
	}
	public String getEdit_role() {
		return edit_role;
	}
	public void setEdit_role(String edit_role) {
		this.edit_role = edit_role;
	}
	@Override
	public String toString() {
		return "PostVo [postno=" + postno + ", postkey=" + postkey + ", userno=" + userno + ", bookcaseno=" + bookcaseno
				+ ", isbn=" + isbn + ", booktitle=" + booktitle + ", bookauthor=" + bookauthor + ", bookcover="
				+ bookcover + ", bookcontent=" + bookcontent + ", rate=" + rate + ", posttitle=" + posttitle
				+ ", periodstart=" + periodstart + ", periodfinish=" + periodfinish + ", postcontent1=" + postcontent1
				+ ", postcontent2=" + postcontent2 + ", postcontent2page=" + postcontent2page + ", postcontent3="
				+ postcontent3 + ", postlikecount=" + postlikecount + ", postwritedate=" + postwritedate
				+ ", temppostno=" + temppostno + ", tempsaveddate=" + tempsaveddate + ", edit_role=" + edit_role + "]";
	}
}
