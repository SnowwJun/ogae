package com.ogae.admin.board.service;

import java.util.List;

import com.ogae.admin.board.RoomImgVO;

public interface RoomImgService {
	RoomImgVO getRoomImg(RoomImgVO vo);
	void insertRoomImg(RoomImgVO vo);
	void updateRoomImg(RoomImgVO vo);
	void deleteRoomImg(RoomImgVO vo);
	List<RoomImgVO> getRoomImgList(RoomImgVO vo);
	List<RoomImgVO> getRoomImgList(int roomIdx);
}
