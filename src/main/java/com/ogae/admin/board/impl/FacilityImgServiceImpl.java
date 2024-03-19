package com.ogae.admin.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.ogae.admin.board.FacilityImgDAO;
import com.ogae.admin.board.FacilityImgVO;
import com.ogae.admin.board.service.FacilityImgService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FacilityImgServiceImpl implements FacilityImgService {

	@Autowired
	private FacilityImgDAO FacilityImgDAO;

//	@Override
//	public FacilityImgVO getFacImg(FacilityImgVO vo) {
//		log.debug("{}", vo);
//		return FacilityImgDAO.getFacImg(vo);
//	}
	@Transactional
	@Override
	public void insertFacilityImg(FacilityImgVO vo) {
		log.debug("{}", vo);
		FacilityImgDAO.insertFacilityImg(vo);
	}


	@Override
	public void updateFacilityImg(FacilityImgVO vo) {
		log.debug("{}", vo);
		FacilityImgDAO.updateFacilityImg(vo);
	}

	@Override
	public void deleteFacilityImg(FacilityImgVO vo) {
		log.debug("{}", vo);
		FacilityImgDAO.deleteFacilityImg(vo);
	}

	@Override
	public List<FacilityImgVO> getFacImgList(FacilityImgVO vo) {
		log.debug("{}", vo);
		return FacilityImgDAO.getFacImgList(vo);
	}
	@Override
	public List<FacilityImgVO> getFacImgList(int facilityIdx) {
		log.debug("{}",facilityIdx);
		return  FacilityImgDAO.getFacImgList(facilityIdx);
	}

}
