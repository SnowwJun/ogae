package com.ogae.user.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ogae.user.board.UserFacilityDAO;
import com.ogae.user.board.UserFacilityVO;
import com.ogae.user.board.service.UserFacilityService;



@Service("UserFacilityService")
public class UserFacilityServiceImpl implements UserFacilityService{

    @Autowired
    private UserFacilityDAO FacilityDAO;

    @Override
    public UserFacilityVO getFac(UserFacilityVO vo) {
        return FacilityDAO.getFac(vo);
    }
    
  @Override
  public List<UserFacilityVO> getFacList(UserFacilityVO vo) {
      return FacilityDAO.getFacList(vo);
  }
   
    
  }


