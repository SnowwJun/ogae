package com.ogae.user.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogae.admin.board.Pagination;
import com.ogae.user.board.UserEventDAO;
import com.ogae.user.board.UserEventVO;
import com.ogae.user.board.service.UserEventService;

@Service
public class UserEventServiceImpl implements UserEventService {
	
	@Autowired
	private UserEventDAO userEventDAO;

	/** 게시글 조회 */
	@Override
	public UserEventVO getEvent(UserEventVO vo) {
		System.out.println("---> getEvent");
		return userEventDAO.getEvent(vo);
	}

	/** 게시글 목록 (검색 조건이 있는 경우) */
	@Override
	public List<UserEventVO> getEventList(UserEventVO vo) {
		System.out.println("---> getEventList(UserEventVO vo)");
		return userEventDAO.getEventList(vo);
	}
	
	/** 게시글 목록 (페이징 처리) */
	@Override
	public List<UserEventVO> getEventList(Pagination pagination) {
		System.out.println("---> getEventList(Pagination pagination)");
		return userEventDAO.getEventList(pagination);
	}

	/** 게시글 총 개수 (검색 조건이 없는 경우) */
	@Override
	public int getEventListCnt() {
		System.out.println("---> getEventListCnt");
		return userEventDAO.getEventListCnt();
	}
	
	/** 검색된 게시글 목록 (페이징 처리) */
	@Override
	public List<UserEventVO> getSearchEventList(String searchCondition, String searchKeyword, Pagination pagination) {
		System.out.println("---> getSearchEventList(String searchCondition, String searchKeyword, Pagination pagination)");
		return userEventDAO.getSearchEventList(searchCondition, searchKeyword, pagination);
	}
	
	/** 게시글 총 개수 (검색 조건이 있는 경우) */
	@Override
	public int getSearchEventListCnt(String searchCondition, String searchKeyword) {
		System.out.println("---> getSearchEventListCnt(String searchCondition, String searchKeyword)");
		return userEventDAO.getSearchEventListCnt(searchCondition, searchKeyword);
	}

	/** 이전 글 다음 글 */
	@Override
	public UserEventVO prevNext(UserEventVO vo) {
		System.out.println("---> prevNext(UserEventVO vo)");
		return userEventDAO.prevNext(vo);
	}
}
