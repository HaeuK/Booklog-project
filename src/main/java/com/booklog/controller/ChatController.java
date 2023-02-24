package com.booklog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vos.web.MemberVo;

@Controller
@RequestMapping("/chat")
public class ChatController {
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	@GetMapping("/chat")
	public String chat() {
		logger.info("RequestMethod[GET] : /chat/chat (목록)");
		return "/chat/chat";
	}
	
	@PostMapping("/chatRoom")
	public String chatRoom(HttpServletRequest request, Model model) {
		logger.info("RequestMethod[POST] : /chat/chatRoom (채팅방 이동)");
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("login");
		if(obj != null && obj.getClass().getSimpleName().equals("MemberVo")){
			MemberVo loginVo = (MemberVo) obj;
			model.addAttribute("loginVo", loginVo);
		}
		
		return "/chat/chatRoom";
	}
	
//	@GetMapping("/chatRoom")
//	public String chatRoom(HttpServletRequest request, Model model) {
//		logger.info("RequestMethod[GET] : /chat/chatRoom (채팅방 이동)");
//		
//		HttpSession session = request.getSession();
//		Object obj = session.getAttribute("login");
//		if(obj != null && obj.getClass().getSimpleName().equals("MemberVo")){
//			MemberVo loginVo = (MemberVo) obj;
//			model.addAttribute("loginVo", loginVo);
//		}
//		
//		return "/chat/chatRoom";
//	}
	
}
