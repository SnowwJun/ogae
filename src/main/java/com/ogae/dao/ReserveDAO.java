package com.ogae.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ogae.admin.board.RoomImgVO;
import com.ogae.admin.board.RoomVO;
import com.ogae.vo.ReserveVO;

@Repository
public class ReserveDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<ReserveVO> getReserList(Map<String, Date> param) {
		return sqlSessionTemplate.selectList("ReserveDAO.getReserList", param);
	}
	
	//
	public List<RoomImgVO> getImageList() {
		return sqlSessionTemplate.selectList("ReserveDAO.getImageList");
	}
	
	public List<RoomImgVO> getImages(RoomImgVO vo) {
		return sqlSessionTemplate.selectList("ReserveDAO.getImages", vo);
	}
	
	//
	public List<RoomVO> getUseRoomList() {
		return sqlSessionTemplate.selectList("ReserveDAO.getUseRoomList");
	}
	
	public void insertReserve(ReserveVO vo) {
		sqlSessionTemplate.insert("ReserveDAO.insertReserve", vo);
	}
	
}