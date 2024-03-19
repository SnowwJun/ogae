package com.ogae.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogae.dao.PaymentDAO;
import com.ogae.service.PaymentService;
import com.ogae.vo.PaymentVO;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	private PaymentDAO paymentDAO;
	
	@Override
	public PaymentVO getPayment(PaymentVO vo) {
		return null;
	}

	@Override
	public void insertPayment(PaymentVO vo) {
		paymentDAO.insertPayment(vo);
	}

}
