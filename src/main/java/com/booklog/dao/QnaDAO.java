package com.booklog.dao;

import java.util.List;

import com.vos.web.NoticeVo;
import com.vos.web.QnaCriteria;
import com.vos.web.QnaVO;

public interface QnaDAO {
	
	public int insertQna(QnaVO qna); //등록
	
	public List<QnaVO> selectQnaList(); //게시판 목록
	
	public List<QnaVO> selectQnaListPaging(QnaCriteria cri); //게시판 목록 (페이징 적용)
	
	public int getTotal(); //페이징을 위한 토탈 게시물수 확인

	public QnaVO selectQna(QnaVO qna); //상세게시물
	
	public QnaVO selectQnaWithPassword(QnaVO qna); //게시물 비밀번호 확인
	
	public int updateQna(QnaVO qna); //게시물 수정
	
	public int deleteQna(QnaVO qna); //게시물 삭제
}
