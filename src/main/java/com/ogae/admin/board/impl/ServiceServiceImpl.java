package com.ogae.admin.board.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ogae.admin.board.ServiceDAO;
import com.ogae.admin.board.ServiceImgVO;
import com.ogae.admin.board.ServiceVO;
import com.ogae.admin.board.service.ServiceService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ServiceServiceImpl implements ServiceService {
	
	@Autowired
	private ServiceDAO ServiceDAO;
	
	
	@Override
	public ServiceVO getService(ServiceVO vo) {
		System.out.println("===> getService");
		return ServiceDAO.getService(vo);
	}
	
	@Override
	public void insertService(ServiceVO vo) {
		System.out.println("===> insertService");
		ServiceDAO.insertService(vo);
	}

	@Override
	public void updateService(ServiceVO vo) {
		System.out.println("===> updateService");
		ServiceDAO.updateService(vo);
	}

	@Override
	public void deleteService(ServiceVO vo) {
		System.out.println("===> deleteService");
		ServiceDAO.deleteService(vo);
	}

	@Override
	public List<ServiceVO> getServiceList(ServiceVO vo) {
		log.debug("{}", vo);
		return ServiceDAO.getServiceList(vo);
	}
	@Override
	public ServiceVO getService(int serviceIdx) {
		ServiceVO service = new ServiceVO();
		service.setService_idx(serviceIdx);
		return ServiceDAO.getService(service);
}
	@Override
    public List<ServiceImgVO> getServiceImgList(int serviceIdx) {
        log.debug("{}", serviceIdx);
        return ServiceDAO.getServiceImgList(serviceIdx);
    }

    	
	
}
