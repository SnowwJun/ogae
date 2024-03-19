package com.ogae.user.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ogae.user.board.UserNoticeDAO;
import com.ogae.user.board.UserNoticeVO;
import com.ogae.user.board.UserPagination;
import com.ogae.user.board.service.UserNoticeService;

@Service
public class UserNoticeServiceImpl implements UserNoticeService {
	@Autowired
	private UserNoticeDAO userNoticeDAO;

	@Override
	@Transactional
	public List<UserNoticeVO> getNoticeList(UserNoticeVO vo) {
		return userNoticeDAO.getNoticeList(vo);
	}

	
	//조회수 카운트
	@Override
	public void increaseAndViewCount(int noticeIdx) {
		// 여기에 조회수를 증가시키는 로직을 구현
		// DAO를 사용하여 DB에서 해당 공지사항의 조회수를 증가시킴
		userNoticeDAO.increaseNoticeCount(noticeIdx);
	}
	
	// 페이징(1202 추가)
		@Override
		public List<UserNoticeVO> getNoticeList(UserPagination pagination) {
			System.out.println("페이징 처리");
			return userNoticeDAO.getNoticeList(pagination);
		}
		


		@Override
		public int getNoticeListCnt() {
			return userNoticeDAO.getNoticeListCnt();
		}

		// 검색
		@Override
		public List<UserNoticeVO> getSearchNoticeList(String searchCondition, String searchKeyword, UserPagination pagination) {
			return userNoticeDAO.getSearchNoticeList(searchCondition, searchKeyword, pagination);
		}

		@Override
		public int getSearchNoticeListCnt(String searchCondition, String searchKeyword) {
			return userNoticeDAO.getSearchNoticeListCnt(searchCondition, searchKeyword);

		}

		// 이전글 다음글
		@Override
		public UserNoticeVO prevNext(UserNoticeVO vo) {
			return userNoticeDAO.prevNext(vo);
		}
}
