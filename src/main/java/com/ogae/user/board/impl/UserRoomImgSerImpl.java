package com.ogae.user.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogae.user.board.UserRoomImgDAO;
import com.ogae.user.board.UserRoomImgVO;
import com.ogae.user.board.service.UserRoomImgService;

@Service
public class UserRoomImgSerImpl implements UserRoomImgService {

	@Autowired
	private UserRoomImgDAO userRoomImgDAO;
	
	@Override
	public UserRoomImgVO getRoomImg(UserRoomImgVO vo) {
		return userRoomImgDAO.getRoomImg(vo);
	}

	@Override
	public List<UserRoomImgVO> getRoomImgList(UserRoomImgVO vo) {
		return userRoomImgDAO.getRoomImgList(vo);
	}
	
	public List<UserRoomImgVO> getRoomImgList(Integer idx){
		System.out.println("-----> getRoomImgList(Integer idx)");
		return userRoomImgDAO.getRoomImgList(idx);
	}

}
