package com.ogae.admin.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class FacilityImgDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public FacilityImgVO getFacImg(FacilityImgVO vo) {
		return (FacilityImgVO) sqlSessionTemplate.selectOne("FacilityImgDAO.getFacImg", vo);	
	}
	
	public void insertFacilityImg(FacilityImgVO vo) {
		log.debug("{}", vo);
		try {
			sqlSessionTemplate.insert("FacilityImgDAO.insertFacilityImg", vo);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateFacilityImg(FacilityImgVO vo) {
		log.debug("{}", vo);
		sqlSessionTemplate.update("FacilityImgDAO.updateFacilityImg", vo);
	}
	
	public void deleteFacilityImg(FacilityImgVO vo) {
		log.debug("{}", vo);
		sqlSessionTemplate.delete("FacilityImgDAO.deleteFacilityImg", vo);
	}
	
	public List<FacilityImgVO> getFacImgList(FacilityImgVO vo){
		return sqlSessionTemplate.selectList("FacilityImgDAO.getFacImgList", vo);
		
	}
	
	public List<FacilityImgVO> getFacImgList(int facilityIdx) {
		return sqlSessionTemplate.selectList("FacilityImgDAO.getFacImgList",facilityIdx);
	}
	

	
}
