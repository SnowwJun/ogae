package com.ogae.user.board.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ogae.admin.board.Pagination;
import com.ogae.user.board.UserReviewVO;
import com.ogae.user.board.service.UserReviewService;

@Controller // 컨트롤러 빈으로 등록
public class UserReviewController {
	
	@Autowired
	private UserReviewService userReviewService;
	
	/** 글 등록 2023-11-14 */
	@GetMapping("/insertReview.do")
	public String insertReview(UserReviewVO vo) {
		System.out.println("insertReview Form으로 이동");
		System.out.println(vo.toString());
		return "review/insertReview";
	}
	@PostMapping("/insertReview.do")
	public String insertReview(UserReviewVO vo, Model model, HttpServletRequest request) {
		vo.setGrade(Integer.parseInt(request.getParameter("grade")));
		// 이벤트 등록 시 현재 시간을 수정일로 설정
	    vo.setRegDate(new Date());
		userReviewService.insertReview(vo);
		model.addAttribute("review", vo);
		System.out.println(vo.toString());
		System.out.println("DB 등록됨");
		return "redirect:/getReviewList.do";
	}
	/** 글 수정 2023-11-14 */
	@GetMapping("/updateReview.do")
	public String updateReviewView(UserReviewVO vo, Model model, HttpSession session) {
		UserReviewVO review = userReviewService.getReview(vo);
		model.addAttribute("review", review);
		System.out.println(review.toString());
		System.out.println("updateReview Form으로 이동");
		return "review/updateReview";
	}
	@PostMapping("/updateReview.do")
	public String updateReview(UserReviewVO vo, Model model, HttpServletRequest request, HttpSession session) {
		/** 이전에 입력한 만족도 값 불러오기 */
		Integer BeforeGrade = userReviewService.getReview(vo).getGrade();
		/** 수정한 만족도 값 저장 */
		vo.setGrade(Integer.parseInt(request.getParameter("grade")));		
		vo.setModyDate(new Date());
		userReviewService.updateReview(vo);
		model.addAttribute("review", vo);
		System.out.println(vo.toString());
		System.out.println("DB 등록됨");
		return "redirect:/getReview.do?idx=" + vo.getIdx();
	}
	/** 글 삭제 2023-11-14 */
	@GetMapping("/deleteReview.do")
	public String deleteReview(UserReviewVO vo) {
		userReviewService.deleteReview(vo);
		System.out.println("DeleteReview");
		return "redirect:/getReviewList.do";
	}
	
	/** 글 상세 조회 2023-11-14 */
	@RequestMapping("/getReview.do")
	public String getReview(UserReviewVO vo, Model model) {
		System.out.println("getReview Form으로 이동");
		// 글 상세 정보 가져오기
		UserReviewVO review = userReviewService.getReview(vo);
		model.addAttribute("review", review);
		
		// 조회수 증가
		userReviewService.countReview(vo.getIdx());
		
		// 현재 글 기준으로 이전 글, 다음 글 정보 가져오기
		UserReviewVO prevNext = userReviewService.prevNext(vo);
		model.addAttribute("prevNext", prevNext);
		return "review/getReview";
	}
	
	@PostMapping("/checkReviewPassword.do")
	@ResponseBody
	public ResponseEntity<String> checkPass(UserReviewVO vo, @RequestParam("idx") Integer idx, @RequestParam("inputPass") String inputPass) {
	    try {
	    	
	    	UserReviewVO review = userReviewService.getReview(vo);
	    	System.out.println(review.toString());
	    	
	        // 비밀번호 확인 및 결과 반환
	        boolean isPasswordCorrect = review.getPass().equals(inputPass);
	        System.out.println("isPasswordCorrect::::::" + isPasswordCorrect);

	        if (isPasswordCorrect) {
	            return ResponseEntity.ok("success");
	        } else {
	            return ResponseEntity.ok("fail");
	        }
	    } catch (Exception e) {
	        // 예외 로깅 추가
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("error");
	    }
	}
	
	/** 글 목록 조회(페이징) */
	@RequestMapping("/getReviewList.do")
	public String getReviewList(UserReviewVO vo, Model model,
			    @RequestParam(required = false, defaultValue = "1") int page, 
			    @RequestParam(required = false, defaultValue = "1") int range,
			    @RequestParam(required = false, defaultValue = "") String searchCondition,
			    @RequestParam(required = false, defaultValue = "") String searchKeyword,
			    @RequestParam(required = false, defaultValue = "false") boolean countReview) {
		
		// 검색 조건이 있는지 확인하여 ReviewVO에 설정
		UserReviewVO searchVO = new UserReviewVO();
	    if (searchCondition != null && searchKeyword != null) {
	        searchVO.setSearchCondition(searchCondition);
	        searchVO.setSearchKeyword(searchKeyword);
	    }

	    // 게시글 수 조회
	    int listCnt = userReviewService.getSearchReviewListCnt(searchCondition, searchKeyword);
	    System.out.println("수: " + listCnt);

	    // 페이징 정보 설정
	    Pagination pagination = new Pagination();
	    pagination.pageInfo(page, range, listCnt);

	    // 페이징된 리뷰 리스트 가져오기
	    List<UserReviewVO> reviewList = userReviewService.getSearchReviewList(searchCondition, searchKeyword, pagination);
	    System.out.println("수: " + reviewList);

	    
	    // 모델에 속성 추가
	    model.addAttribute("pagination", pagination);
	    model.addAttribute("reviewList", reviewList);
	    System.out.println(pagination.toString());
	    System.out.println(reviewList.toString());
	    
	    return "review/getReviewList";
	}
}
