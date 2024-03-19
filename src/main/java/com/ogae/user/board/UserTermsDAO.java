package com.ogae.user.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserTermsDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<UserTermsVO> getTermsList(UserTermsVO vo) {
		System.out.println("===> UserTermsDAO [TermsView]");
		return sqlSessionTemplate.selectList("UserTermsDAO.getTermsList", vo);
	}

//	public List<UserTermsVO> getTermsList(TermsVO vo) {
//		System.out.println("===> UserTermsDAO [TermsView]");
//		return sqlSessionTemplate.selectList("UserTermsDAO.getTermsList", vo);
//	}
}
