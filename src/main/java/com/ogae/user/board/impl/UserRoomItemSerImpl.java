package com.ogae.user.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogae.user.board.UserRoomItemDAO;
import com.ogae.user.board.UserRoomItemVO;
import com.ogae.user.board.service.UserRoomItemServ;

@Service
public class UserRoomItemSerImpl implements UserRoomItemServ {

	@Autowired
	private UserRoomItemDAO userRoomItemDAO;

	@Override
	public UserRoomItemVO getRoomItem(UserRoomItemVO vo) {
		return userRoomItemDAO.getRoomItem(vo);
	}

	@Override
	public List<UserRoomItemVO> getRoomItemList(UserRoomItemVO vo) {
		return userRoomItemDAO.getRoomItemList(vo);
	}
	
	@Override
	public List<UserRoomItemVO> getRoomItemList(String roomItemIdx) {
		return userRoomItemDAO.getRoomItemList(roomItemIdx);
	}

}
