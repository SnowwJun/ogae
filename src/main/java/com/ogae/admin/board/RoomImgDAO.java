package com.ogae.admin.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class RoomImgDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//11.13.월
	public RoomImgVO getRoomImg(RoomImgVO vo) {
		return (RoomImgVO) sqlSessionTemplate.selectOne("RoomImgDAO.getRoomImg", vo);	
	}
	
	public void insertRoomImg(RoomImgVO vo) {
		log.debug("{}", vo);
		try {
			sqlSessionTemplate.insert("RoomImgDAO.insertRoomImg", vo);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateRoomImg(RoomImgVO vo) {
		log.debug("{}", vo);
		sqlSessionTemplate.update("RoomImgDAO.updateRoomImg", vo);
	}
	
	public void deleteRoomImg(RoomImgVO vo) {
		log.debug("{}", vo);
		sqlSessionTemplate.delete("RoomImgDAO.deleteRoomImg", vo);
	}
	
	public List<RoomImgVO> getRoomImgList(RoomImgVO vo){
		return sqlSessionTemplate.selectList("RoomImgDAO.getRoomImgList", vo);
	}
	
	public List<RoomImgVO> getRoomImgList(int roomIdx){
		return sqlSessionTemplate.selectList("RoomImgDAO.getRoomImgList", roomIdx);
	}
}
