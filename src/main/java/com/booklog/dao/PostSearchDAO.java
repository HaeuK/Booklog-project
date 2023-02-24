package com.booklog.dao;

import java.util.List;

import com.vos.web.SearchedPostDTO;

public interface PostSearchDAO {

	public List<SearchedPostDTO> selectByIsbn (String isbn); //isbn으로 독후감 검색
	
}
