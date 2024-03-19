package com.ogae.admin.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class ServiceImgDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public ServiceImgVO getServiceImg(ServiceImgVO vo) {
		return (ServiceImgVO) sqlSessionTemplate.selectOne("ServiceImgDAO.getServiceImg", vo);	
	}
	
	public void insertServiceImg(ServiceImgVO vo) {
		log.debug("{}", vo);
		try {
			sqlSessionTemplate.insert("ServiceImgDAO.insertServiceImg", vo);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateServiceImg(ServiceImgVO vo) {
		log.debug("{}", vo);
		sqlSessionTemplate.update("ServiceImgDAO.updateServiceImg", vo);
	}
	
	public void deleteServiceImg(ServiceImgVO vo) {
		log.debug("{}", vo);
		sqlSessionTemplate.delete("ServiceImgDAO.deleteServiceImg", vo);
	}
	

//	public List<ServiceImgVO> getServiceImgList(ServiceImgVO vo){
//		return sqlSessionTemplate.selectList("ServiceImgDAO.getServiceImgList", vo);
//	}
	public List<ServiceImgVO> getServiceImgList(int ServiceIdx) {
	      return sqlSessionTemplate.selectList("ServiceImgDAO.getServiceImgList",ServiceIdx);
	   }
	
	
}
