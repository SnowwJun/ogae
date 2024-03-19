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
public class TermsDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public TermsVO getTermsView(TermsVO vo) {
		
		return (TermsVO) sqlSessionTemplate.selectOne("TermsDAO.getTermsView", vo);
	}

	
	public void insertTerms(TermsVO vo) {
		log.debug("{}", vo);
		try {
			sqlSessionTemplate.insert("TermsDAO.insertTerms", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	


	public void updateTermsBoard(TermsVO vo) {
		log.debug("{}", vo);
		sqlSessionTemplate.update("TermsDAO.updateTermsBoard", vo);
	}

	public void deleteTerms(TermsVO vo) {
		log.debug("{}", vo);
		sqlSessionTemplate.delete("TermsDAO.deleteTerms", vo);
	}

	public List<TermsVO> getTermsList(TermsVO vo) {
		log.debug("{}", vo);
		return sqlSessionTemplate.selectList("TermsDAO.getTermsList", vo);
	}
	
	  /* 페이징 처리 */
    public List<TermsVO> getTermsList(Pagination pagination) {
       System.out.println("===> 페이지네이션 기능 처리");
       return sqlSessionTemplate.selectList("TermsDAO.getTermsList", pagination);
    }
    
    /* 게시글 총 개수 */
    public int getTermsListCnt() {
       System.out.println("===> 게시글 개수 기능 처리");
       return sqlSessionTemplate.selectOne("TermsDAO.getTermsListCnt");
    }
    
    /* 검색 */
    public List<TermsVO> getSearchTermsList(String searchCondition, String searchKeyword, Pagination pagination) {
        System.out.println("===> searchCondition, searchKeyword, pagination 기능 처리");
        
        Map<String, Object> search = new HashMap<>();
        search.put("searchCondition", searchCondition);
        search.put("searchKeyword", searchKeyword);
        search.put("startList", pagination.getStartList());
        search.put("listSize", pagination.getListSize());

        return sqlSessionTemplate.selectList("TermsDAO.getTermsList", search);
    }

    public int getSearchTermsListCnt(String searchCondition, String searchKeyword) {
    System.out.println("===> getSearchTermsListCnt(String searchCondition, String searchKeyword) 기능 처리");

        Map<String, String> search = new HashMap<>();
        search.put("searchCondition", searchCondition);
        search.put("searchKeyword", searchKeyword);

        return sqlSessionTemplate.selectOne("TermsDAO.getSearchNoticeListCnt", search);
    }    
	
}
