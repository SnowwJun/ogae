package com.ogae.user.board;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserFacilityVO {
	private int facility_idx;
	private String facility_name;
	private String facility_info;
	private boolean facility_condition;
}
