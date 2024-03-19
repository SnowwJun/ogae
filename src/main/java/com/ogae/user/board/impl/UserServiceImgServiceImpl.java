package com.ogae.user.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogae.admin.board.ServiceImgDAO;
import com.ogae.admin.board.ServiceImgVO;
import com.ogae.admin.board.service.ServiceImgService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("UserServiceService")
public class UserServiceImgServiceImpl implements ServiceImgService {

	@Autowired
	private ServiceImgDAO serviceImgDAO;

	@Override
	public ServiceImgVO getServiceImg(ServiceImgVO vo) {
		log.debug("{}", vo);
		return serviceImgDAO.getServiceImg(vo);
	}

	@Override
	public void insertServiceImg(ServiceImgVO vo) {
		log.debug("{}", vo);
		serviceImgDAO.insertServiceImg(vo);

	}

	@Override
	public void updateServiceImg(ServiceImgVO vo) {
		log.debug("{}", vo);
		serviceImgDAO.updateServiceImg(vo);
	}

	@Override
	public void deleteServiceImg(ServiceImgVO vo) {
		log.debug("{}", vo);
		serviceImgDAO.deleteServiceImg(vo);
	}
//
//	@Override
//	public List<ServiceImgVO> getServiceImgList(ServiceImgVO vo) {
//		log.debug("{}", vo);
//		return serviceImgDAO.getServiceImgList(vo);
//	}
	
	@Override
	public List<ServiceImgVO> getServiceImgList(int ServiceIdx) {
	    log.debug("{}", ServiceIdx);
	    return serviceImgDAO.getServiceImgList(ServiceIdx);
	}

}
