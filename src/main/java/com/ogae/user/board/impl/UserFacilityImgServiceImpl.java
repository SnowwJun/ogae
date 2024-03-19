package com.ogae.user.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.ogae.user.board.UserFacilityImgDAO;
import com.ogae.user.board.UserFacilityImgVO;
import com.ogae.user.board.service.UserFacilityImgService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class UserFacilityImgServiceImpl implements UserFacilityImgService {

	@Autowired
	private UserFacilityImgDAO FacilityImgDAO;

//	@Override
//	public FacilityImgVO getFacImg(FacilityImgVO vo) {
//		log.debug("{}", vo);
//		return FacilityImgDAO.getFacImg(vo);
//	}
	
	@Override
	public List<UserFacilityImgVO> getFacImgList(UserFacilityImgVO vo) {
		log.debug("{}", vo);
		return FacilityImgDAO.getFacImgList(vo);
	}
	@Override
	public List<UserFacilityImgVO> getFacImgList(int facilityIdx) {
		log.debug("{}",facilityIdx);
		return  FacilityImgDAO.getFacImgList(facilityIdx);
	}

}
