package com.ogae.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogae.admin.board.RoomImgVO;
import com.ogae.admin.board.RoomVO;
import com.ogae.dao.ReserveDAO;
import com.ogae.service.ReserveService;
import com.ogae.vo.ReserveVO;

import lombok.extern.slf4j.Slf4j;

@Service
public class ReserveServiceImpl implements ReserveService {

	@Autowired
	private ReserveDAO reserDAO;

	@Override
	public List<ReserveVO> getReserList(Map<String, Date> param) {
		return  reserDAO.getReserList(param);
	}

	//
	@Override
	public List<RoomImgVO> getImageList() {
		return reserDAO.getImageList();
	}

	@Override
	public List<RoomImgVO>  getImages(RoomImgVO vo) {
		return reserDAO.getImages(vo);
	}
	// 231123 추가 권유진 -> 사용하는 객실 정보 가져오기
	@Override
	public List<RoomVO> getUseRoomList() {
		return reserDAO.getUseRoomList();
	}

	@Override
	public void insertReserve(ReserveVO vo) {
		reserDAO.insertReserve(vo);
	}
	
}
