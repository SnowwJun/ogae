package com.ogae.user.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ogae.admin.board.Pagination;

@Repository
public class UserEventDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/** 사용자 이벤트 상세 보기 페이지 */
	public UserEventVO getEvent(UserEventVO vo) {
		System.out.println("===> getEvent() 기능 처리");
		return (UserEventVO) sqlSessionTemplate.selectOne("UserEventDAO.getEvent", vo);
	}
	/** 사용자 이벤트 목록 페이지 */
	public List<UserEventVO> getEventList(UserEventVO vo) {
		System.out.println("===> getEventList() 기능 처리");
		return sqlSessionTemplate.selectList("UserEventDAO.getEventList", vo);
	}
	
	/** 페이징 처리 */
	public List<UserEventVO> getEventList(Pagination pagination) {
		return sqlSessionTemplate.selectList("UserEventDAO.getEventList", pagination);
	}

	/** 게시글 총 개수 */
	public int getEventListCnt() {
		System.out.println("===> getEventListCnt() 기능 처리");
		return sqlSessionTemplate.selectOne("UserEventDAO.getEventListCnt");
	}
	
	/** 검색 */
	public List<UserEventVO> getSearchEventList(String searchCondition, String searchKeyword, Pagination pagination) {
		System.out.println("===> getSearchEventList(String searchCondition, String searchKeyword, Pagination pagination");
		
		Map<String, Object> search = new HashMap<>();
		search.put("searchCondition", searchCondition);
		search.put("searchKeyword", searchKeyword);
		search.put("startList", pagination.getStartList());
		search.put("listSize", pagination.getListSize());
		
		return sqlSessionTemplate.selectList("UserEventDAO.getSearchEventList", search);
	}
	
	public int getSearchEventListCnt(String searchCondition, String searchKeyword) {
		Map<String, Object> search = new HashMap<>();
		search.put("searchCondition", searchCondition);
		search.put("searchKeyword", searchKeyword);
		
		return sqlSessionTemplate.selectOne("UserEventDAO.getSearchEventListCnt", search);
	}
	
	/** 이전 글 다음 글 */
	public UserEventVO prevNext(UserEventVO vo) {
		System.out.println("prevNext(UserEventVO vo) 기능 처리");
		return sqlSessionTemplate.selectOne("UserEventDAO.prevNext", vo);
	}
}
