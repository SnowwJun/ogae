package com.ogae.user.board;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class UserQnaVO {
	 private int qnaIdx; 
	    private String qnaTitle; 
	    private String qnaWriter;
	    private String qnaContent; 
	    private String qnaPass; 
	    private Date qnaRegDate; 
	    private Date qnaModyDate;
	    private int qnaCount; 
	    private boolean secret;
	    private MultipartFile uploadFile;
	   
	    //댓글 
	    private String qnaReply; // 댓글 내용을 담을 필드 추가
	    private boolean hasReply; // 댓글 존재 여부를 나타내는 필드
	    

	    // 댓글 등록
	    public void addComment(String commentContent) {
	        this.qnaReply = commentContent;
	        this.hasReply = true; // 댓글이 등록되면 hasComment를 true로 설정
	    }

	    // 댓글 삭제
	    public void deleteComment() {
	        this.qnaReply = null; // 댓글 내용을 null로 초기화
	        this.hasReply = false; // 댓글이 삭제되면 hasComment를 false로 설정
	    }
	    
	    //검색 
	    private String searchCondition;
	    private String searchKeyword;
	   
	    //이전글 다음글
	    private int prevNum;
	    private int nextNum;
	    private String prevTitle;
	    private String nextTitle;
	    
	} 
    
