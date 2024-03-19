package com.ogae.admin.board;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FacilityVO {
	private int facility_idx;
	private String facility_name;
	private String facility_info;
	private boolean facility_condition;
}
