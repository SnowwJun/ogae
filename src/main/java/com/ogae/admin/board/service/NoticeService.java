package com.ogae.admin.board.service;

import java.util.List;

import com.ogae.admin.board.NoticeVO;
import com.ogae.admin.board.Pagination;

public interface NoticeService {
	NoticeVO getNotice(NoticeVO vo);

	public void insertNotice(NoticeVO vo);
	public void updateNotice(NoticeVO vo);
	public void deleteNotice(NoticeVO vo);
	
	// 게시글 목록 (검색 조건이 있는 경우)
	public List<NoticeVO> getNoticeList(NoticeVO vo);
	
    // 추가 23.11.14
	NoticeVO getNotice(int noticeIdx);

	// 게시글 목록 (페이징 처리)
    List<NoticeVO> getNoticeList(Pagination pagination);

    // 게시글 총 개수 (검색 조건이 없는 경우)
    int getNoticeListCnt();

    // 검색된 게시글 목록 (페이징 처리)
    List<NoticeVO> getSearchNoticeList(String searchCondition, String searchKeyword, Pagination pagination);

    // 게시글 총 개수 (검색 조건이 있는 경우)
    int getSearchNoticeListCnt(String searchCondition, String searchKeyword);

    // 이전글 다음글
    NoticeVO prevNext(NoticeVO vo);

}
