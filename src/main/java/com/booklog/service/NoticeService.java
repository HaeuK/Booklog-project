package com.booklog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.booklog.dao.NoticeDAO;
import com.vos.web.NoticeVo;

@Service
public class NoticeService {
	@Autowired
	private NoticeDAO noticeDao;

	public List<NoticeVo> selectNoticeList(NoticeVo paginationVo) {
		return noticeDao.selectNoticeList(paginationVo);
	}

	public int selectNoticeListCount(NoticeVo paginationVo) {
		return noticeDao.selectNoticeListCount(paginationVo);
	}

	public NoticeVo selectNotice(NoticeVo reqVo) {
		return noticeDao.selectNotice(reqVo);
	}

	public int insertNotice(NoticeVo reqVo) {
		return noticeDao.insertNotice(reqVo);
	}

	public int deleteNotice(NoticeVo reqVo) {
		return noticeDao.deleteNotice(reqVo);
	}

	public int updateNotice(NoticeVo reqVo) {
		return noticeDao.updateNotice(reqVo);
	}
}
