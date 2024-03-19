package com.ogae.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ogae.admin.AdminDAO;
import com.ogae.admin.AdminVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO adminDAO;
	
	@Override
	public AdminVO getAdmin(AdminVO vo) {
		System.out.println("===> AdminServiceImpl getAdmin");
		return adminDAO.getAdmin(vo);
	}

	@Override
	@Transactional
	public int updateAdmin(AdminVO vo) {
		System.out.println("===> AdminServiceImpl updateAdmin");
		return adminDAO.updateAdmin(vo);
	}

	@Override
	public String checkAdmin(AdminVO vo) {
		System.out.println("===> AdminServiceImpl checkAdmin");
		return adminDAO.checkAdmin(vo);
	}


}
