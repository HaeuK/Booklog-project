package com.booklog.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.booklog.service.BookSearchService;
import com.booklog.service.PostSearchService;
import com.vos.web.SearchedPostDTO;

@Controller
@RequestMapping("/search") 
public class SearchController {
	
	@Autowired
	PostSearchService postSearchService;
	@Autowired
	BookSearchService bookSearchService;
	
	@GetMapping("/bookSearch")
	public String bookSearch() {
		return "/search/bookSearch";
	}
	
	@GetMapping(path="/bookSearch.do", produces = "application/json ;charset=utf8")
	//bookSearch페이지에서 검색 아작스로 제이슨타입 리턴 
	@ResponseBody
	//https://cheershennah.tistory.com/179
	public String bookSearchAjax(@RequestParam(value = "keyword", required = false) String keyword ,HttpServletResponse rs) {
		
		if (keyword != null) {
			String responseBody = bookSearchService.getJSON(keyword);	 
					return responseBody;

				}
				return "";
	}
	
	
	@GetMapping(path="/postSearch")
	public String pageSearch(@RequestParam("query")String isbn, Model model) {
		
		try {
			List<SearchedPostDTO> postList = postSearchService.getMatchingPostList(isbn);
			   if(!postList.isEmpty()) { 
				 model.addAttribute("postList",postList );
				   
				   }
			 
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return "/search/postSearch";
	}
}
