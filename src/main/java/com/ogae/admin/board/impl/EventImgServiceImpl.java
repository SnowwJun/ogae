package com.ogae.admin.board.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogae.admin.board.EventImgDAO;
import com.ogae.admin.board.EventImgVO;
import com.ogae.admin.board.service.EventImgService;

@Service
public class EventImgServiceImpl implements EventImgService {
	
	@Autowired
	private EventImgDAO eventImgDAO;

	/** 이미지 등록 */
	@Override
	public void insertEventImg(EventImgVO vo) {
		System.out.println("---> insertEventImg(EventImgVO vo)");
		eventImgDAO.insertEventImg(vo);	
	}
	
	/** 이미지 수정 */
	@Override
	public void updateEventImg(EventImgVO vo) {
		System.out.println("---> updateEventImg(EventImgVO vo)");
		eventImgDAO.updateEventImg(vo);
	}
	
	/** 이미지 삭제 */
	@Override
	public void deleteEventImg(EventImgVO vo) {
		System.out.println("---> deleteEventImg(EventImgVO vo)");
		eventImgDAO.deleteEventImg(vo);
	}
	
	/** 이미지 조회 */
	@Override
	public EventImgVO getEventImg(EventImgVO vo) {
		System.out.println("---> getEventImg(EventImgVO vo)");
		return eventImgDAO.getEventImg(vo);
	}

	@Override
	public EventImgVO getEventImg(Integer idx) {
		System.out.println("---> getEventImg(Integer idx)");
		return eventImgDAO.getEventImg(idx);
	}
}
