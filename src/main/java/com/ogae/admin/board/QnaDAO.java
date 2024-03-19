package com.ogae.admin.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class QnaDAO {
    @Autowired
    private SqlSessionTemplate sqlSession;

    public void insertQna(QnaVO vo) {
    	System.out.println("===> QnaDAO insertQna");
        sqlSession.insert("insertQna", vo);
    }

    public void updateQna(QnaVO vo) {
        sqlSession.update("updateQna", vo);
    }
   
    public void deleteQna(QnaVO vo) {
    	sqlSession.delete("deleteQna", vo);
    }

    /** 글 목록 */
    public List<QnaVO> getQnaList(QnaVO vo) {
        System.out.println("===> getQnaList(QnaVO vo) 기능 처리");
        return sqlSession.selectList("QnaDAO.getQnaList", vo);
     }
    
    /** 페이징 처리 */
    public List<QnaVO> getQnaList(Pagination pagination) {
       System.out.println("===> getQnaList(Pagination pagination) 기능 처리");
       return sqlSession.selectList("QnaDAO.getQnaList", pagination);
    }
    
    /** 게시글 총 개수 */
    public int getQnaListCnt() {
       System.out.println("===> getQnaListCnt() 기능 처리");
       return sqlSession.selectOne("QnaDAO.getQnaListCnt");
    }
    
    /** 검색 */
    public List<QnaVO> getSearchQnaList(String searchCondition, String searchKeyword, Pagination pagination) {
        System.out.println("===> getSearchQnaList(String searchCondition, String searchKeyword, Pagination pagination) 기능 처리");
        
        Map<String, Object> search = new HashMap<>();
        search.put("searchCondition", searchCondition);
        search.put("searchKeyword", searchKeyword);
        search.put("startList", pagination.getStartList());
        search.put("listSize", pagination.getListSize());

        return sqlSession.selectList("QnaDAO.getSearchQnaList", search);
    }

    public int getSearchQnaListCnt(String searchCondition, String searchKeyword) {
    System.out.println("===> getSearchQnaListCnt(String searchCondition, String searchKeyword) 기능 처리");

        Map<String, String> search = new HashMap<>();
        search.put("searchCondition", searchCondition);
        search.put("searchKeyword", searchKeyword);

        return sqlSession.selectOne("QnaDAO.getSearchQnaListCnt", search);
    }

    
    //
    public QnaVO getQna(QnaVO vo) {
        return (QnaVO) sqlSession.selectOne("QnaDAO.getQna", vo);
    }
    //이전글 다음글
    public QnaVO prevNext(QnaVO vo) {
    	return sqlSession.selectOne("QnaDAO.prevNext", vo);
    }

 
    // 댓글 등록
    public void insertQnaReply(QnaVO vo) {
        sqlSession.insert("QnaDAO.insertQnaReply", vo);
    }

    // 댓글 삭제
    public void deleteQnaReply(QnaVO vo) {
        sqlSession.delete("QnaDAO.deleteQnaReply", vo);
    }
    //댓글 정보 가져오기
    public QnaVO getQnaReply(QnaVO vo) {
        return sqlSession.selectOne("QnaDAO.getQnaReply", vo);
    }

}
    