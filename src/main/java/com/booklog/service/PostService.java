package com.booklog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.booklog.dao.PostDAO;
import com.vos.web.PostVo;

@Service
public class PostService {

	@Autowired
	PostDAO postDao;
	
	//추가 post홈 불러오기
	public List<PostVo> postSubhome(PostVo reqVo) {
		return postDao.postSubhome(reqVo);
	}
	
	public int selectPostlike(PostVo reqVo) {
		return postDao.selectPostlike(reqVo);
	}
	
	public int selectPostlikeCount(PostVo reqVo) {
		return postDao.selectPostlikeCount(reqVo);
	}

	public PostVo selectTemppostById(PostVo reqVo) {
		return postDao.selectTemppostById(reqVo);
	}
	
	public int insertPost(PostVo reqVo) {
		return postDao.insertPost(reqVo);
	}
	
	public int insertTmppost(PostVo reqVo) {
		return postDao.insertTmppost(reqVo);
	}
	
    public int updatePost(PostVo reqVo) {
    	return postDao.updatePost(reqVo);
    }
	
	public int updateTemppost(PostVo reqVo) {
		return postDao.updateTemppost(reqVo);
	}

	public int deletePost(PostVo reqVo) {
		return postDao.deletePost(reqVo);
	}
		
	public int deleteTemppost(PostVo reqVo) {
		return postDao.deleteTemppost(reqVo);
	}

	public int selectPostListCount(PostVo paginationVo) {
		return postDao.selectPostListCount(paginationVo);
	}

	public List<PostVo> selectPostList(PostVo paginationVo) {
		return postDao.selectPostList(paginationVo);
	}
	
	public PostVo selectPost(PostVo reqVo) {
		return postDao.selectPost(reqVo);
	}

}
