package com.booklog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.vos.web.MemberVo;

@Controller
public class SetMenuController {
	
	private static final Logger logger = LoggerFactory.getLogger(SetMenuController.class);
	
	@RequestMapping(value = "/setmenu", method = RequestMethod.GET)
	public String setmenu(HttpServletRequest request, Model model) {
		logger.info("RequestMethod[GET] : setmenu");
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("login");
		if(obj != null && obj.getClass().getSimpleName().equals("MemberVo")){
			MemberVo loginVo = (MemberVo) obj;
			model.addAttribute("loginVo", loginVo);
		}
		
		return "setmenu";
	}

}
