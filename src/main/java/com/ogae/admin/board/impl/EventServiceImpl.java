package com.ogae.admin.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogae.admin.board.EventDAO;
import com.ogae.admin.board.EventVO;
import com.ogae.admin.board.Pagination;
import com.ogae.admin.board.service.EventService;

@Service
public class EventServiceImpl implements EventService {
	
	@Autowired
	private EventDAO eventDAO;
	
	/** 게시글 등록 */
	@Override
	public void insertEvent(EventVO vo) {
		System.out.println("---> insertEvent");
		eventDAO.insertEvent(vo);
	}
	
	/** 게시글 수정 */
	@Override
	public void updateEvent(EventVO vo) {
		System.out.println("---> updateEvent");
		eventDAO.updateEvent(vo);
	}
	
	/** 게시글 삭제 */
	@Override
	public void deleteEvent(EventVO vo) {
		System.out.println("---> deleteEvent");
		eventDAO.deleteEvent(vo);
	}

	/** 게시글 조회 */
	@Override
	public EventVO getEvent(EventVO vo) {
		System.out.println("---> getEvent");
		return eventDAO.getEvent(vo);
	}

	/** 게시글 목록 (검색 조건이 있는 경우) */
	@Override
	public List<EventVO> getEventList(EventVO vo) {
		System.out.println("---> getEventList(EventVO vo)");
		return eventDAO.getEventList(vo);
	}
	
	/** 게시글 목록 (페이징 처리) */
	@Override
	public List<EventVO> getEventList(Pagination pagination) {
		System.out.println("---> getEventList(Pagination pagination)");
		return eventDAO.getEventList(pagination);
	}

	/** 게시글 총 개수 (검색 조건이 없는 경우) */
	@Override
	public int getEventListCnt() {
		System.out.println("---> getEventListCnt()");
		return eventDAO.getEventListCnt();
	}
	
	/** 검색된 게시글 목록 (페이징 처리) */
	@Override
	public List<EventVO> getSearchEventList(String searchCondition, String searchKeyword, Pagination pagination) {
		System.out.println("---> getSearchEventList(String searchCondition, String searchKeyword, Pagination pagination)");
		return eventDAO.getSearchEventList(searchCondition, searchKeyword, pagination);
	}
	
	/** 게시글 총 개수 (검색 조건이 있는 경우) */
	@Override
	public int getSearchEventListCnt(String searchCondition, String searchKeyword) {
		System.out.println("---> getSearchEventListCnt(String searchCondition, String searchKeyword)");
		return eventDAO.getSearchEventListCnt(searchCondition, searchKeyword);
	}

	/** 이전 글 다음 글 */
	@Override
	public EventVO prevNext(EventVO vo) {
		System.out.println("---> prevNext(EventVO vo)");
		return eventDAO.prevNext(vo);
	}
}
