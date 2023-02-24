package com.booklog.dao;

import java.util.List;

import com.vos.web.NoticeVo;

public interface NoticeDAO {
	public List<NoticeVo> selectNoticeList(NoticeVo paginationVo);

	public int selectNoticeListCount(NoticeVo paginationVo);

	public NoticeVo selectNotice(NoticeVo reqVo);
	
	public int insertNotice(NoticeVo reqVo);

	public int deleteNotice(NoticeVo reqVo);

	public int updateNotice(NoticeVo reqVo);
}
