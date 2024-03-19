package com.ogae.user.board.service;

import java.util.List;

import com.ogae.admin.board.Pagination;
import com.ogae.user.board.UserEventVO;

public interface UserEventService {
	/** 게시글 조회 */
	UserEventVO getEvent(UserEventVO vo);
	
	/** 게시글 목록 (검색 조건이 있는 경우) */
	List<UserEventVO> getEventList(UserEventVO vo);
	
	/** 게시글 목록 (페이징 처리) */
	List<UserEventVO> getEventList(Pagination pagination);
	
	/** 게시글 총 개수 (검색 조건이 없는 경우) */
	int getEventListCnt();
	
	/** 검색된 게시글 목록 (페이징 처리) */
	List<UserEventVO> getSearchEventList(String searchCondition, String searchKeyword, Pagination pagination);
	
	/** 게시글 총 개수 (검색 조건이 있는 경우) */
	int getSearchEventListCnt(String searchCondition, String searchKeyword);

	/** 이전 글 다음 글 */
	UserEventVO prevNext(UserEventVO vo);
}
