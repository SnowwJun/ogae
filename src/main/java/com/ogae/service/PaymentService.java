package com.ogae.service;

import com.ogae.vo.PaymentVO;

public interface PaymentService {
	PaymentVO getPayment(PaymentVO vo);
	void insertPayment(PaymentVO vo);
}
