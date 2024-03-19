package com.ogae.user.board;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserRoomVO {

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
	private String room_checkin;
	private String room_checkout;
	private int room_price;
	
	//아이템 불러오기
	private String room_item_names;

	// 이미지 배열을 저장할 List
	private List<String> roomImages;
	
	//이전글 다음글
    private int prevNum;
    private int nextNum;
    private String prevTitle;
    private String nextTitle;

}
