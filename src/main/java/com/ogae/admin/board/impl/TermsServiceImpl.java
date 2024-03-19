package com.ogae.admin.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogae.admin.board.NoticeVO;
import com.ogae.admin.board.Pagination;
import com.ogae.admin.board.TermsDAO;
import com.ogae.admin.board.TermsVO;
import com.ogae.admin.board.service.TermsService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("TermsService")
public class TermsServiceImpl implements TermsService {

	@Autowired
	private TermsDAO termsDAO;

	@Override
	public TermsVO getTermsView(TermsVO vo) {
		log.debug("{}", vo.toString());
		System.out.println("============================" + vo.toString());
		return termsDAO.getTermsView(vo);
	}

	@Override
	public void insertTerms(TermsVO vo) {
		log.debug("{}", vo.toString());
		termsDAO.insertTerms(vo);
	}

	@Override
	public void updateTermsBoard(TermsVO vo) {
		log.debug("{}", vo.toString());
		termsDAO.updateTermsBoard(vo);
	}

	@Override
	public void deleteTerms(TermsVO vo) {
		log.debug("{}", vo.toString());
		termsDAO.deleteTerms(vo);
	}

	public List<TermsVO> getTermsList(TermsVO vo) {
//		log.debug("{}", vo.toString());
		return termsDAO.getTermsList(vo);
	}

	// 페이징
	@Override
	public List<TermsVO> getTermsList(Pagination pagination) {
		return termsDAO.getTermsList(pagination);
	}

	
	@Override
	public int getTermsListCnt() {
		return termsDAO.getTermsListCnt();
	}

	// 검색
	@Override
	public List<TermsVO> getSearchTermsList(String searchCondition, String searchKeyword, Pagination pagination) {
		return termsDAO.getSearchTermsList(searchCondition, searchKeyword, pagination);
	}

	@Override
	public int getSearchTermsListCnt(String searchCondition, String searchKeyword) {
		return termsDAO.getSearchTermsListCnt(searchCondition, searchKeyword);
	}
}
