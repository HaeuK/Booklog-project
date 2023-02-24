package com.booklog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.booklog.dao.QnaDAO;
import com.vos.web.QnaCriteria;
import com.vos.web.QnaVO;

@Service
public class QnaService {
	
	@Autowired
	private QnaDAO qnadao;
	
	public int insertQna(QnaVO qna) {
		 return qnadao.insertQna(qna);
	}
	
	public List<QnaVO> selectList(){
		return qnadao.selectQnaList();
	}
	
	public List<QnaVO> selectQnaListPaging(QnaCriteria cri){
	    return qnadao.selectQnaListPaging(cri);
	}
	
	public int getTotal() {
		return qnadao.getTotal();
	}
	
	public QnaVO selectQna(QnaVO qna) {
		return qnadao.selectQna(qna);
	}
	
	public QnaVO selectQnaWithPassword(QnaVO qna) {
		return qnadao.selectQnaWithPassword(qna);
	}
	
	public int updateQna(QnaVO qna) {
		return qnadao.updateQna(qna);
	}
	
	public int deleteQna(QnaVO qna) {
		return qnadao.deleteQna(qna);
	}
}
