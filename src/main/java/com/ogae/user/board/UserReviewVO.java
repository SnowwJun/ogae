package com.ogae.user.board;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserReviewVO {
	private Integer idx;
	private String title;
	private String writer;
	private String content;
	private String pass;
	private Date regDate;
	private Date modyDate;
	private Integer grade;
	private boolean secret;
	private String reply;
	private Integer count;
	
	/** 댓글 */
	private boolean hasReply; // 존재 여부
	
	/** 댓글 등록 */
	public void insertReviewReply(String reply) {
		this.reply = reply;
		this.hasReply = true; // 댓글이 등록되면 hasReply를 true로 설정
	}
	
	/** 댓글 삭제 */
	public void deleteReviewReply() {
		this.reply = null; // 댓글 내용을 null로 초기화
		this.hasReply = false; // 댓글이 삭제되면 hasReply를 false로 설정
	}
	
	/** 검색 */
	private String searchCondition;
    private String searchKeyword;
    
    /** 이전 글 다음 글 */
    private int prevNum;
    private int nextNum;
    private String prevTitle;
    private String nextTitle;
}