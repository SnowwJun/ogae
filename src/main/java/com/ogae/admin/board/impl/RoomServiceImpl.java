package com.ogae.admin.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogae.admin.board.Pagination;
import com.ogae.admin.board.RoomDAO;
import com.ogae.admin.board.RoomItemVO;
import com.ogae.admin.board.RoomVO;
import com.ogae.admin.board.service.RoomService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class RoomServiceImpl implements RoomService {
	
	@Autowired
	private RoomDAO roomDAO;

	@Override
	public RoomVO getRoom(RoomVO vo) {
		log.debug("{}", vo.toString());
		return roomDAO.getRoom(vo);
	}
	
	@Override
	public void insertRoom(RoomVO vo) {
		log.debug("{}", vo.toString());
		roomDAO.insertRoom(vo);
	}

	@Override
	public void updateRoom(RoomVO vo) {
		log.debug("{}", vo.toString());
		roomDAO.updateRoom(vo);
	}

	@Override
	public void deleteRoom(RoomVO vo) {
		log.debug("{}", vo.toString());
		roomDAO.deleteRoom(vo);
	}
	
//	@Override
//	public List<RoomVO> getRoomList(RoomItemVO itemVO){
//		log.debug("{}", itemVO);
//		return roomDAO.getRoomList(itemVO);
//	}
	

	//페이징
	@Override
	public List<RoomVO> getRoomList(RoomVO vo) {
		return roomDAO.getRoomList(vo);
	}
	
	@Override
	public List<RoomVO> getRoomList(Pagination pagination){
		return roomDAO.getRoomList(pagination);
	}
	
	@Override
	public int getRoomListCnt() {
		return roomDAO.getRoomListCnt();
	}
	
	
	//검색
	@Override
	public List<RoomVO> getSearchRoomList(String searchCondition, String searchKeyword, Pagination pagination){
		return roomDAO.getSearchRoomList(searchCondition, searchKeyword, pagination);
	}
	
	@Override
	public int getSearchRoomListCnt(String searchCondition, String searchKeyword) {
		return roomDAO.getSearchRoomListCnt(searchCondition, searchKeyword);
	}
	
	//이전글, 다음글
	@Override
	public RoomVO prevNext(RoomVO vo) {
		return roomDAO.prevNext(vo);
	}
	
	 //아이템이름
    @Override
    public RoomVO getRoomWithItemName(RoomVO vo) {
        return roomDAO.getRoomWithItemName(vo);
    }

	@Override
	public RoomVO getRoomWithItemName(int roomIdx) {
		return roomDAO.getRoomWithItemName(roomIdx);
	}
}
