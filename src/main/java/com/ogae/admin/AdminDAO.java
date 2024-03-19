package com.ogae.admin;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public String checkAdmin(AdminVO vo) {
		return sqlSessionTemplate.selectOne("AdminDAO.checkAdmin",vo);
	}
	
	public AdminVO getAdmin(AdminVO vo) {
		return sqlSessionTemplate.selectOne("AdminDAO.getAdmin", vo);
	}
	
	public int updateAdmin(AdminVO vo) {
		return sqlSessionTemplate.update("AdminDAO.updateAdmin", vo);
	}
}
