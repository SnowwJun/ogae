package com.ogae.admin.board.service;

import java.util.List;

import com.ogae.admin.board.Pagination;
import com.ogae.admin.board.RoomItemVO;
import com.ogae.admin.board.RoomVO;

public interface RoomService {
	RoomVO getRoom(RoomVO vo);
	void insertRoom(RoomVO vo);
	void updateRoom(RoomVO vo);
	void deleteRoom(RoomVO vo);

	/*게시글 목록(검색조건이 있는 경우)*/
	List<RoomVO> getRoomList(RoomVO vo);
	
	/*게시글 목록(페이징 처리)*/
	List<RoomVO> getRoomList(Pagination pagination);
	
	/*게시글 총 개수(검색 조건이 없는 경우)*/
	int getRoomListCnt();
	
	/*검색된 게시글 목록(페이징 처리)*/
	List<RoomVO> getSearchRoomList(String searchCondition, String searchKeyword, Pagination pagination);
	
	/*게시글 총 개수(검색 조건이 있는 경우)*/
	int getSearchRoomListCnt(String searchCondition, String searchKeyword);
	
	/*이전글, 다음글*/
	RoomVO prevNext(RoomVO vo);
	
	
	 //아이템이름
    RoomVO getRoomWithItemName(RoomVO vo);
    RoomVO getRoomWithItemName(int roomIdx);

}
