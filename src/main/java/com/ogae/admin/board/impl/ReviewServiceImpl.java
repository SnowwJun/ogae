package com.ogae.admin.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogae.admin.board.Pagination;
import com.ogae.admin.board.ReviewDAO;
import com.ogae.admin.board.ReviewVO;
import com.ogae.admin.board.service.ReviewService;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDAO reviewDAO;
	
	/** 게시글 조회 */
	@Override
	public ReviewVO getReview(ReviewVO vo) {
		System.out.println("---> getReview");
		return reviewDAO.getReview(vo);
	}
	
	/** 게시글 목록 (검색 조건이 있는 경우) */
	@Override
	public List<ReviewVO> getReviewList(ReviewVO vo) {
		System.out.println("---> getReviewList(ReviewVO vo)");
		return reviewDAO.getReviewList(vo);
	}
	
	/** 게시글 목록 (페이징 처리) */
	@Override
	public List<ReviewVO> getReviewList(Pagination pagination) {
		System.out.println("---> getReviewList(Pagination pagination)");
		return reviewDAO.getReviewList(pagination);
	}
	
	/** 게시글 총 개수 (검색 조건이 없는 경우) */
	@Override
	public int getReviewListCnt() {
		System.out.println("---> getReviewListCnt()");
		return reviewDAO.getReviewListCnt();
	}

	/** 검색된 게시글 목록 (페이징 처리) */
	@Override
	public List<ReviewVO> getSearchReviewList(String searchCondition, String searchKeyword, Pagination pagination) {
	    System.out.println("---> getSearchReviewList(String searchCondition, String searchKeyword, Pagination pagination)");
	    return reviewDAO.getSearchReviewList(searchCondition, searchKeyword, pagination);
	}
	
	/** 게시글 총 개수 (검색 조건이 있는 경우) */
	@Override
	public int getSearchReviewListCnt(String searchCondition, String searchKeyword) {
	    System.out.println("---> getSearchReviewListCnt(String searchCondition, String searchKeyword)");
	    return reviewDAO.getSearchReviewListCnt(searchCondition, searchKeyword);
	}
	
	/** 이전 글 다음 글 */
	@Override
	public ReviewVO prevNext(ReviewVO vo) {
		System.out.println("---> prevNext(ReviewVO vo)");
		return reviewDAO.prevNext(vo);
	}
	
	/** 댓글 등록 */
	@Override
	public void insertReviewReply(ReviewVO vo) {
		System.out.println("---> insertReviewReply(ReviewVO vo)");
		reviewDAO.insertReviewReply(vo);
	}
	
	/** 댓글 삭제 */
	@Override
	public void deleteReviewReply(ReviewVO vo) {
		System.out.println("---> deleteReviewReply(ReviewVO vo)");
		reviewDAO.deleteReviewReply(vo);
	}

	/** 댓글 조회 */
	@Override
	public String getReviewReply(ReviewVO vo) {
		ReviewVO review = reviewDAO.getReview(vo);
		if(review != null && review.isHasReply()) {
			return review.getReply();
		} else {
			return null;
		}
	}
}
