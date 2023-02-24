package com.booklog.dao;

import java.util.List;

import com.vos.web.MemberVo;

public interface MemberDAO {
	public List<MemberVo> selectAllMember();
	
	public MemberVo selectMember(MemberVo reqVo);
	
	public MemberVo selectMemberNo(MemberVo reqVo);
	
	public MemberVo selectMemberIsExist(MemberVo reqVo);
	
	public MemberVo selectMemberByEmail(MemberVo reqVo);

	public MemberVo selectMemberByIdAndEmail(MemberVo reqVo);
	
	public int updateMemberByAdmin(MemberVo reqVo);
	
	public int insertMember(MemberVo reqVo);
	
	public int updateMember(MemberVo reqVo);
	
	public int deleteMember(MemberVo reqVo);
}
