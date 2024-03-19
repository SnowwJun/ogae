package com.ogae.user.board.service;

import java.util.List;

import com.ogae.admin.board.ServiceImgVO;

public interface UserServiceImgService {
	ServiceImgVO getServiceImg(ServiceImgVO vo);
	void insertServiceImg(ServiceImgVO vo);
	void updateServiceImg(ServiceImgVO vo);
	void deleteServiceImg(ServiceImgVO vo);
//	List<ServiceImgVO> getServiceImgList(ServiceImgVO vo);
	List<ServiceImgVO> getServiceImgList(int ServiceIdx);
}
