package com.ogae.user.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class UserFacilityDAO {
	
	

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public UserFacilityVO getFac(UserFacilityVO vo) {
		return (UserFacilityVO) sqlSessionTemplate.selectOne("UserFacilityDAO.getFac", vo);
	}
	

	public List<UserFacilityVO> getFacList(UserFacilityVO vo) {
		log.debug("{}", vo);
		return sqlSessionTemplate.selectList("UserFacilityDAO.getFacList", vo);
	}
	
	
}
