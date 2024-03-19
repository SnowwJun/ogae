package com.ogae.user.board.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ogae.admin.board.Pagination;
import com.ogae.user.board.UserEventImgVO;
import com.ogae.user.board.UserEventVO;
import com.ogae.user.board.service.UserEventImgService;
import com.ogae.user.board.service.UserEventService;

@Controller // 컨트롤러 빈으로 등록
public class UserEventController {
	
	@Autowired
	private UserEventService userEventService;
	@Autowired
	private UserEventImgService userEventImgService;
	
	/** 글 상세 조회 */
	@RequestMapping("/getEvent.do")
	public String getEvent(UserEventVO vo, UserEventImgVO imgVo, Model model) {
		System.out.println("getEvent Form으로 이동");
		// 글 상세 정보 가져오기
		UserEventVO event = userEventService.getEvent(vo);
		model.addAttribute("event", event);
		
		// 글에 연결된 이미지 정보 가져오기
		UserEventImgVO img = userEventImgService.getEventImg(vo.getIdx());
		model.addAttribute("img", img);
		
		// 현재 글 기준으로 이전 글, 다음 글 정보 가져오기
		UserEventVO prevNext = userEventService.prevNext(vo);
		model.addAttribute("prevNext", prevNext);
		return "event/getEvent";
	}
	
	/** 글 목록 조회 */
	@RequestMapping("/getEventList.do")
	public String getEventList(UserEventVO vo, UserEventImgVO imgVo, Model model,
			@RequestParam(required = false, defaultValue = "1") int page, 
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "") String searchCondition,
			@RequestParam(required = false, defaultValue = "") String searchKeyword) {
		// 검색 조건이 있는지 확인하여 EventVO에 설정
		UserEventVO searchVO = new UserEventVO();
	    if (searchCondition != null && searchKeyword != null) {
	        searchVO.setSearchCondition(searchCondition);
	        searchVO.setSearchKeyword(searchKeyword);
	    }
		// 게시글 수 조회
	    int listCnt = userEventService.getSearchEventListCnt(searchCondition, searchKeyword);
	    
	    // 페이징 정보 설정
	    Pagination pagination = new Pagination();
	    pagination.pageInfo(page, range, listCnt);
	    // 모델에 속성 추가
	    model.addAttribute("pagination", pagination);

	    // 페이징된 리뷰 리스트 가져오기
	    List<UserEventVO> eventList = userEventService.getSearchEventList(searchCondition, searchKeyword, pagination);
	    model.addAttribute("eventList", eventList);
	    
	    // 각 이벤트에 대한 이미지 경로 가져오기
	    List<UserEventImgVO> imgList = userEventImgService.getEventImgList(vo.getIdx());
	    
	    // 모든 이미지 경로를 모델에 추가
	    model.addAttribute("imgList", imgList);
	    
	    System.out.println(pagination.toString());
	    System.out.println(eventList.toString());
	    System.out.println(imgList.toString());

	    
	    return "event/getEventList";
	}
}
