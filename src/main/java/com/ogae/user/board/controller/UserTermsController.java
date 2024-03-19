package com.ogae.user.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ogae.admin.board.TermsDAO;
import com.ogae.admin.board.TermsVO;
import com.ogae.user.board.UserTermsVO;
import com.ogae.user.board.service.UserTermsService;


@Controller
public class UserTermsController {
	
	@Autowired
	private UserTermsService userTermsService;

	@Autowired
	private TermsDAO termsDAO;

//	@GetMapping("/termsList.do")
//	public String getTermsList() {
//		return "terms/termsList";	
//	}

	@GetMapping("/termsList.do")
	public String getTermsList(Model model, UserTermsVO vo) {
		System.out.println("==>userTermsView Check");
		List<UserTermsVO> userTermsList = userTermsService.getTermsList(vo);
		System.out.println(userTermsList.toString());
		model.addAttribute("userTermsList", userTermsList);
		return "terms/termsList"; // 사용자용 뷰 페이지
	}

	@GetMapping("/termsListView.do")
	public String termsListView(@RequestParam("terms_idx") int terms_idx, Model model) {
		// termsIdx를 사용해서 해당 공지사항 정보를 가져옴
		TermsVO terms = new TermsVO();
		terms.setTerms_idx(terms_idx);
		TermsVO termsDetail = termsDAO.getTermsView(terms);

		// 가져온 정보를 모델에 담아서 뷰로 전달
		model.addAttribute("terms", termsDetail);

		return "terms/termsListView";
	}

			
//				@GetMapping("Terms.do")
//	public String TermsView() {
//		return "terms/TermsList";			
//					}
	
}

