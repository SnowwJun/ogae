package com.ogae.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ogae.admin.AdminVO;
import com.ogae.admin.service.AdminService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AdminController {
	
	@Autowired	
	private AdminService adminService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@PostMapping(value="/login.ado")
	public String login(AdminVO vo, HttpServletRequest request) {
		log.debug("{}", vo);
		AdminVO admin = adminService.getAdmin(vo);
		HttpSession session = request.getSession(false);
		String message = "";
		if (admin != null) {
			// 입력된 비밀번호 데이터와 DB에 암호화된 비밀번호 매칭 확인
			if(passwordEncoder.matches(vo.getPassword(), admin.getPassword()) ){
				session.setAttribute("admin", admin);
				session.removeAttribute("msg");
				return "redirect:main.ado";
			} else {
				message = "아이디 또는 비밀번호가 일치하지 않습니다.";
				session.setAttribute("admin", null);
				session.setAttribute("msg", message);
				log.debug("message: {}", message);
				return "redirect:login.ado";
			}
		} else {
			message = "존재하는 아이디가 없습니다.";
			session.setAttribute("admin", null);
			session.setAttribute("msg", message);
			log.debug("message: {}", message);
			return "redirect:login.ado";
		}
	}	
	
	@GetMapping("/login.ado")
	public String loginView() {
		return "login";
	}
	
	@GetMapping("/info.ado")
	public String infoView(HttpServletRequest request) {
		// 현재 접속된 session 정보 가져와 로그인한 속성 정보를 받아옴
		HttpSession session = request.getSession(false);
		AdminVO admin = (AdminVO) session.getAttribute("admin");
		if(admin != null) {
			return "info/info";
		} else {
			return "redirect:main.ado";
		}
	}
	
	@PostMapping("/checkAdmin.ado")
	public String checkPassword(AdminVO vo, HttpServletRequest request) {
		log.debug("{}", vo);
		String password = adminService.checkAdmin(vo);
		
		// 현재 접속된 session 정보를 가져옴 -> 오류 메시지를 뿌려주기 위해
		HttpSession session = request.getSession(false);

		// 입력된 비밀번호 데이터와 DB에 암호화된 비밀번호 매칭 확인
		if(passwordEncoder.matches(vo.getPassword(), password)) {
			session.removeAttribute("msg");
			return "info/getInfo";
		} else {
			session.setAttribute("msg", "비밀번호가 일치하지 않습니다. 확인 후 다시 입력해 주세요.");
			return "info/info"; 
		}
	}
	
	@PostMapping("/update.ado")
	public String updateAdmin(AdminVO vo) {
		log.debug("{}", vo);
		// 비밀번호 암호화
		vo.setPassword(passwordEncoder.encode(vo.getPassword()));
		
		int result = adminService.updateAdmin(vo);
		System.out.println(result);
		return "redirect:main.ado";
	}
	
	@RequestMapping("/logout.ado")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		log.debug("session: {}", session);
		if(session != null) {
			session.invalidate();
		} 
		return "redirect:main.do";
	}
	
	@GetMapping("/main.ado")
	public String mainView() {
		return "main";
	}

	@GetMapping("/getReserveList.ado")
	public String reserveView() {
		return "getReserveList";
	}
	
	@GetMapping("/getReserve.ado")
	public String getReserve() {
		return "getReserve";
	}
}
