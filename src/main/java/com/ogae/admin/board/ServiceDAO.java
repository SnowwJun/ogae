package com.ogae.admin.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class ServiceDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/** 관리자 서비스 목록 페이지*/
	public ServiceVO getService(ServiceVO vo) {
		return (ServiceVO) sqlSessionTemplate.selectOne("ServiceDAO.getService", vo);
	}
	/** 관리자 서비스 등록 페이지*/
	public void insertService(ServiceVO vo) {
		log.debug("{}", vo);

		try {
	        sqlSessionTemplate.insert("ServiceDAO.insertService", vo);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	/** 관리자 서비스 페이지 수정*/
	public void updateService(ServiceVO vo) {
		log.debug("{}", vo);
		sqlSessionTemplate.update("ServiceDAO.updateService", vo);
	}
	/**관리자 서비스 삭제 */
	public void deleteService(ServiceVO vo) {
		log.debug("{}", vo);
		sqlSessionTemplate.delete("ServiceDAO.deleteService", vo);
	}
	/**관리자 서비스 목록 페이지*/
	public List<ServiceVO> getServiceList(ServiceVO vo) {
		return sqlSessionTemplate.selectList("ServiceDAO.getServiceList", vo);
	}
	
//	public List<ServiceVO> getServiceImgList(ServiceVO vo) {
//		return sqlSessionTemplate.selectList("ServiceDAO.getServiceImgList", vo);
//	}
	public List<ServiceImgVO> getServiceImgList(int serviceIdx) {
		return sqlSessionTemplate.selectList("ServiceDAO.getServiceImgList");
	}
}
