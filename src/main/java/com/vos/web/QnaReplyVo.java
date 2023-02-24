package com.vos.web;

public class QnaReplyVo {
	
	private int qnaReplyNo;
	private int qnaNo;
	private String qnaReplyWriter;
	private String qnaReplyContent;
	private String qnaReplyTime;
	private String qnaReplyIsDeleted;
	
	@Override
	public String toString() {
		return "QnaReplyVo [qnaReplyNo=" + qnaReplyNo + ", qnaNo=" + qnaNo + ", qnaReplyWriter=" + qnaReplyWriter
				+ ", qnaReplyContent=" + qnaReplyContent + ", qnaReplyTime=" + qnaReplyTime + ", qnaReplyIsDeleted="
				+ qnaReplyIsDeleted + "]";
	}
	public int getQnaReplyNo() {
		return qnaReplyNo;
	}
	public void setQnaReplyNo(int qnaReplyNo) {
		this.qnaReplyNo = qnaReplyNo;
	}
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getQnaReplyWriter() {
		return qnaReplyWriter;
	}
	public void setQnaReplyWriter(String qnaReplyWriter) {
		this.qnaReplyWriter = qnaReplyWriter;
	}
	public String getQnaReplyContent() {
		return qnaReplyContent;
	}
	public void setQnaReplyContent(String qnaReplyContent) {
		this.qnaReplyContent = qnaReplyContent;
	}
	public String getQnaReplyTime() {
		return qnaReplyTime;
	}
	public void setQnaReplyTime(String qnaReplyTime) {
		this.qnaReplyTime = qnaReplyTime;
	}
	public String getQnaReplyIsDeleted() {
		return qnaReplyIsDeleted;
	}
	public void setQnaReplyIsDeleted(String qnaReplyIsDeleted) {
		this.qnaReplyIsDeleted = qnaReplyIsDeleted;
	}
	
	

	
	
}
