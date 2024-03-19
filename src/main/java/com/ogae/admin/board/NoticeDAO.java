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
public class NoticeDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public NoticeVO getNotice(NoticeVO vo) {
		return (NoticeVO) sqlSessionTemplate.selectOne("NoticeDAO.getNotice", vo);
	}

	public void insertNotice(NoticeVO vo) {
		log.debug("{}", vo);
		try {			
			sqlSessionTemplate.insert("NoticeDAO.insertNotice", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updateNotice(NoticeVO vo) {
		log.debug("{}", vo);
		sqlSessionTemplate.update("NoticeDAO.updateNotice", vo);
	}

	public void deleteNotice(NoticeVO vo) {
		log.debug("{}", vo);
		sqlSessionTemplate.delete("NoticeDAO.deleteNotice", vo);
	}

	/*글 목록 */
	public List<NoticeVO> getNoticeList(NoticeVO vo) {
		return sqlSessionTemplate.selectList("NoticeDAO.getNoticeList", vo);
	}
	
	    
    /* 페이징 처리 */
    public List<NoticeVO> getNoticeList(Pagination pagination) {
       System.out.println("===> 페이지네이션 기능 처리");
       return sqlSessionTemplate.selectList("NoticeDAO.getNoticeList", pagination);
    }
    
    /* 게시글 총 개수 */
    public int getNoticeListCnt() {
       System.out.println("===> 게시글 개수 기능 처리");
       return sqlSessionTemplate.selectOne("NoticeDAO.getNoticeListCnt");
    }
    
    /* 검색 */
    public List<NoticeVO> getSearchNoticeList(String searchCondition, String searchKeyword, Pagination pagination) {
        System.out.println("===> searchCondition, searchKeyword, pagination 기능 처리");
        
        Map<String, Object> search = new HashMap<>();
        search.put("searchCondition", searchCondition);
        search.put("searchKeyword", searchKeyword);
        search.put("startList", pagination.getStartList());
        search.put("listSize", pagination.getListSize());

        return sqlSessionTemplate.selectList("NoticeDAO.getSearchNoticeList", search);
    }

    public int getSearchNoticeListCnt(String searchCondition, String searchKeyword) {
    System.out.println("===> getSearchNoticeListCnt(String searchCondition, String searchKeyword) 기능 처리");

        Map<String, String> search = new HashMap<>();
        search.put("searchCondition", searchCondition);
        search.put("searchKeyword", searchKeyword);

        return sqlSessionTemplate.selectOne("NoticeDAO.getSearchNoticeListCnt", search);
    }

    /*이전글 다음글*/
	public NoticeVO prevNext(NoticeVO vo) {
		return sqlSessionTemplate.selectOne("NoticeDAO.prevNext", vo);
	}

}
