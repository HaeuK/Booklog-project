package com.booklog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.internet.MimeMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import com.booklog.service.MemberService;
import com.vos.web.MemberVo;
import com.vos.web.ReturnVo;

@Controller
@RequestMapping("/user")
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	// 페이지 load 영역
	
	@GetMapping("/login")
	public String login(MemberVo memberVo, Model model) {
		logger.info("RequestMethod[GET] : /user/login");
		
		return "/user/login";
	}
	
	@GetMapping("/signup")
	public String signup(Model model) {
		logger.info("RequestMethod[GET] : /user/signup");
		
		return "/user/signup";
	}
	
	@GetMapping("/findID")
	public String findId(Model model) {
		logger.info("RequestMethod[GET] : /user/findID");
		
		return "/user/findID";
	}
	
	@GetMapping("/findPassword")
	public String findPassword(Model model) {
		logger.info("RequestMethod[GET] : /user/findPassword");
		
		return "/user/findPassword";
	}
	
	// 추가 회원 탈퇴

	@GetMapping("/userFirelogin")
	public String userFirelogin(HttpServletRequest request, MemberVo memberVo, Model model) {
		logger.info("RequestMethod[GET] : /user/userFirelogin");

		HttpSession session = request.getSession();
		Object obj = session.getAttribute("login");
		if (obj != null && obj.getClass().getSimpleName().equals("MemberVo")) {
			MemberVo loginVo = (MemberVo) obj;
			model.addAttribute("loginVo", loginVo);
		}

		return "/user/userFirelogin";
	}
	
	
	@PostMapping("/userFire")
	public String userFire(HttpServletRequest request, MemberVo memberVo, Model model) {
		logger.info("RequestMethod[POST] : /user/userFire");

		/* int rstMember = memberService.deleteMember(memberVo); */

		HttpSession session = request.getSession();
		Object obj = session.getAttribute("login");
		if (obj != null && obj.getClass().getSimpleName().equals("MemberVo")) {
			MemberVo loginVo = (MemberVo) obj;
			model.addAttribute("loginVo", loginVo);
		}
		return "/user/userFire";
	}
	
	// Ajax Method 영역
	
	@PostMapping("/loginChkAjax")
	public @ResponseBody ReturnVo loginChkAjax(HttpSession session, MemberVo reqVo, Model model) {
		logger.info("RequestAjaxMethod[POST] : /user/loginChkAjax");
		
		if (session.getAttribute("login") != null) {
			session.removeAttribute("login");
		}
		
		MemberVo rstMember = memberService.selectMember(reqVo);
		
		if (rstMember != null) {
			session.setAttribute("login", rstMember);
			
			// 세션 만료시간 24시간으로 설정
			session.setMaxInactiveInterval(60*60*24);
			
			return new ReturnVo("YES", "home", rstMember);
		} else {
			return new ReturnVo("NO", null, null);
		}
	}
	
	@PostMapping("/userDuplChkAjax")
	public @ResponseBody ReturnVo userDuplChkAjax(MemberVo reqVo, Model model) {
		logger.info("RequestAjaxMethod[POST] : /user/userDuplChkAjax");
		
		MemberVo rstMember = memberService.selectMemberIsExist(reqVo);
		
		if (rstMember != null) {
			return new ReturnVo("NO", null, rstMember);
		} else {
			return new ReturnVo("YES", null, null);
		}
	}

	@PostMapping("/signupAjax")
	public @ResponseBody ReturnVo signupAjax(MemberVo reqVo, Model model) {
		logger.info("RequestAjaxMethod[POST] : /user/signupAjax");
		
		int actionCnt = 0;
		String actionMessage = "";
		
		actionMessage = "등록 되었습니다.";
		try {
			actionCnt = memberService.insertMember(reqVo);
		} catch (DuplicateKeyException e) {
			actionMessage = "이미 존재하는 데이터입니다.";
		}
		
		if (actionCnt > 0) {
			return new ReturnVo("YES", actionMessage, reqVo);
		} else {
			return new ReturnVo("NO", actionMessage, null);
		}
	}
	
	@RequestMapping(value = "/findIdAjax" , method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public @ResponseBody String findIdAjax(@ModelAttribute MemberVo reqVo, Model model, HttpServletResponse response) {
		logger.info("RequestAjaxMethod[POST] : /user/findIdAjax");
		
		System.out.println(reqVo.toString());
		
		MemberVo memberVo = memberService.selectMemberByEmail(reqVo);
		
		System.out.println(memberVo.toString());
		System.out.println(memberVo.getUseremail());
		String findId = "{\"userid\":\""+memberVo.getUserid()+"\"}";
		
		System.out.println(findId);
		
		return findId;
	}
	
	@PostMapping("/findPasswordAjax")
	public @ResponseBody ReturnVo findPasswordAjax(MemberVo reqVo, Model model) {
		logger.info("RequestAjaxMethod[POST] : /user/findPasswordAjax");

		String actionMessage = "";

		MemberVo rstMember = memberService.selectMemberByIdAndEmail(reqVo);

		if (rstMember != null) {
			
			String useremail = rstMember.getUseremail();

			// root-context.xml에 이메일 정보 입력 후 실행
			// <-- 이메일 인증 코드 시작
//			String usernickname = rstMember.getUsernickname();
//			String userpassword = rstMember.getUserpassword();
//			
//			String subject = "[Booklog] 비밀번호 안내";
//			String content = usernickname + "님의 비밀번호는 " + userpassword + "입니다.";
//			String from = "creme4444@naver.com"; // 임의 테스트시 직접 이메일 주소 입력
//			String to = useremail;
//			
//			try { MimeMessage mail = mailSender.createMimeMessage();
//				MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
//				
//				mailHelper.setFrom(from); mailHelper.setTo(to);
//				mailHelper.setSubject(subject); mailHelper.setText(content, true);
//				
//				mailSender.send(mail); logger.info("send password check mail");
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
			// 이메일 인증 코드 끝 -->

			String msg = "회원님의 비밀번호를 " + useremail + "로 전송하였습니다.";;
			model.addAttribute("msg", msg); 
			
			actionMessage = "데이터가 존재합니다";
			return new ReturnVo("YES", actionMessage, reqVo);
		} else {
			actionMessage = "일치하는 회원 정보가 없습니다.";
			return new ReturnVo("No", actionMessage, null);
		}
	}
	
	@PostMapping("/beforeEdit")
	public String beforEdit(Model model,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Object object = session.getAttribute("login");
		if (object != null && object.getClass().getSimpleName().equals("MemberVo")){
			MemberVo loginVo = (MemberVo) object;
			model.addAttribute("loginVo", loginVo);		
		}
		
	return "/user/beforeEdit";	
	}
	
	
	@PostMapping("/editMemberInfo") 
	public String editMemgerInfo(Model model,HttpServletRequest request) {
		logger.info("RequestMethod[POST] : /user/editMemberInfo");

		
		HttpSession session = request.getSession();
		Object object = session.getAttribute("login");
		if (object != null && object.getClass().getSimpleName().equals("MemberVo")){
			MemberVo loginVo = (MemberVo) object;
			model.addAttribute("loginVo", loginVo);		
		}
		
		return "/user/editMemberInfo";
	}
	
	
	
	@PostMapping("/editAjax")
	public  @ResponseBody ReturnVo editMemberInfoAjax(HttpServletRequest request,MemberVo reqVo) {
		logger.info("RequestAjaxMethod[POST] : /user/editMemberInfo");
		
		int actionCnt = 0;
		String actionMessage = "";
		
		
		HttpSession session = request.getSession();
		Object object = session.getAttribute("login");
		if (object != null && object.getClass().getSimpleName().equals("MemberVo")){
			MemberVo loginVo = (MemberVo) object;	
			
			
			reqVo.setUserno(loginVo.getUserno());
			actionCnt = memberService.updateMember(reqVo);

			
			if (actionCnt > 0) {
				actionMessage = "수정이 완료되었습니다.";
				return new ReturnVo("YES", actionMessage, reqVo);
			} else {
				actionMessage = "수정에 실패하였습니다.";
				return new ReturnVo("NO", actionMessage, null);
			}
		}else {
			actionMessage = "로그인 정보가 확인되지 않습니다.";
			return new ReturnVo("NO", actionMessage, null);
		}
		
	}
	
	// 탈퇴 영역
	@PostMapping("/deleteMemberAjax")
	public @ResponseBody ReturnVo memberDeleteAjax(MemberVo reqVo, Model model) {
		logger.info("RequestAjaxMethod[POST] : /user/deleteMemberAjax");

		int actionCnt = 0;
		String actionMessage = "";
		
		actionMessage = "삭제 되었습니다.";
		actionCnt = memberService.deleteMember(reqVo);

		if (actionCnt > 0) {
			return new ReturnVo("YES", actionMessage, null);
		} else {
			return new ReturnVo("NO", actionMessage, null);
		}

	}
	
}
