package com.ogae.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class GuestVO {
	private String guest_idx;
	private String guest_name;
	private String guest_birth;
	private String guest_phone;
	private String guest_emerge_phone;
	private String guest_email;
	private String guest_arrive_time;
	private String guest_request;
}
