package com.booklog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.booklog.dao.PostSearchDAO;
import com.vos.web.SearchedPostDTO;

@Service
public class PostSearchService {
	
	@Autowired
	PostSearchDAO postSearchDAO;
	
	public List<SearchedPostDTO> getMatchingPostList(String isbn){
	 return postSearchDAO.selectByIsbn(isbn);
	}

}
