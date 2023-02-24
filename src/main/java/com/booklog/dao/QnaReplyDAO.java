package com.booklog.dao;

import java.util.List;

import com.vos.web.QnaReplyVo;
import com.vos.web.QnaVO;

public interface QnaReplyDAO {
	
	public List<QnaReplyVo> selectQnaReplyList(QnaVO qna);

	public int insertQnaReply(QnaReplyVo qnaReply);
	
	public int deleteQnaReply(QnaReplyVo qnaReply);
}
