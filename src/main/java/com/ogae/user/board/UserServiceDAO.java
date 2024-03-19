package com.ogae.user.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ogae.admin.board.ServiceImgVO;
import com.ogae.admin.board.ServiceVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class UserServiceDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/** 관리자 서비스 목록 페이지*/
	public ServiceVO getUserService(ServiceVO vo) {
		return (ServiceVO) sqlSessionTemplate.selectOne("UserServiceDAO.getUserService", vo);
	}
	/** 관리자 서비스 등록 페이지*/
	public void insertUserService(ServiceVO vo) {
		log.debug("{}", vo);

		try {
	        sqlSessionTemplate.insert("UserServiceDAO.insertUserService", vo);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	/** 관리자 서비스 페이지 수정*/
	public void updateUserService(ServiceVO vo) {
		log.debug("{}", vo);
		sqlSessionTemplate.update("UserServiceDAO.updateUserService", vo);
	}
	/**관리자 서비스 삭제 */
	public void deleteUserService(ServiceVO vo) {
		log.debug("{}", vo);
		sqlSessionTemplate.delete("UserServiceDAO.deleteUserService", vo);
	}
	/**관리자 서비스 목록 페이지*/
	public List<ServiceVO> getUserServiceList(ServiceVO vo) {
		return sqlSessionTemplate.selectList("UserServiceDAO.getUserServiceList", vo);
	}
	
//	public List<ServiceVO> getServiceImgList(ServiceVO vo) {
//		return sqlSessionTemplate.selectList("ServiceDAO.getServiceImgList", vo);
//	}
	public List<ServiceImgVO> getServiceImgList(int serviceIdx) {
		return sqlSessionTemplate.selectList("ServiceDAO.getServiceImgList");
	}
}
