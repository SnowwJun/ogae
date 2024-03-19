package com.ogae.user.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ogae.admin.board.NoticeDAO;
import com.ogae.admin.board.NoticeVO;
import com.ogae.user.board.UserNoticeVO;
import com.ogae.user.board.UserPagination;
import com.ogae.user.board.service.UserNoticeService;


@Controller
public class UserNoticeController {
	
	@Autowired
	private UserNoticeService userNoticeService;

	@Autowired
	private NoticeDAO noticeDAO;
	
//	@GetMapping("/noticeList.do")
//	public String getNoticeList() {
//		return "notice/noticeList";
//	}

	@RequestMapping("/noticeList.do")
	public String getNoticeList(Model model, UserNoticeVO vo,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "") String searchCondition,
			@RequestParam(required = false, defaultValue = "") String searchKeyword,
			@RequestParam(required = false, defaultValue = "false") boolean countReview) {
		System.out.println("==>userNoticeView Check");
		
		UserNoticeVO searchVO = new UserNoticeVO();
		if (searchCondition != null && searchKeyword != null) {
			searchVO.setSearchCondition(searchCondition);
			searchVO.setSearchKeyword(searchKeyword);
		}

		int listCnt =  userNoticeService.getSearchNoticeListCnt(searchCondition, searchKeyword);		
		
		UserPagination pagination = new UserPagination();
		pagination.pageInfo(page, range, listCnt);
		
		List<UserNoticeVO> userNoticeList = userNoticeService.getSearchNoticeList(searchCondition, searchKeyword, pagination);
		System.out.println(userNoticeList.toString());
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("userNoticeList", userNoticeList);
		
		System.out.println("pagination" + pagination);
		
		return "notice/noticeList"; // 사용자용 뷰 페이지
	}

	@GetMapping("/noticeListView.do")
	public String noticeListView(@RequestParam("notice_idx") int noticeIdx, Model model) {
		// noticeIdx를 사용해서 해당 공지사항 정보를 가져옴
		NoticeVO notice = new NoticeVO();
		notice.setNotice_idx(noticeIdx);
		NoticeVO noticeDetail = noticeDAO.getNotice(notice);

		// 가져온 정보를 모델에 담아서 뷰로 전달
		model.addAttribute("notice", noticeDetail);

		return "notice/noticeListView";
	}

	
	//조회수 카운트
	@PostMapping("/increaseAndViewCount.do")
	@ResponseBody
	public ResponseEntity<String> increaseAndViewCount(@RequestParam("noticeIdx") int noticeIdx) {
		try {
			userNoticeService.increaseAndViewCount(noticeIdx);
			return new ResponseEntity<>("success", HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>("error", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
