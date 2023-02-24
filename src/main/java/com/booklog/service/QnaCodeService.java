package com.booklog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.booklog.dao.QnaCodeDAO;
import com.vos.web.QnaCodeVo;

@Service
public class QnaCodeService {
	
	@Autowired
	QnaCodeDAO qnaCodeDAO;
	
	public List<QnaCodeVo> selectQnaCodeList() {
		return qnaCodeDAO.selectQnaCodeList();
	}

}
