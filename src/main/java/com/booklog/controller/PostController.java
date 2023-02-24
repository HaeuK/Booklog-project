package com.booklog.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.booklog.service.BookSearchService;
import com.booklog.service.PostSearchService;
import com.booklog.service.PostService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.utils.pagination.CommonPaginationInfo;
import com.vos.web.MemberVo;
import com.vos.web.PostVo;
import com.vos.web.ReturnVo;

@Controller
@RequestMapping("/post")
public class PostController {
	
	private static final Logger logger = LoggerFactory.getLogger(PostController.class);
	
	@Autowired
	PostService postService;
	@Autowired
	PostSearchService postSearchService;
	@Autowired
	BookSearchService bookSearchService;
	
	@GetMapping("/bookSearch")
	public String bookSearch() {
		return "/post/bookSearch";
	}
	
	@GetMapping(path="/postsBookSearch.do", produces = "application/json ;charset=utf8")
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
	
	// 페이지 load 영역
	
	@GetMapping("/list")
	public String list(HttpServletRequest request, Model model) {
		logger.info("RequestMethod[GET] : /post/list");
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("login");
		MemberVo loginVo = null;
		if(obj != null && obj.getClass().getSimpleName().equals("MemberVo")){
			loginVo = (MemberVo) obj;
			model.addAttribute("loginVo", loginVo);
		}
		
		PostVo paginationVo = new PostVo();
		
		paginationVo.setPagingEnable("1");
		paginationVo.setPageIndex(1);
		paginationVo.setPageSize(10);
		paginationVo.setRecordCountPerPage(10);
		
		paginationVo.setCondOrder("POSTNO");
		paginationVo.setCondAlign("DESC");
		
		paginationVo.setUserno(loginVo.getUserno());
		
		CommonPaginationInfo pagination = new CommonPaginationInfo(paginationVo);
		pagination.setTotalRecordCount(postService.selectPostListCount(paginationVo));
		
		paginationVo = (PostVo) pagination.createCustomVo();
		
		List<PostVo> postList = postService.selectPostList(paginationVo);
		model.addAttribute("postList", postList);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("paginationVo", paginationVo);

		return "/post/list";
	}
	
	@PostMapping("/innerpage/innerPostList")
	public String innerPostList(HttpServletRequest HttpRequest, PostVo reqVo, Model model) {
		logger.info("RequestMethod[POST] : /innerpage/innerPostList <ajaxload>");
		
		CommonPaginationInfo pagination = new CommonPaginationInfo(reqVo);
		pagination.setTotalRecordCount(postService.selectPostListCount(reqVo));
		
		reqVo = (PostVo) pagination.createCustomVo();
		
		List<PostVo> postList = postService.selectPostList(reqVo);
		model.addAttribute("postList", postList);

		model.addAttribute("pagination", pagination);
		
		return "/post/innerpage/innerPostList";
	}
	
	@GetMapping("/edit")
	public String edit(HttpServletRequest request, Model model) {
		logger.info("RequestMethod[GET] : /post/edit");
		
		HttpSession session = request.getSession();
		
		ObjectMapper objectMapper = new ObjectMapper();
		String json = request.getParameter("toController");
		
		System.out.println(json);
		
		try {
			PostVo postVo = objectMapper.readValue(json, PostVo.class);
			System.out.println(postVo);
			model.addAttribute("postVo", postVo); //클릭한 책의 isbn,booktitle,bookauthor,bookcover,bookcontent 정보 갖고 있는 postVo객체 
			
			session = request.getSession();
			Object obj = session.getAttribute("login");
			if (obj != null && obj.getClass().getSimpleName().equals("MemberVo")) {
				MemberVo loginVo = (MemberVo) obj;
				model.addAttribute("loginVo", loginVo);
			}
			
//			String postkey = "http://localhost:8181/post/view";
//			postVo.setPostkey(postkey);
			
			//아래는 서치에서 책정보 갖고 들어가기 위해 수정한 부분
			return "/post/edit";
		}catch(IOException e) {
			e.printStackTrace();
		}
		return "/post/bookSearch";
	}
	
