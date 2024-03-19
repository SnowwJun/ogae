package com.ogae.admin.board.service;

import com.ogae.admin.board.EventImgVO;

public interface EventImgService {
	/** 이미지 등록 */
	void insertEventImg(EventImgVO vo);
	
	/** 이미지 수정 */
	void updateEventImg(EventImgVO vo);
	
	/** 이미지 삭제 */
	void deleteEventImg(EventImgVO vo);
	
	/** 이미지 조회 */
	EventImgVO getEventImg(EventImgVO vo);

	EventImgVO getEventImg(Integer idx);
}
