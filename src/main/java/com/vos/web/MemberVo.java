package com.vos.web;

public class MemberVo {
	private String userno;
	private String userrole;
	private String userid;
	private String userpassword;
	private String usernickname;
	private String useremail;
	private String userlevel;
	private String userfollowingcount;
	private String userfollowedcount;
	private String userregisterdate;
	
	public String getUserno() {
		return userno;
	}
	public void setUserno(String userno) {
		this.userno = userno;
	}
	public String getUserrole() {
		return userrole;
	}
	public void setUserrole(String userrole) {
		this.userrole = userrole;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpassword() {
		return userpassword;
	}
	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}
	public String getUsernickname() {
		return usernickname;
	}
	public void setUsernickname(String usernickname) {
		// signup 페이지에서 form에 포함되었지만, 필수 입력 요소가 아니라 비어있는 상태에서 입력 시도시 공백('')값이 세팅됨. 이 경우 mybatis에서 오류를 뱉기 때문에 null이 그대로 전해질 수 있도록 처리
		/*
		 * if (!usernickname.equals("")) { this.usernickname = usernickname; }
		 */
		this.usernickname = usernickname;
	}
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		// signup 페이지에서 form에 포함되었지만, 필수 입력 요소가 아니라 비어있는 상태에서 입력 시도시 공백('')값이 세팅됨. 이 경우 mybatis에서 오류를 뱉기 때문에 null이 그대로 전해질 수 있도록 처리
		/*
		 * if (!useremail.equals("")) { this.useremail = useremail; }
		 */
	this.useremail = useremail;
	}
	public String getUserlevel() {
		return userlevel;
	}
	public void setUserlevel(String userlevel) {
		this.userlevel = userlevel;
	}
	public String getUserfollowingcount() {
		return userfollowingcount;
	}
	public void setUserfollowingcount(String userfollowingcount) {
		this.userfollowingcount = userfollowingcount;
	}
	public String getUserfollowedcount() {
		return userfollowedcount;
	}
	public void setUserfollowedcount(String userfollowedcount) {
		this.userfollowedcount = userfollowedcount;
	}
	public String getUserregisterdate() {
		return userregisterdate;
	}
	public void setUserregisterdate(String userregisterdate) {
		this.userregisterdate = userregisterdate;
	}
	@Override
	public String toString() {
		return "MemberVo [userno=" + userno + ", userrole=" + userrole + ", userid=" + userid + ", userpassword="
				+ userpassword + ", usernickname=" + usernickname + ", useremail=" + useremail + ", userlevel="
				+ userlevel + ", userfollowingcount=" + userfollowingcount + ", userfollowedcount=" + userfollowedcount
				+ ", userregisterdate=" + userregisterdate + "]";
	}
}
