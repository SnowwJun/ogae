package com.ogae.vo;


import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReserveVO {
	private String reserve_idx;
	private Date reserve_start;
	private Date reserve_end;
	private String reserve_state;
	private int room_idx;
	private String guest_idx;
}
