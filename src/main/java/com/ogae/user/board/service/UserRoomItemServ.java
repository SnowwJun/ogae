package com.ogae.user.board.service;

import java.util.List;

import com.ogae.user.board.UserRoomItemVO;

public interface UserRoomItemServ {

	UserRoomItemVO getRoomItem(UserRoomItemVO vo);

	List<UserRoomItemVO> getRoomItemList(UserRoomItemVO vo);
	List<UserRoomItemVO> getRoomItemList(String roomItemIdx);

}
