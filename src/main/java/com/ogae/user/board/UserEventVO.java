package com.ogae.user.board;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserEventVO {
	private Integer idx;
	private String title;
	private String writer;
	private String content;
	private boolean condition;
	private Date regDate;
	private Date modyDate;
	private Date startDate;
	private Date endDate;
	
	/** 검색 */
	private String searchCondition;
    private String searchKeyword;
    
    /** 이전 글 다음 글 */
    private int prevNum;
    private int nextNum;
    private String prevTitle;
    private String nextTitle;
}
