package com.ogae.admin.board.service;

import java.util.List;

import com.ogae.admin.board.EventVO;
import com.ogae.admin.board.Pagination;

public interface EventService {
	/** 게시글 등록 */
	void insertEvent(EventVO vo);
	
	/** 게시글 수정 */
	void updateEvent(EventVO vo);
	
	/** 게시글 삭제 */
	void deleteEvent(EventVO vo);
	
	/** 게시글 조회 */
	EventVO getEvent(EventVO vo);
	
	/** 게시글 목록 (검색 조건이 있는 경우) */
	List<EventVO> getEventList(EventVO vo);
	
	/** 게시글 목록 (페이징 처리) */
	List<EventVO> getEventList(Pagination pagination);
	
	/** 게시글 총 개수 (검색 조건이 없는 경우) */
	int getEventListCnt();
	
	/** 검색된 게시글 목록 (페이징 처리) */
	List<EventVO> getSearchEventList(String searchCondition, String searchKeyword, Pagination pagination);
	
	/** 게시글 총 개수 (검색 조건이 있는 경우) */
	int getSearchEventListCnt(String searchCondition, String searchKeyword);
	
	/** 이전 글 다음 글 */
	EventVO prevNext(EventVO vo);
}
