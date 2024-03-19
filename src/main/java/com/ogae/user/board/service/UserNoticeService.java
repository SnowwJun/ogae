package com.ogae.user.board.service;

import java.util.List;

import com.ogae.user.board.UserNoticeVO;
import com.ogae.user.board.UserPagination;

public interface UserNoticeService {

	public List<UserNoticeVO> getNoticeList(UserNoticeVO vo);

	// 조회수 카운트
	void increaseAndViewCount(int noticeIdx);
	
	// 게시글 목록 (페이징 처리)(1202추가)
    List<UserNoticeVO> getNoticeList(UserPagination pagination);

    // 게시글 총 개수 (검색 조건이 없는 경우)
    int getNoticeListCnt();

    // 검색된 게시글 목록 (페이징 처리)
    List<UserNoticeVO> getSearchNoticeList(String searchCondition, String searchKeyword, UserPagination pagination);

    // 게시글 총 개수 (검색 조건이 있는 경우)
    int getSearchNoticeListCnt(String searchCondition, String searchKeyword);

    // 이전글 다음글
    UserNoticeVO prevNext(UserNoticeVO vo);

}
