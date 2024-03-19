package com.ogae.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MailVO {
	private String from;
	private String to;
	private String subject;
	private String content;
}
