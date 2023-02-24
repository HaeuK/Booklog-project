package com.booklog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.booklog.dao.MemberDAO;
import com.vos.web.MemberVo;

@Service
public class MemberService {
	@Autowired
	private MemberDAO memberDao;
	
	public List<MemberVo> selectAllMember() {
		return memberDao.selectAllMember();
	}
	
	public MemberVo selectMember(MemberVo reqVo) {
		return memberDao.selectMember(reqVo);
	}
	
	public MemberVo selectMemberNo(MemberVo reqVo) {
		return memberDao.selectMemberNo(reqVo);
	}
	
	public MemberVo selectMemberIsExist(MemberVo reqVo) {
		return memberDao.selectMemberIsExist(reqVo);
	}
	
	public MemberVo selectMemberByEmail(MemberVo reqVo) {
		return memberDao.selectMemberByEmail(reqVo);
	}

	public MemberVo selectMemberByIdAndEmail(MemberVo reqVo) {
		return memberDao.selectMemberByIdAndEmail(reqVo);
	}
	
	public int updateMemberByAdmin(MemberVo reqVo) {
		return memberDao.updateMemberByAdmin(reqVo);
	}
	
	public int insertMember(MemberVo reqVo) {
		return memberDao.insertMember(reqVo);
	}
	
	public int updateMember(MemberVo reqVo) {
		return memberDao.updateMember(reqVo);
	}
	
	public int deleteMember(MemberVo reqVo) {
		return memberDao.deleteMember(reqVo);
	}
}
