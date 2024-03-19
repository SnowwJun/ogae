package com.ogae.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PaymentVO {
	private String payment_idx;
	private String payment_type;
	private String payment_status;
	private String payment_bank;
	private String payment_approval;
	private String payment_date;
	private int payment_total;
	private String reserve_idx;
}
