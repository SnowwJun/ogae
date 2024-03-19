package com.ogae.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class UserController {
	
	@GetMapping("/main.do")
	public String mainView() {
		log.debug(null);
		return "main";
	}
	
//	@GetMapping("/index.do")
//	public String indexView(@ModelAttribute("target") String target, HttpServletRequest request) {
//		log.debug("target: {}", target);
//		HttpSession session = request.getSession(false);
//		session.setAttribute("target", target);
//		return "index";
//	}
	
	@GetMapping("/about.do")
	public String aboutView(@ModelAttribute("tab") String tab) {
		log.debug("ModelAttribute tab: {}", tab);
		return "about/about";
	}
	

}
