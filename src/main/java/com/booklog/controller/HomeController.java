package com.booklog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.booklog.service.CommonService;
import com.booklog.service.NoticeService;
import com.booklog.service.PostService;
import com.booklog.service.PublicDataService;
import com.utils.pagination.CommonPaginationInfo;
import com.vos.web.NoticeVo;
import com.vos.web.PostVo;

@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	PublicDataService publicDataService;
	@Autowired
	NoticeService noticeService;
	@Autowired
	CommonService commonService;
	@Autowired
	PostService postService;
	
	// 페이지 load 영역
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Model model, PostVo postVo) {
		logger.info("RequestMethod[GET] : home");
		String key = publicDataService.getPublicApi().getKey();
		model.addAttribute("key", key); 	
		
		// home 화면에 나오는  공지사항 데이터 표현
		
		NoticeVo paginationVo = new NoticeVo();
		
		//페이지 기본값 설정
		paginationVo.setPagingEnable("1");
		paginationVo.setPageIndex(1);
		paginationVo.setPageSize(3);
		paginationVo.setRecordCountPerPage(3);
		
		//정렬 필드 기본값 설정
		paginationVo.setCondOrder("NOTICENO");
		paginationVo.setCondAlign("DESC");
		
		CommonPaginationInfo pagination = new CommonPaginationInfo(paginationVo);
		pagination.setTotalRecordCount(noticeService.selectNoticeListCount(paginationVo));
		
		paginationVo = (NoticeVo) pagination.createCustomVo();
		
		
		List<NoticeVo> noticeList = noticeService.selectNoticeList(paginationVo);
		model.addAttribute("noticeList", noticeList);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("paginationVo", paginationVo);
		
		
		
		// 메인 home 화면 포스트  최신 독후감 표현
		List<PostVo> postHome = postService.postSubhome(postVo);
		model.addAttribute("postHome", postHome);
		
		return "home";
	}
	
	@GetMapping("/mostCheckedoutBookList")
	public String mostCheckedoutBookList(Model model) {
		
		String key = publicDataService.getPublicApi().getKey();
		
		model.addAttribute("key", key);
		
		return "/mostCheckedoutBookList";
	}
	
	// home 화면에 나오는  공지사항
	@RequestMapping(value = "/mainnerNoticeList", method = RequestMethod.POST)
	public String innerNoticeList(HttpServletRequest HttpRequest, NoticeVo reqVo, Model model) {
		logger.info("RequestMethod[GET] : /mainnerNoticeList <ajaxload>");
		
		CommonPaginationInfo pagination = new CommonPaginationInfo(reqVo);
		pagination.setTotalRecordCount(noticeService.selectNoticeListCount(reqVo));
		
		reqVo = (NoticeVo) pagination.createCustomVo();
		
		List<NoticeVo> noticeList = noticeService.selectNoticeList(reqVo);
		model.addAttribute("noticeList", noticeList);

		model.addAttribute("pagination", pagination);
		
		return "/mainnerNoticeList";
	}
	
	
	
}
