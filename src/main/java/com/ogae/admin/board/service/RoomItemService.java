package com.ogae.admin.board.service;

import java.util.List;

import com.ogae.admin.board.RoomItemVO;
import com.ogae.admin.board.RoomVO;

public interface RoomItemService {
	RoomItemVO getRoomItem(RoomItemVO vo);
	void insertRoomItem(RoomItemVO vo);
	void updateRoomItem(RoomItemVO vo);
	void deleteRoomItem(String itemIdx);
	List<RoomItemVO> getRoomItemList(RoomItemVO vo);
	List<RoomItemVO> getRoomItemList(String itemIdx);
	
	//11.20 추가
	List<RoomItemVO> getAllRoomItems();
}
