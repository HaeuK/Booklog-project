package com.booklog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.booklog.dao.QnaReplyDAO;
import com.vos.web.QnaReplyVo;
import com.vos.web.QnaVO;
@Service
public class QnaReplyService {
	
	@Autowired
	QnaReplyDAO qnaReplyDao;
	
	public List<QnaReplyVo> selectQnaReplyList(QnaVO qna){
		return qnaReplyDao.selectQnaReplyList(qna);
	}
	
	public int insertQnaReply (QnaReplyVo qnaReply) {
		return qnaReplyDao.insertQnaReply(qnaReply);
	}
	
	public int deleteQnaReply (QnaReplyVo qnaReply) {
		return qnaReplyDao.deleteQnaReply(qnaReply);
	}

}
