package com.booklog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.booklog.dao.CommonDAO;
import com.vos.web.CommonVo;

@Service
public class CommonService {
	
	@Autowired
	CommonDAO commonDao;

	public List<CommonVo> selectNoticeCodeList() {
		return commonDao.selectNoticeCodeList();
	}

}
