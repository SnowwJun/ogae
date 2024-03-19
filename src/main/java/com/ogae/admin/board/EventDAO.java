package com.ogae.admin.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/** 관리자 이벤트 등록 페이지 */
	public void insertEvent(EventVO vo) {
		System.out.println("===> insertEvent() 기능 처리");
		System.out.println(vo.toString());
		try {
			sqlSessionTemplate.insert("EventDAO.insertEvent", vo);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	/** 관리자 이벤트 수정 */
	public void updateEvent(EventVO vo) {
		System.out.println("===> updateEvent() 기능 처리");
		sqlSessionTemplate.update("EventDAO.updateEvent", vo);
	}
	/** 관리자 이벤트 삭제 */
	public void deleteEvent(EventVO vo) {
		System.out.println("===> deleteEvent() 기능 처리");
		sqlSessionTemplate.delete("EventDAO.deleteEvent", vo);
	}
	/** 관리자 이벤트 상세 보기 페이지 */
	public EventVO getEvent(EventVO vo) {
		System.out.println("===> getEvent() 기능 처리");
		return (EventVO) sqlSessionTemplate.selectOne("EventDAO.getEvent", vo);
	}
	/** 관리자 이벤트 목록 페이지 */
	public List<EventVO> getEventList(EventVO vo) {
		System.out.println("===> getEventList() 기능 처리");
		return sqlSessionTemplate.selectList("EventDAO.getEventList", vo);
	}

	/** 페이징 처리 */
	public List<EventVO> getEventList(Pagination pagination) {
		return sqlSessionTemplate.selectList("EventDAO.getEventList", pagination);
	}
	
	/** 게시글 총 개수 */
	public int getEventListCnt() {
		System.out.println("===> getEventListCnt() 기능 처리");
		return sqlSessionTemplate.selectOne("EventDAO.getEventListCnt");
	}
	
	/** 검색 */
	public List<EventVO> getSearchEventList(String searchCondition, String searchKeyword, Pagination pagination) {
		Map<String, Object> search = new HashMap<>();
		search.put("searchCondition", searchCondition);
		search.put("searchKeyword", searchKeyword);
		search.put("startList", pagination.getStartList());
		search.put("listSize", pagination.getListSize());
		
		System.out.println("===> getSearchEventList(String searchCondition, String searchKeyword, Pagination pagination) 기능 처리");
		return sqlSessionTemplate.selectList("EventDAO.getSearchEventList", search);
	}
	
	public int getSearchEventListCnt(String searchCondition, String searchKeyword) {
		Map<String, Object> search = new HashMap<>();
		search.put("searchCondition", searchCondition);
		search.put("searchKeyword", searchKeyword);
		
		System.out.println("===> getSearchEventListCnt(String searchCondition, String searchKeyword) 기능 처리");
		return sqlSessionTemplate.selectOne("EventDAO.getSearchEventListCnt", search);
	}
	
	/** 이전 글 다음 글 */
	public EventVO prevNext(EventVO vo) {
		System.out.println("===> prevNext(EventVO vo) 기능 처리");
		return sqlSessionTemplate.selectOne("EventDAO.prevNext", vo);
	}
}
