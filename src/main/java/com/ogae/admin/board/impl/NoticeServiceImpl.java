package com.ogae.admin.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogae.admin.board.NoticeDAO;
import com.ogae.admin.board.NoticeVO;
import com.ogae.admin.board.Pagination;
import com.ogae.admin.board.service.NoticeService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDAO noticeDAO;

	@Override
	public NoticeVO getNotice(NoticeVO vo) {
		log.debug("{}", vo.toString());
		System.out.println(vo.toString());
		return noticeDAO.getNotice(vo);
	}

	@Override
	public void insertNotice(NoticeVO vo) {
		log.debug("{}", vo.toString());
		noticeDAO.insertNotice(vo);
	}

	@Override
	public void updateNotice(NoticeVO vo) {
		log.debug("{}", vo.toString());
		noticeDAO.updateNotice(vo);
	}

	@Override
	public void deleteNotice(NoticeVO vo) {
		log.debug("{}", vo.toString());
		noticeDAO.deleteNotice(vo);
	}

	@Override
	public List<NoticeVO> getNoticeList(NoticeVO vo) {
//		log.debug("{}", vo.toString());
		return noticeDAO.getNoticeList(vo);
	}

	// 추가된 메서드 23.11.14
	@Override
	public NoticeVO getNotice(int noticeIdx) {
		NoticeVO notice = new NoticeVO();
		notice.setNotice_idx(noticeIdx);
		return noticeDAO.getNotice(notice);
	}

	
	// 페이징
	@Override
	public List<NoticeVO> getNoticeList(Pagination pagination) {
		return noticeDAO.getNoticeList(pagination);
	}
	


	@Override
	public int getNoticeListCnt() {
		return noticeDAO.getNoticeListCnt();
	}

	// 검색
	@Override
	public List<NoticeVO> getSearchNoticeList(String searchCondition, String searchKeyword, Pagination pagination) {
		return noticeDAO.getSearchNoticeList(searchCondition, searchKeyword, pagination);
	}

	@Override
	public int getSearchNoticeListCnt(String searchCondition, String searchKeyword) {
		return noticeDAO.getSearchNoticeListCnt(searchCondition, searchKeyword);

	}

	// 이전글 다음글
	@Override
	public NoticeVO prevNext(NoticeVO vo) {
		return noticeDAO.prevNext(vo);
	}

}
