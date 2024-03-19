package com.ogae.admin.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ogae.admin.board.Pagination;
import com.ogae.admin.board.ReviewVO;
import com.ogae.admin.board.service.ReviewService;

@Controller // 컨트롤러 빈으로 등록
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	/** 글 상세 조회 2023-11-13 */
	@RequestMapping("/getReview.ado")
	public String getReview(ReviewVO vo, Model model) {
		System.out.println("getReview Form으로 이동");
		// 글 상세 정보 가져오기
		ReviewVO review = reviewService.getReview(vo);
		model.addAttribute("review", review);
		
		// 현재 글 기준으로 이전 글, 다음 글 정보 가져오기
		ReviewVO prevNext = reviewService.prevNext(vo);
		model.addAttribute("prevNext", prevNext);
		
		// 댓글 정보 가져오기
		String reply = reviewService.getReviewReply(vo);
		model.addAttribute("reply", reply);
		
		return "review/getReview";
	}
	
	/** 댓글 등록 */
	@PostMapping("/insertReviewReply.ado")
	public ResponseEntity<String> insertReviewReply(@RequestBody ReviewVO vo) {
		try {
			// 게시물 정보 가져오기
			ReviewVO review = reviewService.getReview(vo);
			
			// 댓글 등록
			review.insertReviewReply(vo.getReply());
			reviewService.insertReviewReply(review);
			
			return new ResponseEntity<>("댓글이 등록되었습니다.", HttpStatus.OK);
	    } catch (Exception e) {
	        return new ResponseEntity<>("댓글 등록에 실패하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	}
	
	/** 댓글 삭제 */
	@GetMapping("/deleteReviewReply.ado")
	public String deleteReviewReply(int reply) {
		ReviewVO vo = new ReviewVO();
		vo.setIdx(reply);
		reviewService.deleteReviewReply(vo);
		return "redirect:/getReview.ado?idx=" + vo.getIdx();
	}
	
	/** 글 목록 조회 2023-11-13 */
	@RequestMapping("/getReviewList.ado")
	public String getReviewList(ReviewVO vo, Model model,
			    @RequestParam(required = false, defaultValue = "1") int page, 
			    @RequestParam(required = false, defaultValue = "1") int range,
			    @RequestParam(required = false, defaultValue = "") String searchCondition,
			    @RequestParam(required = false, defaultValue = "") String searchKeyword) {
		// 검색 조건이 있는지 확인하여 ReviewVO에 설정
	    ReviewVO searchVO = new ReviewVO();
	    if (searchCondition != null && searchKeyword != null) {
	        searchVO.setSearchCondition(searchCondition);
	        searchVO.setSearchKeyword(searchKeyword);
	    }

	    // 게시글 수 조회
	    int listCnt = reviewService.getSearchReviewListCnt(searchCondition, searchKeyword);

	    // 페이징 정보 설정
	    Pagination pagination = new Pagination();
	    pagination.pageInfo(page, range, listCnt);

	    // 페이징된 리뷰 리스트 가져오기
	    List<ReviewVO> reviewList = reviewService.getSearchReviewList(searchCondition, searchKeyword, pagination);

	    // 모델에 속성 추가
	    model.addAttribute("pagination", pagination);
	    model.addAttribute("reviewList", reviewList);
	    System.out.println(pagination.toString());
	    System.out.println(reviewList.toString());
	    return "review/getReviewList";
	}
}
