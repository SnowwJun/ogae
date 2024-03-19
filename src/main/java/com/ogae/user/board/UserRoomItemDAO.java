package com.ogae.user.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserRoomItemDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public UserRoomItemVO getRoomItem(UserRoomItemVO vo) {
		System.out.println("===> UserRoomItemVO [객실 아이템]");
		return sqlSessionTemplate.selectOne("UserRoomItemDAO.getRoomItem", vo);
	}
	
	public List<UserRoomItemVO> getRoomItemList(UserRoomItemVO vo){
		System.out.println("===> UserRoomItemVO [객실 아이템 리스트]");
		return sqlSessionTemplate.selectList("UserRoomItemDAO.getRoomItemList", vo);
	}
	
	public List<UserRoomItemVO> getRoomItemList(String roomItemIdx){
		System.out.println("선택된 아이템리스트");
		return sqlSessionTemplate.selectList("UserRoomItemDAO.getRoomItemList", roomItemIdx);
	}
	
}
