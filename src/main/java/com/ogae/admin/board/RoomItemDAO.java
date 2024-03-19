package com.ogae.admin.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class RoomItemDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public RoomItemVO getRoomItem(RoomItemVO vo) {
		return (RoomItemVO) sqlSessionTemplate.selectOne("RoomItemDAO.getRoomItem", vo);
	}
	
	public void insertRoomItem(RoomItemVO vo) {
		log.debug("{}", vo);
		try {
			sqlSessionTemplate.insert("RoomItemDAO.insertRoomItem", vo);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateRoomItem(RoomItemVO vo) {
		sqlSessionTemplate.update("RoomItemDAO.updateRoomItem", vo);
	}
	
	public void deleteRoomItem(String itemIdx) {
	    sqlSessionTemplate.delete("RoomItemDAO.deleteRoomItem", itemIdx);
	}
	
	public List<RoomItemVO> getRoomItemList(String itemIdx){
		return sqlSessionTemplate.selectList("RoomItemDAO.getRoomItemList", itemIdx);
	}
	
	
	//검색 조건이 필요한 경우 사용
	public List<RoomItemVO> getRoomItemList(RoomItemVO vo){
		return sqlSessionTemplate.selectList("RoomItemDAO.getRoomItemList", vo);
	}
	
	//검색조건이 필요하지 않고 모든 내용을 가져오는 메서드(11.20 추가)
	public List<RoomItemVO> getAllRoomItems(){
		return sqlSessionTemplate.selectList("RoomItemDAO.getAllRoomItems");
	}
}
