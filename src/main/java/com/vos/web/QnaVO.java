package com.vos.web;

public class QnaVO {

	private int qnaNo;
	private String qnaCode; //바꿈
	private String qnaTitle;
	private String qnaPassword;
	private String qnaContent;
	private int qnaWriter;
	private String qnaWriterNickname;
	private String qnaIsPublic;
	private int qnaReplyCount;
	private String qnaWriteTime;
	private String qnaModifyTime;
	private String qnaIsDeleted;
	
	@Override
	public String toString() {
		return "QnaVO [qnaNo=" + qnaNo + ", qnaCode=" + qnaCode + ", qnaTitle=" + qnaTitle + ", qnaPassword="
				+ qnaPassword + ", qnaContent=" + qnaContent + ", qnaWriter=" + qnaWriter + ", qnaWriterNickname="
				+ qnaWriterNickname + ", qnaIsPublic=" + qnaIsPublic + ", qnaReplyCount=" + qnaReplyCount
				+ ", qnaWriteTime=" + qnaWriteTime + ", qnaModifyTime=" + qnaModifyTime + ", qnaIsDeleted="
				+ qnaIsDeleted + "]";
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getQnaCode() {
		return qnaCode;
	}

	public void setQnaCode(String qnaCode) {
		this.qnaCode = qnaCode;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaPassword() {
		return qnaPassword;
	}

	public void setQnaPassword(String qnaPassword) {
		this.qnaPassword = qnaPassword;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public int getQnaWriter() {
		return qnaWriter;
	}

	public void setQnaWriter(int qnaWriter) {
		this.qnaWriter = qnaWriter;
	}

	public String getQnaWriterNickname() {
		return qnaWriterNickname;
	}

	public void setQnaWriterNickname(String qnaWriterNickname) {
		this.qnaWriterNickname = qnaWriterNickname;
	}

	public String getQnaIsPublic() {
		return qnaIsPublic;
	}

	public void setQnaIsPublic(String qnaIsPublic) {
		this.qnaIsPublic = qnaIsPublic;
	}

	public int getQnaReplyCount() {
		return qnaReplyCount;
	}

	public void setQnaReplyCount(int qnaReplyCount) {
		this.qnaReplyCount = qnaReplyCount;
	}

	public String getQnaWriteTime() {
		return qnaWriteTime;
	}

	public void setQnaWriteTime(String qnaWriteTime) {
		this.qnaWriteTime = qnaWriteTime;
	}

	public String getQnaModifyTime() {
		return qnaModifyTime;
	}

	public void setQnaModifyTime(String qnaModifyTime) {
		this.qnaModifyTime = qnaModifyTime;
	}

	public String getQnaIsDeleted() {
		return qnaIsDeleted;
	}

	public void setQnaIsDeleted(String qnaIsDeleted) {
		this.qnaIsDeleted = qnaIsDeleted;
	}
	
	
	
	
	
	
}
	