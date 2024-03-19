package com.ogae.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ogae.vo.GuestVO;

@Repository
public class GuestDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertGuest(GuestVO vo) {
		sqlSessionTemplate.insert("GuestDAO.insertGuest", vo);
	}
}
