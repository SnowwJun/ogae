package com.ogae.user.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class UserFacilityImgDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public UserFacilityImgVO getFacImg(UserFacilityImgVO vo) {
		return (UserFacilityImgVO) sqlSessionTemplate.selectOne("UserFacilityImgDAO.getFacImg", vo);	
	}
	
	
	public List<UserFacilityImgVO> getFacImgList(UserFacilityImgVO vo){
		return sqlSessionTemplate.selectList("UserFacilityImgDAO.getFacImgList", vo);
		
	}
	
	public List<UserFacilityImgVO> getFacImgList(int facilityIdx) {
		return sqlSessionTemplate.selectList("UserFacilityImgDAO.getFacImgList",facilityIdx);
	}
	

	
}
