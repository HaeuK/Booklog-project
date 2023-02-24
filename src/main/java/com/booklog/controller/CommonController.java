package com.booklog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CommonController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	/**
	 * view에서 계층에 속하지 않는 일반적인 url 요청을 처리하기 위한 controller
	 * 루트 접근, 에러 페이지, 특수 Ajax요청(header, footer, sidebar의 Ajax) 처리
	 */

	/**
	 * 루트 url접근시 idex페이지 반환
	 * idex페이지는 로그인세션을 확인하여 정보가 없으면 로그인 페이지로,
	 * 정보가 존재하면 home화면으로 redirect
	 */
	@RequestMapping(value = {"", "/", "index"}, method = RequestMethod.GET)
	public @ResponseBody ModelAndView root(HttpServletRequest request, ModelMap model) {
		logger.info("RequestMethod[GET] : root");
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("login");
		
		model.addAttribute("loginSession", obj);
		
		return new ModelAndView("/index", model);
	}
	
	@RequestMapping(value = {"logout"}, method = RequestMethod.POST)
	public @ResponseBody ModelAndView logout (HttpServletRequest request, ModelMap model) {
		HttpSession session = request.getSession();
		session.removeAttribute("login");
		
		return new ModelAndView("/index", model);
	}
}
