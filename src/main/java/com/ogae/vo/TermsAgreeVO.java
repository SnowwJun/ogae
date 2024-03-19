package com.ogae.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TermsAgreeVO {
	private int terms_agree_idx;
	private char terms_agree_status;
	private Date terms_agree_date;
	private int terms_idx;
	private int reserve_idx;
}
