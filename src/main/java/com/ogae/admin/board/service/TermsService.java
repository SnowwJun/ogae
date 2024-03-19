package com.ogae.admin.board.service;

import java.util.List;

import com.ogae.admin.board.NoticeVO;
import com.ogae.admin.board.Pagination;
import com.ogae.admin.board.TermsVO;


public interface TermsService {
	TermsVO getTermsView(TermsVO vo);

	public void insertTerms(TermsVO vo);
	public void updateTermsBoard(TermsVO vo);
	public void deleteTerms(TermsVO vo);
	public List<TermsVO> getTermsList(TermsVO vo);

	// 게시글 목록 (페이징 처리)
    List<TermsVO> getTermsList(Pagination pagination);

    // 게시글 총 개수 (검색 조건이 없는 경우)
    int getTermsListCnt();

    // 검색된 게시글 목록 (페이징 처리)
    List<TermsVO> getSearchTermsList(String searchCondition, String searchKeyword, Pagination pagination);

    // 게시글 총 개수 (검색 조건이 있는 경우)
    int getSearchTermsListCnt(String searchCondition, String searchKeyword);


}
