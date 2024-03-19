package com.ogae.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogae.dao.GuestDAO;
import com.ogae.service.GuestService;
import com.ogae.vo.GuestVO;

@Service
public class GuestServiceImpl implements GuestService {
	
	@Autowired
	private GuestDAO guestDAO;
	
	@Override
	public void insertGuest(GuestVO vo) {
		guestDAO.insertGuest(vo);
	}

}
