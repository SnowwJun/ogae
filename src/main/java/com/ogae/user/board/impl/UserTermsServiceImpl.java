package com.ogae.user.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ogae.user.board.UserTermsDAO;
import com.ogae.user.board.UserTermsVO;
import com.ogae.user.board.service.UserTermsService;


@Service
public class UserTermsServiceImpl implements UserTermsService {
	@Autowired
	private UserTermsDAO userTermsDAO;

	@Override
	@Transactional
	public List<UserTermsVO> getTermsList(UserTermsVO vo) {
		return userTermsDAO.getTermsList(vo);
	}
	
}
