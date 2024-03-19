package com.ogae.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TermsAgreeDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
}
