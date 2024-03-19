package com.ogae.admin.board.service;

import java.util.List;

import com.ogae.admin.board.ServiceImgVO;
import com.ogae.admin.board.ServiceVO;

public interface ServiceService {
	
	
	ServiceVO getService(ServiceVO vo);
	
	public void insertService(ServiceVO vo);
	public void updateService(ServiceVO vo);
	public void deleteService(ServiceVO vo);
	
	public List<ServiceVO> getServiceList(ServiceVO vo);

	List<ServiceImgVO> getServiceImgList(int ServiceIdx);
	ServiceVO getService(int serviceIdx);
	
}
