package com.ogae.user.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class UserNoticeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	//글 목록
	public List<UserNoticeVO> getNoticeList(UserNoticeVO vo) {
		System.out.println("===> UserNoticeDAO [NoticeView]");
		return sqlSessionTemplate.selectList("UserNoticeDAO.getNoticeList", vo);
	}

	//조회수 카운트
	public void increaseNoticeCount(int noticeIdx) {
		sqlSessionTemplate.update("NoticeDAO.increaseNoticeCount", noticeIdx);
		
	}
	
	 // 페이징 처리
    public List<UserNoticeVO> getNoticeList(UserPagination pagination) {
       System.out.println("===> 페이지네이션 기능 처리");
       return sqlSessionTemplate.selectList("UserNoticeDAO.getNoticeList", pagination);
    }
    
    // 게시글 총 개수
    public int getNoticeListCnt() {
       System.out.println("===> 게시글 개수 기능 처리");
       return sqlSessionTemplate.selectOne("UserNoticeDAO.getNoticeListCnt");
    }
    
    /* 검색 */
    public List<UserNoticeVO> getSearchNoticeList(String searchCondition, String searchKeyword, UserPagination pagination) {
        System.out.println("===> searchCondition, searchKeyword, pagination 기능 처리");
        
        Map<String, Object> search = new HashMap<>();
        search.put("searchCondition", searchCondition);
        search.put("searchKeyword", searchKeyword);
        search.put("startList", pagination.getStartList());
        search.put("listSize", pagination.getListSize());

        return sqlSessionTemplate.selectList("UserNoticeDAO.getSearchNoticeList", search);
    }

    public int getSearchNoticeListCnt(String searchCondition, String searchKeyword) {
    System.out.println("===> getSearchNoticeListCnt(String searchCondition, String searchKeyword) 기능 처리");

        Map<String, String> search = new HashMap<>();
        search.put("searchCondition", searchCondition);
        search.put("searchKeyword", searchKeyword);

        return sqlSessionTemplate.selectOne("UserNoticeDAO.getSearchNoticeListCnt", search);
    }

    //이전글 다음글
	public UserNoticeVO prevNext(UserNoticeVO vo) {
		return sqlSessionTemplate.selectOne("UserNoticeDAO.prevNext", vo);
	}
	
}
