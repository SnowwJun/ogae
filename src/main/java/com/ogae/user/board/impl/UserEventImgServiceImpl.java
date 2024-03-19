package com.ogae.user.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogae.user.board.UserEventImgDAO;
import com.ogae.user.board.UserEventImgVO;
import com.ogae.user.board.UserEventVO;
import com.ogae.user.board.service.UserEventImgService;

@Service
public class UserEventImgServiceImpl implements UserEventImgService {

	@Autowired
	private UserEventImgDAO userEventImgDAO;
	/** 이미지 조회 */
	@Override
	public UserEventImgVO getEventImg(UserEventImgVO vo) {
		System.out.println("---> getEventImg(UserEventImgVO vo)");
		return userEventImgDAO.getEventImg(vo);
	}

	@Override
	public UserEventImgVO getEventImg(Integer idx) {
		System.out.println("---> getEventImg(Integer idx)");
		return userEventImgDAO.getEventImg(idx);
	}

	@Override
	public List<UserEventImgVO> getEventImgList(Integer idx) {
		System.out.println("---> getEventImgList(Integer idx)");
		return userEventImgDAO.getEventImgList(idx);
	}
}
