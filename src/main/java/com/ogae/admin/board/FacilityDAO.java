package com.ogae.admin.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class FacilityDAO {
	
	

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public FacilityVO getFac(FacilityVO vo) {
		return (FacilityVO) sqlSessionTemplate.selectOne("FacilityDAO.getFac", vo);
	}
	

	public void insertFacility(FacilityVO vo) {
		log.debug("{}", vo);
		try {
	        sqlSessionTemplate.insert("FacilityDAO.insertFacility", vo);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	

	public void updateFacility(FacilityVO vo) {
		log.debug("{}", vo);
		sqlSessionTemplate.update("FacilityDAO.updateFacility", vo);
	}

	public void deleteFacility(FacilityVO vo) {
		log.debug("{}", vo);
		sqlSessionTemplate.delete("FacilityDAO.deleteFacility", vo);
	}

	public List<FacilityVO> getFacList(FacilityVO vo) {
		log.debug("{}", vo);
		return sqlSessionTemplate.selectList("FacilityDAO.getFacList", vo);
	}
	
	
}
