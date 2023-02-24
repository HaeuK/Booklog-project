package com.booklog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.booklog.service.CommonService;
import com.booklog.service.NoticeService;
import com.utils.pagination.CommonPaginationInfo;
import com.vos.web.CommonVo;
import com.vos.web.MemberVo;
import com.vos.web.NoticeVo;
import com.vos.web.ReturnVo;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	NoticeService noticeService;
	@Autowired
	CommonService commonService;
	
	// 페이지 load 영역
	
	@GetMapping("/list")
	public String list(HttpServletRequest request, Model model) {
		logger.info("RequestMethod[GET] : /notice/list");
		
		NoticeVo paginationVo = new NoticeVo();
		
		//페이지 기본값 설정
		paginationVo.setPagingEnable("1");
		paginationVo.setPageIndex(1);
		paginationVo.setPageSize(10);
		paginationVo.setRecordCountPerPage(10);
		
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
		
		// 관리자인지 확인하기 위한 MemberVo 넘기기
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("login");
		if(obj != null && obj.getClass().getSimpleName().equals("MemberVo")){
			MemberVo loginVo = (MemberVo) obj;
			model.addAttribute("loginVo", loginVo);
		}

		return "/notice/list";
	}
	
	@PostMapping("/innerpage/innerNoticeList")
	public String innerNoticeList(HttpServletRequest HttpRequest, NoticeVo reqVo, Model model) {
		logger.info("RequestMethod[POST] : /innerpage/innerNoticeList <ajaxload>");
		
		CommonPaginationInfo pagination = new CommonPaginationInfo(reqVo);
		pagination.setTotalRecordCount(noticeService.selectNoticeListCount(reqVo));
		
		reqVo = (NoticeVo) pagination.createCustomVo();
		
		List<NoticeVo> noticeList = noticeService.selectNoticeList(reqVo);
		model.addAttribute("noticeList", noticeList);

		model.addAttribute("pagination", pagination);
		
		return "/notice/innerpage/innerNoticeList";
	}
	
	@GetMapping("/edit")
	public String edit(HttpServletRequest request, Model model) {
		logger.info("RequestMethod[GET] : /notice/edit");
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("login");
		if(obj != null && obj.getClass().getSimpleName().equals("MemberVo")){
			MemberVo loginVo = (MemberVo) obj;
			model.addAttribute("loginVo", loginVo);
		}
		
		List<CommonVo> noticeCodeList = commonService.selectNoticeCodeList();
		model.addAttribute("noticeCodeList", noticeCodeList);
		
		return "/notice/edit";
	}
	
	@PostMapping("/edit")
	public String edit(NoticeVo reqVo, HttpServletRequest request, Model model) {
		logger.info("RequestMethod[POST] : /notice/edit");
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("login");
		if(obj != null && obj.getClass().getSimpleName().equals("MemberVo")){
			MemberVo loginVo = (MemberVo) obj;
			model.addAttribute("loginVo", loginVo);
		}
		
		// DB에서 뷰로 보낼 때 엔터를 넣기 위한 코드 (없어도 정상 동작)
//		String content = reqVo.getNoticecontent();
//		content = content.replace("\r\n","<br>");
//		reqVo.setNoticecontent(content);
		
		List<CommonVo> noticeCodeList = commonService.selectNoticeCodeList();
		model.addAttribute("noticeCodeList", noticeCodeList);
		
		NoticeVo noticeVo = noticeService.selectNotice(reqVo);
		
		model.addAttribute("noticeVo", noticeVo);
		
		return "/notice/edit";
	}
	
	@PostMapping("/view")
	public String view(HttpServletRequest request, NoticeVo reqVo, Model model) {
		logger.info("RequestMethod[POST] : /notice/view");
		
		NoticeVo noticeVo = noticeService.selectNotice(reqVo);
		
		model.addAttribute("noticeVo", noticeVo);
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("login");
		if(obj != null && obj.getClass().getSimpleName().equals("MemberVo")){
			MemberVo loginVo = (MemberVo) obj;
			model.addAttribute("loginVo", loginVo);
		}
		
		return "/notice/view";
	}
	
	// Ajax Method 영역

	@PostMapping("/editNoticeAjax")
	public @ResponseBody ReturnVo editNoticeAjax(NoticeVo reqVo, Model model) {
		logger.info("RequestAjaxMethod[POST] : /notice/editNoticeAjax");
		
		int actionCnt = 0;
		String actionMessage = "";
		
		if (reqVo.getEdit_role().equalsIgnoreCase("insert")) {
			actionMessage = "입력 되었습니다.";
			actionCnt = noticeService.insertNotice(reqVo);
		} else if (reqVo.getEdit_role().equalsIgnoreCase("update")) {
			actionMessage = "수정 되었습니다.";
			actionCnt = noticeService.updateNotice(reqVo);
		} else if (reqVo.getEdit_role().equalsIgnoreCase("delete")) {
			actionMessage = "삭제 되었습니다.";
			actionCnt = noticeService.deleteNotice(reqVo);
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
	
}
