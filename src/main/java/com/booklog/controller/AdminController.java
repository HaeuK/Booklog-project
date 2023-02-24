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

import com.booklog.service.MemberService;
import com.vos.web.MemberVo;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	MemberService memberService;

//	메인(메뉴)
	@GetMapping("/main")
	public String main(HttpServletRequest request, Model model) {
		logger.info("RequestMethod[GET] : /admin/main");

		// 관리자인지 확인하기 위한 MemberVo 넘기기
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("login");
		if (obj != null && obj.getClass().getSimpleName().equals("MemberVo")) {
			MemberVo loginVo = (MemberVo) obj;
			model.addAttribute("loginVo", loginVo);

		}

		return "/admin/main";
	}

//	회원정보 조회
	@GetMapping("/userList")
	public String userList(HttpServletRequest request, Model model) {
		logger.info("RequestMethod[GET] : /admin/userList");
		
		List<MemberVo> memberList = memberService.selectAllMember();
		model.addAttribute("memberList", memberList);
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("login");
		if (obj != null && obj.getClass().getSimpleName().equals("MemberVo")) {
			MemberVo loginVo = (MemberVo) obj;
			model.addAttribute("loginVo", loginVo);
		}
		
		return "/admin/userList";
	}
	
	//Post 방식
	@PostMapping("/userList")
	public String userList(HttpServletRequest request, Model model, MemberVo reqVo) {
		logger.info("RequestMethod[POST] : /admin/userList");
		
//		회원 정보 업데이트
		int userUpdate = memberService.updateMemberByAdmin(reqVo);
		model.addAttribute("userUpdate", userUpdate);
		
		List<MemberVo> memberList = memberService.selectAllMember();
		model.addAttribute("memberList", memberList);
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("login");
		if (obj != null && obj.getClass().getSimpleName().equals("MemberVo")) {
			MemberVo loginVo = (MemberVo) obj;
			model.addAttribute("loginVo", loginVo);
		}
		
		return "/admin/userList";
	}


	@PostMapping("/userEdit")
	public String userEdit(HttpServletRequest request, Model model, MemberVo reqVo) {
		logger.info("RequestMethod[POST] : /admin/userEdit");

		MemberVo memberInfo = memberService.selectMemberNo(reqVo);
		model.addAttribute("memberInfo", memberInfo);
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("login");
		if (obj != null && obj.getClass().getSimpleName().equals("MemberVo")) {
			MemberVo loginVo = (MemberVo) obj;
			model.addAttribute("loginVo", loginVo);
		}

		return "/admin/userEdit";
	}

}
