package com.ogae.user.board.service;

import java.util.List;

import com.ogae.user.board.UserTermsVO;


public interface UserTermsService {

	List<UserTermsVO> getTermsList(UserTermsVO vo);
	
}
