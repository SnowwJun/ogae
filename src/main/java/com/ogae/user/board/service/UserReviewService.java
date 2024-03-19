package com.ogae.user.board.service;

import java.util.List;

import com.ogae.admin.board.Pagination;
import com.ogae.user.board.UserReviewVO;

public interface UserReviewService {
	/** 게시글 등록 */
	void insertReview(UserReviewVO vo);
	
	/** 게시글 수정 */
	void updateReview(UserReviewVO vo);
	
	/** 게시글 삭제 */
	void deleteReview(UserReviewVO vo);
	
	/** 게시글 조회 */
	UserReviewVO getReview(UserReviewVO vo);

	/** 게시글 목록 (검색 조건이 있는 경우) */
	List<UserReviewVO> getReviewList(UserReviewVO vo);
	
	/** 게시글 목록 (페이징 처리) */
	List<UserReviewVO> getReviewList(Pagination pagination);
	
	/** 게시글 총 개수 (검색 조건이 없는 경우) */
	int getReviewListCnt();
	
	/** 검색된 게시글 목록 (페이징 처리) */
	List<UserReviewVO> getSearchReviewList(String searchCondition, String searchKeyword, Pagination pagination);
	
	/** 게시글 총 개수 (검색 조건이 있는 경우) */
	int getSearchReviewListCnt(String searchCondition, String searchKeyword);

	/** 이전 글 다음 글 */
	UserReviewVO prevNext(UserReviewVO vo);
	
	/** 조회수 카운트 */
	void countReview(Integer idx);
	
	/** 댓글 조회 */
	String getReviewReply(UserReviewVO vo);
}
