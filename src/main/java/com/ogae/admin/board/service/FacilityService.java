package com.ogae.admin.board.service;

import java.util.List;

import com.ogae.admin.board.FacilityVO;

public interface FacilityService {
    void insertFacility(FacilityVO vo);
    void updateFacility(FacilityVO vo);
    void deleteFacility(FacilityVO vo);
    FacilityVO getFac(FacilityVO vo);
    List<FacilityVO> getFacList(FacilityVO vo);
    
}
