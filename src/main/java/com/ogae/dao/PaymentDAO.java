package com.ogae.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ogae.vo.PaymentVO;

@Repository
public class PaymentDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertPayment(PaymentVO vo) {
		sqlSessionTemplate.insert("PaymentDAO.insertPayment", vo);
	}
}
