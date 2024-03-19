package com.ogae.user.board;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserNoticeVO {

	private int notice_idx;
	private String notice_title;
	private String notice_writer;
	private String notice_content;
	private Date notice_regdate;
	private Date notice_modydate;
	private boolean notice_condition;
	private int notice_count;
	
	//검색 
    private String searchCondition;
    private String searchKeyword;
   
    //이전글 다음글
    private int prevNum;
    private int nextNum;
    private String prevTitle;
    private String nextTitle;
}
