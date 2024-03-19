package com.ogae.admin.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ogae.admin.board.RoomDAO;
import com.ogae.admin.board.RoomItemDAO;
import com.ogae.admin.board.RoomItemVO;
import com.ogae.admin.board.service.RoomItemService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class RoomItemServiceImpl implements RoomItemService {
	
	@Autowired
	private RoomItemDAO roomItemDAO;
	
	@Autowired
	private RoomDAO roomDAO;
	
	@Override
	public RoomItemVO getRoomItem(RoomItemVO vo) {
		log.debug("{}", vo);
		return roomItemDAO.getRoomItem(vo);
	}

	@Override
	public void insertRoomItem(RoomItemVO vo) {
		roomItemDAO.insertRoomItem(vo);
	}

	@Override
	@Transactional
	public void updateRoomItem(RoomItemVO vo) {
		roomItemDAO.updateRoomItem(vo);
	}

	@Override
	@Transactional
    public void deleteRoomItem(String itemIdx) {
        roomItemDAO.deleteRoomItem(itemIdx);
    }

	@Override
	public List<RoomItemVO> getRoomItemList(RoomItemVO vo) {
		return roomItemDAO.getRoomItemList(vo);
	}
	
	//11.20 추가
	@Override
	public List<RoomItemVO> getAllRoomItems(){
	    return roomItemDAO.getAllRoomItems();
	}

	@Override
	public List<RoomItemVO> getRoomItemList(String itemIdx) {
		return roomItemDAO.getRoomItemList(itemIdx);
	}


}
