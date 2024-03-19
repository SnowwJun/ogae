package com.ogae.user.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ogae.admin.board.Pagination;
import com.ogae.admin.board.QnaVO;
@Repository
public class UserQnaDAO {
    @Autowired
    private SqlSessionTemplate sqlSession;

    public void insertQna(UserQnaVO vo) {
    	System.out.println("===> UserQnaDAO insertQna");
        sqlSession.insert("insertQna", vo);
    }

    public void updateQna(UserQnaVO vo) {
        sqlSession.update("updateQna", vo);
    }
   
    public void deleteQna(UserQnaVO vo) {
    	sqlSession.delete("deleteQna", vo);
    }
    /** 글 목록 */
    public List<UserQnaVO> getQnaList(UserQnaVO vo) {
        System.out.println("===> getQnaList(QnaVO vo) 기능 처리");
        return sqlSession.selectList("UserQnaDAO.getQnaList", vo);
     }
    
    /** 페이징 처리 */
    public List<UserQnaVO> getQnaList(Pagination pagination) {
       System.out.println("===> getQnaList(Pagination pagination) 기능 처리");
       return sqlSession.selectList("UserQnaDAO.getQnaList", pagination);
    }
    
    /** 게시글 총 개수 */
    public int getQnaListCnt() {
       System.out.println("===> getQnaListCnt() 기능 처리");
       return sqlSession.selectOne("UserQnaDAO.getQnaListCnt");
    }
    
    /** 검색 */
    public List<UserQnaVO> getSearchQnaList(String searchCondition, String searchKeyword, Pagination pagination) {
        System.out.println("===> getSearchQnaList(String searchCondition, String searchKeyword, Pagination pagination) 기능 처리");
        
        Map<String, Object> search = new HashMap<>();
        search.put("searchCondition", searchCondition);
        search.put("searchKeyword", searchKeyword);
        search.put("startList", pagination.getStartList());
        search.put("listSize", pagination.getListSize());

        return sqlSession.selectList("UserQnaDAO.getSearchQnaList", search);
    }

    public int getSearchQnaListCnt(String searchCondition, String searchKeyword) {
    System.out.println("===> getSearchQnaListCnt(String searchCondition, String searchKeyword) 기능 처리");

        Map<String, String> search = new HashMap<>();
        search.put("searchCondition", searchCondition);
        search.put("searchKeyword", searchKeyword);

        return sqlSession.selectOne("UserQnaDAO.getSearchQnaListCnt", search);
    }

    public UserQnaVO getQna(UserQnaVO vo) {
        return sqlSession.selectOne("UserQnaDAO.getQna", vo);
    }
   
    //이전글 다음글
    public UserQnaVO prevNext(UserQnaVO vo) {
    	return sqlSession.selectOne("UserQnaDAO.prevNext", vo);
    }

 
    // 댓글 등록
    public void insertQnaReply(UserQnaVO vo) {
        sqlSession.insert("UserQnaDAO.insertQnaReply", vo);
    }

    // 댓글 삭제
    public void deleteQnaReply(UserQnaVO vo) {
        sqlSession.delete("UserQnaDAO.deleteQnaReply", vo);
    }
    //댓글 정보 가져오기
    public UserQnaVO getQnaReply(UserQnaVO vo) {
        return sqlSession.selectOne("UserQnaDAO.getQnaReply", vo);
    }

    //조회수 카운트
    public void countQna(int qnaIdx) {
        sqlSession.update("UserQnaDAO.countQna", qnaIdx);
    }


}
    