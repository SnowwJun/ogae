package com.ogae.user.board.service;

import java.util.List;

import com.ogae.admin.board.NoticeVO;
import com.ogae.user.board.UserRoomVO;

public interface UserRoomService {
	
	UserRoomVO getRoom(UserRoomVO vo);
    List<UserRoomVO> getRoomList(UserRoomVO vo);
    
    
    // 이전객실
    public UserRoomVO getPrevRoom(int roomIdx);
    
    //다음객실
    public UserRoomVO getNextRoom(int roomIdx);
    
    //나머지 객실
    public List<UserRoomVO> getOtherRooms(int currentRoomIdx);
    
    
    //아이템이름
    UserRoomVO getRoomWithItemName(UserRoomVO vo);
	//List<String> getRoomWithItemName(int roomIdxItem);
    UserRoomVO getRoomWithItemName(int roomIdx);
}
