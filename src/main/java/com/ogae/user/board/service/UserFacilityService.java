package com.ogae.user.board.service;

import java.util.List;

import com.ogae.user.board.UserFacilityVO;


public interface UserFacilityService {
    UserFacilityVO getFac(UserFacilityVO vo);
    List<UserFacilityVO> getFacList(UserFacilityVO vo);
    
}
