package com.ogae.user.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ogae.admin.board.Pagination;

@Repository
public class UserReviewDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/** 사용자 사용후기 등록 페이지 */
	public void insertReview(UserReviewVO vo) {
		System.out.println("===> insertReview() 기능 처리");
		System.out.println(vo.toString());
		try {
			sqlSessionTemplate.insert("UserReviewDAO.insertReview", vo);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	/** 사용자 사용후기 수정 */
	public void updateReview(UserReviewVO vo) {
		System.out.println("===> updateReview() 기능 처리");
		try {
			sqlSessionTemplate.update("UserReviewDAO.updateReview", vo);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	/** 사용자 사용후기 삭제 */
	public void deleteReview(UserReviewVO vo) {
		System.out.println("===> deleteReview() 기능 처리");
		sqlSessionTemplate.delete("UserReviewDAO.deleteReview", vo);
	}
	
	/** 사용자 사용후기 상세 보기 페이지 */
	public UserReviewVO getReview(UserReviewVO vo) {
		System.out.println("===> getReview(UserReviewVO vo) 기능 처리");
		return (UserReviewVO) sqlSessionTemplate.selectOne("UserReviewDAO.getReview", vo);
	}
	
	public Integer getReview(Integer idx) {
		System.out.println("===> getReview(Integer idx) 기능 처리");
		return sqlSessionTemplate.selectOne("UserReviewDAO.getReview", idx);
	}

	/** 사용자 사용후기 목록 페이지 */
	public List<UserReviewVO> getReviewList(UserReviewVO vo) {
		System.out.println("===> getReviewList(UserReviewVO vo) 기능 처리");
		return sqlSessionTemplate.selectList("UserReviewDAO.getReviewList", vo);
	}
	
	/** 페이징 처리 */
	public List<UserReviewVO> getReviewList(Pagination pagination) {
		System.out.println("===> getreviewList(Pagination pagination) 기능 처리");
		return sqlSessionTemplate.selectList("UserReviewDAO.getReviewList", pagination);
	}
	
	/** 게시글 총 개수 */
	public int getReviewListCnt() {
		System.out.println("===> getReviewListCnt() 기능 처리");
		return sqlSessionTemplate.selectOne("UserReviewDAO.getReviewListCnt");
	}
	
	/** 검색 */
	public List<UserReviewVO> getSearchReviewList(String searchCondition, String searchKeyword, Pagination pagination) {
	    System.out.println("===> getSearchReviewList(String searchCondition, String searchKeyword, Pagination pagination) 기능 처리");
	    
	    Map<String, Object> search = new HashMap<>();
	    search.put("searchCondition", searchCondition);
	    search.put("searchKeyword", searchKeyword);
	    search.put("startList", pagination.getStartList());
	    search.put("listSize", pagination.getListSize());

	    return sqlSessionTemplate.selectList("UserReviewDAO.getSearchReviewList", search);
	}

	public int getSearchReviewListCnt(String searchCondition, String searchKeyword) {
	    System.out.println("===> getSearchReviewListCnt(String searchCondition, String searchKeyword) 기능 처리");

	    Map<String, String> search = new HashMap<>();
	    search.put("searchCondition", searchCondition);
	    search.put("searchKeyword", searchKeyword);

	    return sqlSessionTemplate.selectOne("UserReviewDAO.getSearchReviewListCnt", search);
	}
	
	/** 이전 글 다음 글 */
	public UserReviewVO prevNext(UserReviewVO vo) {
		System.out.println("===> prevNext(UserReviewVO vo) 기능 처리");
		return sqlSessionTemplate.selectOne("UserReviewDAO.prevNext", vo);
	}
	
	/** 조회수 카운트 */
	public void countReview(Integer idx) {
		System.out.println("===> countReview(Integer idx) 기능 처리");
		sqlSessionTemplate.update("UserReviewDAO.countReview", idx);      
	}
	
	/** 댓글 조회 */
	public UserReviewVO getReviewReply(UserReviewVO vo) {
		System.out.println("===> getReviewReply((UserReviewVO vo) 기능 처리");
		return sqlSessionTemplate.selectOne("UserReviewDAO.getReviewReply", vo);
	}
}
