package com.ogae.admin.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/** 관리자 이벤트 상세 보기 페이지 */
	public ReviewVO getReview(ReviewVO vo) {
		System.out.println("===> getreview() 기능 처리");
		return (ReviewVO) sqlSessionTemplate.selectOne("ReviewDAO.getReview", vo);
	}
	
	/** 관리자 이벤트 목록 페이지 */
	public List<ReviewVO> getReviewList(ReviewVO vo) {
		System.out.println("===> getreviewList(ReviewVO vo) 기능 처리");
		return sqlSessionTemplate.selectList("ReviewDAO.getReviewList", vo);
	}
	
	/** 페이징 처리 */
	public List<ReviewVO> getReviewList(Pagination pagination) {
		System.out.println("===> getreviewList(Pagination pagination) 기능 처리");
		return sqlSessionTemplate.selectList("ReviewDAO.getReviewList", pagination);
	}
	
	/** 게시글 총 개수 */
	public int getReviewListCnt() {
		System.out.println("===> getReviewListCnt() 기능 처리");
		return sqlSessionTemplate.selectOne("ReviewDAO.getReviewListCnt");
	}
	
	/** 검색 */
	public List<ReviewVO> getSearchReviewList(String searchCondition, String searchKeyword, Pagination pagination) {
	    System.out.println("===> getSearchReviewList(String searchCondition, String searchKeyword, Pagination pagination) 기능 처리");
	    
	    Map<String, Object> search = new HashMap<>();
	    search.put("searchCondition", searchCondition);
	    search.put("searchKeyword", searchKeyword);
	    search.put("startList", pagination.getStartList());
	    search.put("listSize", pagination.getListSize());

	    return sqlSessionTemplate.selectList("ReviewDAO.getSearchReviewList", search);
	}

	public int getSearchReviewListCnt(String searchCondition, String searchKeyword) {
	    System.out.println("===> getSearchReviewListCnt(String searchCondition, String searchKeyword) 기능 처리");

	    Map<String, String> search = new HashMap<>();
	    search.put("searchCondition", searchCondition);
	    search.put("searchKeyword", searchKeyword);

	    return sqlSessionTemplate.selectOne("ReviewDAO.getSearchReviewListCnt", search);
	}
	
	/** 이전 글 다음 글 */
	public ReviewVO prevNext(ReviewVO vo) {
		System.out.println("===> prevNext(ReviewVO vo) 기능 처리");
		return sqlSessionTemplate.selectOne("ReviewDAO.prevNext", vo);
	}
	
	/** 댓글 등록 */
	public void insertReviewReply(ReviewVO vo) {
		System.out.println("===> insertReviewReply(ReviewVO vo) 기능 처리");
		sqlSessionTemplate.insert("ReviewDAO.insertReviewReply", vo);
	}
	
	/** 댓글 삭제 */
	public void deleteReviewReply(ReviewVO vo) {
		System.out.println("===> deleteReviewReply(ReviewVO vo) 기능 처리");
		sqlSessionTemplate.delete("ReviewDAO.deleteReviewReply", vo);
	}
	
	/** 댓글 조회 */
	public ReviewVO getReviewReply(ReviewVO vo) {
		System.out.println("===> getReviewReply((ReviewVO vo) 기능 처리");
		return sqlSessionTemplate.selectOne("ReviewDAO.getReviewReply", vo);
	}
}
