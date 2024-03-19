package com.ogae.admin.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class RoomDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public RoomVO getRoom(RoomVO vo) {
		log.debug("{}", vo.toString());
		return (RoomVO) sqlSessionTemplate.selectOne("RoomDAO.getRoom", vo);
	}
	
	public void insertRoom(RoomVO vo) {
		log.debug("{}", vo.toString());
		try {
			sqlSessionTemplate.insert("RoomDAO.insertRoom", vo);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void updateRoom(RoomVO vo) {
		log.debug("{}", vo.toString());
		sqlSessionTemplate.update("RoomDAO.updateRoom", vo);
	}
	
	public void deleteRoom(RoomVO vo) {
		log.debug("{}", vo.toString());
		sqlSessionTemplate.delete("RoomDAO.deleteRoom", vo);
	}
	
//	public List<RoomVO> getRoomList(RoomItemVO itemVO){
//		return sqlSessionTemplate.selectList("RoomDAO.getRoomList", itemVO);
//	}
	
	
	/*글 목록*/
	public List<RoomVO> getRoomList(RoomVO vo){
		log.debug("{}", vo.toString());
		return sqlSessionTemplate.selectList("RoomDAO.getRoomList", vo);
	}
	
	/*페이징 처리*/
	public List<RoomVO> getRoomList(Pagination pagination){
		System.out.println("===> getRoomList(Pagination pagination) 기능 처리");
		return sqlSessionTemplate.selectList("RoomDAO.getRoomList", pagination);
	}
	
	/*게시글 총 개수*/
	public int getRoomListCnt() {
		return sqlSessionTemplate.selectOne("RoomDAO.getRoomListCnt()");
	}
	
	/*검색*/
	public List<RoomVO> getSearchRoomList(String searchCondition, String SearchKeyword, Pagination pagination){
		System.out.println("===> getSearchRoomList 기능처리");
		
		Map<String, Object> search = new HashMap<>();
		search.put("SerachCondition", searchCondition);
		search.put("SearchKeyword", SearchKeyword);
		search.put("startList", pagination.getStartList());
		search.put("listSize", pagination.getListSize());
		
		return sqlSessionTemplate.selectList("RoomDAO.getSearchRoomList", search);
	}
	
	public int getSearchRoomListCnt(String searchCondition, String searchKeyword) {
		System.out.println("===> getSearchRoomListCnt(String searchCondition, String searchKeyword) 기능처리");
		
		Map<String, String> search = new HashMap<>();
		search.put("searchCondition", searchCondition);
		search.put("searchKeyword", searchKeyword);
		
		return sqlSessionTemplate.selectOne("RoomDAO.getSearchRoomListCnt", search);
	}
	
	
	//이전글, 다음글
	public RoomVO prevNext(RoomVO vo) {
		return sqlSessionTemplate.selectOne("RoomDAO.prevNext", vo);
	}
	
	 //아이템이름
	public RoomVO getRoomWithItemName(RoomVO vo) {
		 return sqlSessionTemplate.selectOne("RoomDAO.getRoomWithItemName", vo);
	 }

	public RoomVO getRoomWithItemName(int roomIdx) {
		return sqlSessionTemplate.selectOne("RoomDAO.getRoomWithItemName", roomIdx);
	}
}	
	
	

