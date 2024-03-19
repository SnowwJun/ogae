package com.ogae.user.board.service;

import java.util.List;

import com.ogae.admin.board.Pagination;
import com.ogae.admin.board.QnaVO;
import com.ogae.user.board.UserQnaVO;


public interface UserQnaService {
	 void insertQna(UserQnaVO vo);
	    void updateQna(UserQnaVO vo);
	    void deleteQna(UserQnaVO vo);
	    UserQnaVO getQna(UserQnaVO vo);
	    /** 게시글 목록 (검색 조건이 있는 경우) */
	    List<UserQnaVO> getQnaList(UserQnaVO vo);
	    
	    /** 게시글 목록 (페이징 처리) */
	    List<UserQnaVO> getQnaList(Pagination pagination);
	    
	    /** 게시글 총 개수 (검색 조건이 없는 경우) */
	    int getQnaListCnt();
	    
	    /** 검색된 게시글 목록 (페이징 처리) */
	    List<UserQnaVO> getSearchQnaList(String searchCondition, String searchKeyword, Pagination pagination);
	    
	    /** 게시글 총 개수 (검색 조건이 있는 경우) */
	    int getSearchQnaListCnt(String searchCondition, String searchKeyword);
	    
	    /** 이전글 다음글 */
	    UserQnaVO prevNext(UserQnaVO vo);
	    
	    /**댓글 등록*/
	    void insertQnaReply(UserQnaVO vo);

	    /**댓글 삭제*/
	    void deleteQnaReply(UserQnaVO vo);
	    
	    /** 단일 댓글 조회 */
	    String getQnaReply(UserQnaVO vo);
	    
	    void countQna(int qnaIdx);
	}
