package com.ogae.admin.board.service;

import java.util.List;

import com.ogae.admin.board.FacilityImgVO;

public interface FacilityImgService {
    
    //등록 부분 변경
    void insertFacilityImg(FacilityImgVO vo);
    void updateFacilityImg(FacilityImgVO vo);
    void deleteFacilityImg(FacilityImgVO vo);
    List<FacilityImgVO> getFacImgList(FacilityImgVO vo);
    List<FacilityImgVO> getFacImgList(int facilityIdx);

    
    
}

