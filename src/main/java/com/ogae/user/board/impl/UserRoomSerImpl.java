package com.ogae.user.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogae.user.board.UserRoomDAO;
import com.ogae.user.board.UserRoomVO;
import com.ogae.user.board.service.UserRoomService;

@Service
public class UserRoomSerImpl implements UserRoomService {

	@Autowired
    private UserRoomDAO userRoomDAO;

    @Override
    public UserRoomVO getRoom(UserRoomVO vo) {    	
        return userRoomDAO.getRoom(vo);
    }

    @Override
    public List<UserRoomVO> getRoomList(UserRoomVO vo) {
        return userRoomDAO.getRoomList(vo);
    }
    
    
    //이전객실
    @Override
    public UserRoomVO getPrevRoom(int roomIdx) {
        return userRoomDAO.getPrevRoom(roomIdx);
    }
    
    
    //다음객실
    @Override
    public UserRoomVO getNextRoom(int roomIdx) {
        return userRoomDAO.getNextRoom(roomIdx);
    }

    //나머지 객실
    @Override
    public List<UserRoomVO> getOtherRooms(int currentRoomIdx){
    	return userRoomDAO.getOtherRooms(currentRoomIdx);
    }
    
    
    //아이템이름
    @Override
    public UserRoomVO getRoomWithItemName(UserRoomVO vo) {
        return userRoomDAO.getRoomWithItemName(vo);
    }

	@Override
	//public List<String> getRoomWithItemName(int roomIdxItem) {
	public UserRoomVO getRoomWithItemName(int roomIdx) {
		return userRoomDAO.getRoomWithItemName(roomIdx);
	}
}
