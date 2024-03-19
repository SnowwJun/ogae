package com.ogae.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.ogae.admin.board.RoomImgVO;
import com.ogae.admin.board.RoomVO;
import com.ogae.vo.ReserveVO;

public interface ReserveService {
	List<ReserveVO> getReserList(Map<String, Date> param);
	
	//
	List<RoomImgVO> getImageList();
	List<RoomImgVO> getImages(RoomImgVO vo);

	// 231123 추가 권유진 -> 사용하는 객실 정보 가져오기
	List<RoomVO> getUseRoomList();
	
	void insertReserve(ReserveVO vo);
}
