package com.ogae.admin.board.service;

import java.util.List;

import com.ogae.admin.board.Pagination;
import com.ogae.admin.board.QnaVO;

public interface QnaService {
    void insertQna(QnaVO vo);
    void updateQna(QnaVO vo);
    void deleteQna(QnaVO vo);
    QnaVO getQna(QnaVO vo);
    /** 게시글 목록 (검색 조건이 있는 경우) */
    List<QnaVO> getQnaList(QnaVO vo);
    
    /** 게시글 목록 (페이징 처리) */
    List<QnaVO> getQnaList(Pagination pagination);
    
    /** 게시글 총 개수 (검색 조건이 없는 경우) */
    int getQnaListCnt();
    
    /** 검색된 게시글 목록 (페이징 처리) */
    List<QnaVO> getSearchQnaList(String searchCondition, String searchKeyword, Pagination pagination);
    
    /** 게시글 총 개수 (검색 조건이 있는 경우) */
    int getSearchQnaListCnt(String searchCondition, String searchKeyword);
    /** 이전글 다음글 */
    QnaVO prevNext(QnaVO vo);
    
    /**댓글 등록*/
    void insertQnaReply(QnaVO vo);

    /**댓글 삭제*/
    void deleteQnaReply(QnaVO vo);
    
    /** 단일 댓글 조회 */
    String getQnaReply(QnaVO vo);
}
