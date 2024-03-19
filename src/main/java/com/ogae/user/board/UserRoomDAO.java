package com.ogae.user.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ogae.admin.board.NoticeVO;

@Repository
public class UserRoomDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public UserRoomVO getRoom(UserRoomVO vo) {
		System.out.println("===> UserRoomVO[객실]");
		return sqlSessionTemplate.selectOne("UserRoomDAO.getRoom", vo);
	}

	public List<UserRoomVO> getRoomList(UserRoomVO vo) {
		System.out.println("===> UserRoomVO [객실리스트]");
		return sqlSessionTemplate.selectList("UserRoomDAO.getRoomList", vo);
	}

	/* 이전글 다음글 */
	public UserRoomVO getPrevRoom(int roomIdx) {
	    return sqlSessionTemplate.selectOne("UserRoomDAO.getPrevRoom", roomIdx);
	}

	public UserRoomVO getNextRoom(int roomIdx) {
	    return sqlSessionTemplate.selectOne("UserRoomDAO.getNextRoom", roomIdx);
	}
	
	/*나머지 객실*/
	 public List<UserRoomVO> getOtherRooms(int currentRoomIdx) {
	        return sqlSessionTemplate.selectList("UserRoomDAO.getOtherRooms", currentRoomIdx);
	 }
	 
	 
	 //아이템이름
	 public UserRoomVO getRoomWithItemName(UserRoomVO vo) {
		 return sqlSessionTemplate.selectOne("UserRoomDAO.getRoomWithItemName", vo);
	 }

	//public List<String> getRoomWithItemName(int roomIdxItem) {
	 public UserRoomVO getRoomWithItemName(int roomIdx) {
		return sqlSessionTemplate.selectOne("UserRoomDAO.getRoomWithItemName", roomIdx);
	}
	
}
