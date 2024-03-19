package com.ogae.user.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Service;

import com.ogae.admin.board.Pagination;
import com.ogae.user.board.UserReviewDAO;
import com.ogae.user.board.UserReviewVO;
import com.ogae.user.board.service.UserReviewService;

@Service
public class UserReviewServiceImpl implements UserReviewService {
	
	@Autowired
	private UserReviewDAO userReviewDAO;
	
	/** 게시글 등록 */
	@Override
	public void insertReview(UserReviewVO vo) {
		System.out.println("---> insertReview");
		userReviewDAO.insertReview(vo);
	}
	
	/** 게시글 수정 */
	@Override
	public void updateReview(UserReviewVO vo) {
		System.out.println("---> updateReview");
		userReviewDAO.updateReview(vo);
	}
	
	/** 게시글 삭제 */
	@Override
	public void deleteReview(UserReviewVO vo) {
		System.out.println("---> deleteReview");
		userReviewDAO.deleteReview(vo);
	}	
	
	/** 게시글 조회 */
	@Override
	public UserReviewVO getReview(UserReviewVO vo) {
		System.out.println("---> getReviewvo");
		return userReviewDAO.getReview(vo);
	}
	
	/** 게시글 목록 (검색 조건이 있는 경우) */
	@Override
	public List<UserReviewVO> getReviewList(UserReviewVO vo) {
		System.out.println("---> getReviewList(UserReviewVO vo)");
		return userReviewDAO.getReviewList(vo);
	}
	
	/** 게시글 목록 (페이징 처리) */
	@Override
	public List<UserReviewVO> getReviewList(Pagination pagination) {
		System.out.println("---> getReviewList(Pagination pagination)");
		return userReviewDAO.getReviewList(pagination);
	}
	
	/** 게시글 총 개수 (검색 조건이 없는 경우) */
	@Override
	public int getReviewListCnt() {
		System.out.println("---> getReviewListCnt()");
		return userReviewDAO.getReviewListCnt();
	}

	/** 검색된 게시글 목록 (페이징 처리) */
	@Override
	public List<UserReviewVO> getSearchReviewList(String searchCondition, String searchKeyword, Pagination pagination) {
	    System.out.println("---> getSearchReviewList(String searchCondition, String searchKeyword, Pagination pagination)");
	    return userReviewDAO.getSearchReviewList(searchCondition, searchKeyword, pagination);
	}
	
	/** 게시글 총 개수 (검색 조건이 있는 경우) */
	@Override
	public int getSearchReviewListCnt(String searchCondition, String searchKeyword) {
	    System.out.println("---> getSearchReviewListCnt(String searchCondition, String searchKeyword)");
	    return userReviewDAO.getSearchReviewListCnt(searchCondition, searchKeyword);
	}
	
	/** 이전 글 다음 글 */
	@Override
	public UserReviewVO prevNext(UserReviewVO vo) {
		System.out.println("---> prevNext(UserReviewVO vo)");
		return userReviewDAO.prevNext(vo);
	}
	
	/** 조회수 카운트 */
	@Override
	public void countReview(Integer idx) {
		System.out.println("---> countReview(Integer idx)");
		userReviewDAO.countReview(idx);
	}
	
	/** 댓글 조회 */
	@Override
	public String getReviewReply(UserReviewVO vo) {
		UserReviewVO review = userReviewDAO.getReview(vo);
		if(review != null && review.isHasReply()) {
			return review.getReply();
		} else {
			return null;
		}
	}
}
