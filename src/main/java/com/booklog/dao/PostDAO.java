package com.booklog.dao;

import java.util.List;

import com.vos.web.PostVo;

public interface PostDAO {
	
	// home에 최신 독후감 출력을 위한 DAO
	public List<PostVo> postSubhome(PostVo reqVo);
	
	public int selectPostlike(PostVo reqVo) ;
	
	public int selectPostlikeCount(PostVo reqVo) ;

	public PostVo selectTemppostById(PostVo reqVo) ;
	
	public int insertPost(PostVo reqVo) ;
	
	public int insertTmppost(PostVo reqVo) ;
	
    public int updatePost(PostVo reqVo) ;
	
	public int updateTemppost(PostVo reqVo) ;

	public int deletePost(PostVo reqVo) ;
		
	public int deleteTemppost(PostVo reqVo) ;

	public int selectPostListCount(PostVo paginationVo);

	public List<PostVo> selectPostList(PostVo paginationVo);
	
	public PostVo selectPost(PostVo reqVo);

}
