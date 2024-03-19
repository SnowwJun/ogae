package com.ogae.user.board.service;

import java.util.List;

import com.ogae.user.board.UserFacilityImgVO;


public interface UserFacilityImgService {
   
    List<UserFacilityImgVO> getFacImgList(UserFacilityImgVO vo);
    List<UserFacilityImgVO> getFacImgList(int facilityIdx);

    
    
}

