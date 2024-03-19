package com.ogae.admin;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdminVO {
	private String id;
	private String password;
	private String name;
	private String bank;
	private String account;
	private String phone;
	private String email;
}
