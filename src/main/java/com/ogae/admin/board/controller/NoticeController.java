package com.ogae.admin.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ogae.admin.board.NoticeDAO;
import com.ogae.admin.board.NoticeVO;
import com.ogae.admin.board.Pagination;
import com.ogae.admin.board.service.NoticeService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;

	@Autowired
	private NoticeDAO noticeDAO;

	// 입력내용과 맞는 목차불러오기
	@RequestMapping("/getNoticeList.ado")
	public String showNoticeList(Model model, NoticeVO vo, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "") String searchCondition,
			@RequestParam(required = false, defaultValue = "") String searchKeyword,
			@RequestParam(required = false, defaultValue = "false") boolean countReview) {
		log.debug(null);
		
		NoticeVO searchVO = new NoticeVO();
		if (searchCondition != null && searchKeyword != null) {
			searchVO.setSearchCondition(searchCondition);
			searchVO.setSearchKeyword(searchKeyword);
		}

		int listCnt = noticeService.getSearchNoticeListCnt(searchCondition, searchKeyword);		
		
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);

		List<NoticeVO> noticeList = noticeService.getSearchNoticeList(searchCondition, searchKeyword, pagination);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("noticeList", noticeList); // noticeList를 모델에 추가
		
		System.out.println("pagination" + pagination);

		return "notice/getNoticeList"; // 뷰 이름을 "notice/getNoticeList"로 설정
	}

	@GetMapping("/insertNoticeBoard.ado")
	public String insertNoticeBoard() {
		log.debug(null);
		return "notice/insertNoticeBoard";
	}

	@PostMapping("/insertNotice.ado")
	public String insertNotice(NoticeVO vo) {
		log.debug("{}", vo.toString());
		noticeService.insertNotice(vo);
		return "redirect:/getNoticeList.ado";
	}

	// 1130 추가 체크박스
	@PostMapping("/saveTempNotice.ado")
	@ResponseBody
	public String saveTempNotice(@RequestBody NoticeVO vo) {
		System.out.println("임시저장");
		noticeService.insertNotice(vo);

		System.out.println("Temp notice saved successfully");
		return "notice/getNoticeList";
	}

	// 23.11.14 물어보기 왜 idx 값을 별도로 받아오는지 vo 객체가 아닌
	@GetMapping("/getNoticeView.ado")
	public String getNoticeView(@RequestParam("notice_idx") int noticeIdx, Model model) {
		// noticeIdx를 사용해서 해당 공지사항 정보를 가져옴
		NoticeVO notice = new NoticeVO();
		notice.setNotice_idx(noticeIdx);
		NoticeVO noticeDetail = noticeService.getNotice(notice);

		// 가져온 정보를 모델에 담아서 뷰로 전달
		model.addAttribute("notice", noticeDetail);

		return "notice/getNoticeView";
	}

	@GetMapping("/deleteNotice.ado")
	public String deleteNotice(@RequestParam("notice_idx") int noticeIdx) {
		// 공지사항을 삭제하는 작업을 수행 (noticeIdx를 사용하여 삭제)
		NoticeVO notice = new NoticeVO();
		notice.setNotice_idx(noticeIdx);

		noticeService.deleteNotice(notice);

		// 삭제 후 목록 페이지로 리다이렉트
		return "redirect:/getNoticeList.ado";
	}

	@GetMapping("/updateNoticeBoard.ado")
	public String updateNoticeBoard(NoticeVO vo, Model model) {

		// 기존내용 가져옴
		NoticeVO notice = noticeService.getNotice(vo);

		// 모델에 공지사항 정보 추가
		model.addAttribute("notice", notice);
		System.out.println("===>공지사항 수정");
		return "notice/updateNoticeBoard";
	}

	@PostMapping("/updateNoticeBoard.ado")
	public String updateNotice(NoticeVO vo) {
		System.out.println("수정완료");
		System.out.println(vo.toString());

		// 수정작업 완료 후 상세보기 페이지로 리다이렉트
		noticeService.updateNotice(vo);
		return "redirect:/getNoticeView.ado?notice_idx=" + vo.getNotice_idx();
	}
}