	@PostMapping("/edit")
	public String edit(PostVo reqVo, HttpServletRequest request, Model model) {
		logger.info("RequestMethod[POST] : /post/edit");
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("login");
		if(obj != null && obj.getClass().getSimpleName().equals("MemberVo")){
			MemberVo loginVo = (MemberVo) obj;
			model.addAttribute("loginVo", loginVo);
		}
		
		PostVo postVo = postService.selectPost(reqVo);
		
		model.addAttribute("postVo", postVo);
		
		return "/post/edit";
	}
	
	@GetMapping("/view")
	public String view(HttpServletRequest request, PostVo reqVo, Model model) {
		logger.info("RequestMethod[GET] : /post/view");
		
		PostVo postVo = postService.selectPost(reqVo);
		
		model.addAttribute("postVo", postVo);
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("login");
		if(obj != null && obj.getClass().getSimpleName().equals("MemberVo")){
			MemberVo loginVo = (MemberVo) obj;
			model.addAttribute("loginVo", loginVo);
		}
		
		return "/post/view";
	}
	
	// Ajax Method 영역

	@PostMapping("/editPostAjax")
	public @ResponseBody ReturnVo editPostAjax(PostVo reqVo, Model model) {
		logger.info("RequestAjaxMethod[POST] : /post/editPostAjax");
		
		int actionCnt = 0;
		String actionMessage = "";
		
		if (reqVo.getEdit_role().equalsIgnoreCase("insert")) {
			actionMessage = "입력 되었습니다.";
			actionCnt = postService.insertPost(reqVo);
		} else if (reqVo.getEdit_role().equalsIgnoreCase("update")) {
			actionMessage = "수정 되었습니다.";
			actionCnt = postService.updatePost(reqVo);
		} else if (reqVo.getEdit_role().equalsIgnoreCase("delete")) {
			actionMessage = "삭제 되었습니다.";
			actionCnt = postService.deletePost(reqVo);
		}
		
		if (actionMessage.equals("")) {
			actionMessage = "지원하지 않는 실행형식입니다. 데이터를 확인해주세요.";
		}
		
		if (actionCnt > 0) {
			return new ReturnVo("YES", actionMessage, null);
		} else {
			return new ReturnVo("NO", actionMessage, null);
		}
	}
	
//	------
	
	@PostMapping(path = "/write" /* , produces = "application/json ;charset=utf8" */)
	public String write(Model model, HttpServletRequest request,HttpSession session) {
		logger.info("RequestMethod[GET] : /post/write");

		ObjectMapper objectMapper = new ObjectMapper();
		String json = request.getParameter("toController");
		
		System.out.println(json);
		
		try {
			PostVo postVo = objectMapper.readValue(json, PostVo.class);
			System.out.println(postVo);
			model.addAttribute("postVo", postVo); //클릭한 책의 isbn,booktitle,bookauthor,bookcover,bookcontent 정보 갖고 있는 postVo객체 
			
			session = request.getSession();
			Object obj = session.getAttribute("login");
			if (obj != null && obj.getClass().getSimpleName().equals("MemberVo")) {
			MemberVo loginVo = (MemberVo) obj;
			model.addAttribute("loginVo", loginVo);
		}
			//아래는 서치에서 책정보 갖고 들어가기 위해 수정한 부분
			return "/post/postwriting";
		}catch(IOException e) {
			e.printStackTrace();
		}
			return "/post/bookSearch";
		}
	
	@PostMapping("/temp-saved")
	public void tempsave(PostVo postVo, Model model, HttpServletRequest request) {
		
	}
	
	@PostMapping("/post-saved")
	public String postsave(PostVo postVo, Model model, HttpServletRequest request,HttpSession session) {
		logger.info("RequestMethod[GET] : /post/post-saved");
		
		int result = 0;
		
		try {
			result = postService.insertPost(postVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		session.setAttribute("postno", postVo.getPostno());
		
		if(result>0) {
			logger.info("포스트 작성 성공");
			return  "/post/saved-success";
		}else {
			logger.info("포스트 작성 실패");
			return  "/post/postwriting";
		}
		
	}

}
