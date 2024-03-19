package com.ogae.user.board;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserServiceVO {
	
	private int service_idx;
	private String service_name;
	private String service_info;
	private boolean service_condition;
	private int service_price;
	
}
