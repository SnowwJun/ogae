package com.ogae.admin.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogae.admin.board.RoomImgDAO;
import com.ogae.admin.board.RoomImgVO;
import com.ogae.admin.board.service.RoomImgService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class RoomImgServiceImpl implements RoomImgService {

	@Autowired
	private RoomImgDAO roomImgDAO;

	@Override
	public RoomImgVO getRoomImg(RoomImgVO vo) {
		log.debug("{}", vo);
		return roomImgDAO.getRoomImg(vo);
	}

	@Override
	public void insertRoomImg(RoomImgVO vo) {
		log.debug("{}", vo);
		roomImgDAO.insertRoomImg(vo);

	}

	@Override
	public void updateRoomImg(RoomImgVO vo) {
		log.debug("{}", vo);
		roomImgDAO.updateRoomImg(vo);
	}

	@Override
	public void deleteRoomImg(RoomImgVO vo) {
		log.debug("{}", vo);
		roomImgDAO.deleteRoomImg(vo);
	}

	@Override
	public List<RoomImgVO> getRoomImgList(RoomImgVO vo) {
		log.debug("{}", vo);
		return roomImgDAO.getRoomImgList(vo);
	}
	
	@Override
	public List<RoomImgVO> getRoomImgList(int roomIdx){
		log.debug("{}", roomIdx);
		return roomImgDAO.getRoomImgList(roomIdx);
	}

}
