package com.ogae.user.board.service;

import java.util.List;

import com.ogae.user.board.UserEventImgVO;
import com.ogae.user.board.UserEventVO;

public interface UserEventImgService {
	/** 이미지 조회 */
	UserEventImgVO getEventImg(UserEventImgVO vo);

	UserEventImgVO getEventImg(Integer idx);
	
	/** 이미지 목록 */
	List<UserEventImgVO> getEventImgList(Integer idx);
}
