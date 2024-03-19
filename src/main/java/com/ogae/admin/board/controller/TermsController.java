package com.ogae.admin.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ogae.admin.board.NoticeVO;
import com.ogae.admin.board.Pagination;
import com.ogae.admin.board.TermsDAO;
import com.ogae.admin.board.TermsVO;
import com.ogae.admin.board.service.TermsService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TermsController {

	@Autowired
	private TermsService termsService;

	
	//입력내용과 맞는 목차불러오기
	@RequestMapping("/getTermsList.ado")
	public String getTermsList(Model model, TermsVO vo) {
		log.debug(null);
		List<TermsVO> termsList = termsService.getTermsList(vo);

		model.addAttribute("termsList", termsList); // termsList를 모델에 추가 
		return "terms/getTermsList"; // 뷰 이름을 "terms/getTermsList"로 설정
	}
	
	// 약관 입력창
	@GetMapping("/insertTermsBoard.ado")
	public String insertTermsBoard() {
		log.debug(null);
		return "terms/insertTermsBoard";
	}

	@PostMapping("/insertTerms.ado")
	public String insertTerms(TermsVO vo) {
		log.debug("{}", vo.toString());
		
		if(vo.getTerms_content() != null) {
			termsService.insertTerms(vo);
		}
		
		return "redirect:/getTermsList.ado";
	}



	// 하나 골라서 보기
	@RequestMapping("getTermsView.ado")
	public String getTermsView(TermsVO vo, TermsDAO dao, Model model) {
		TermsVO terms = termsService.getTermsView(vo);
		
		// 가져온 정보를 모델에 담아서 뷰로 전달
		model.addAttribute("terms", terms);
		
		return "terms/getTermsView";
	}
	

	
	//삭제
	@GetMapping("/deleteTerms.ado")
	public String deleteTerms(@RequestParam("terms_idx") int terms_idx) {
		// 공지사항을 삭제하는 작업을 수행 (termsIdx를 사용하여 삭제)
		TermsVO terms = new TermsVO();
		terms.setTerms_idx(terms_idx);
		
		System.out.println("==================================>>>>>>===" + terms_idx);

		termsService.deleteTerms(terms);

		// 삭제 후 목록 페이지로 리다이렉트
		return "redirect:/getTermsList.ado";
	}
	
	
	
	@GetMapping("/updateTermsBoard.ado")
	public String updateTermsBoard(@ModelAttribute("terms") TermsVO vo, Model model) {
		 log.debug("GET updateTermsBoard 요청: {}", vo);
		//기존내용 가져옴
		TermsVO terms = termsService.getTermsView(vo);
		 log.debug("기존내용: {}", terms);
		    
		
		System.out.println("===============================================" + terms.toString());
		
		//모델에 공지사항 정보 추가
		model.addAttribute("terms", terms);
		log.debug("정보추가: " + terms);
		
		System.out.println("===>약관 수정");
		return "terms/updateTermsBoard";
	}
//	public String updateTermsBoard(TermsVO vo, Model model) {
//
//		// 기존내용 가져옴
//		TermsVO terms = termsService.getTermsView(vo);
//
//		// 모델에 공지사항 정보 추가
//		model.addAttribute("terms", terms);
//		System.out.println("===>약관 수정");
//		return "terms/updateTermsBoard";
//	}
	
	
	@PostMapping("/updateTermsBoard.ado")
	public String updateTerms(@RequestParam("terms_idx") int terms_idx, TermsVO vo) {
		TermsVO terms = termsService.getTermsView(vo);
		System.out.println("수정완료");
		System.out.println("===============================================" + vo.toString());
	
		//수정작업 완료 후 상세보기 페이지로 리다이렉트
		
		return "redirect:/getTermsList.ado";
	}
}
