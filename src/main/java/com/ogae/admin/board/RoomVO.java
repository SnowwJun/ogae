package com.ogae.admin.board;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RoomVO {
	private int room_idx;
	private String room_name;
	private String room_info;
	private boolean room_condition;
	private String room_category;
	private int person_num;
	private int dog_num;
	private String room_item_idx;
	private String room_guide;
	private int room_size;
	private Timestamp room_regdate;
	private String room_checkin;
	private String room_checkout;
	private int room_price;
	
	//아이템 불러오기
	private String room_item_names;
    
    //11.27 검색 
    private String searchCondition;
    private String searchKeyword;
    
    //11.27 이전글 다음글
    private int prevNum;
    private int nextNum;
    private String prevTitle;
    private String nextTitle;


}
