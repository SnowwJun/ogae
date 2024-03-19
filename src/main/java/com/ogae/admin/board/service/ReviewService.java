package com.ogae.admin.board.service;

import java.util.List;

import com.ogae.admin.board.ReviewVO;
import com.ogae.admin.board.Pagination;

public interface ReviewService {
	
	/** 게시글 조회 */
	ReviewVO getReview(ReviewVO vo);
	
	/** 게시글 목록 (검색 조건이 있는 경우) */
	List<ReviewVO> getReviewList(ReviewVO vo);
	
	/** 게시글 목록 (페이징 처리) */
	List<ReviewVO> getReviewList(Pagination pagination);
	
	/** 게시글 총 개수 (검색 조건이 없는 경우) */
	int getReviewListCnt();
	
	/** 검색된 게시글 목록 (페이징 처리) */
	List<ReviewVO> getSearchReviewList(String searchCondition, String searchKeyword, Pagination pagination);
	
	/** 게시글 총 개수 (검색 조건이 있는 경우) */
	int getSearchReviewListCnt(String searchCondition, String searchKeyword);
	
	/** 이전 글 다음 글 */
	ReviewVO prevNext(ReviewVO vo);
	
	/** 댓글 등록 */
	void insertReviewReply(ReviewVO vo);
	
	/** 댓글 삭제 */
	void deleteReviewReply(ReviewVO vo);
	
	/** 댓글 조회 */
	String getReviewReply(ReviewVO vo);
}
