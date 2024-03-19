package com.ogae.admin.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ogae.admin.board.FacilityDAO;
import com.ogae.admin.board.FacilityImgVO;
import com.ogae.admin.board.FacilityVO;
import com.ogae.admin.board.service.FacilityService;


@Service("FacilityService")
public class FacilityServiceImpl implements FacilityService{

    @Autowired
    private FacilityDAO FacilityDAO;

    @Override
    @Transactional
    public void insertFacility(FacilityVO vo) {
    	System.out.println("===> FacilityServiceImpl insertFacility");
        FacilityDAO.insertFacility(vo);
        
    }
   
    @Override
    @Transactional
    public void updateFacility(FacilityVO vo) {
        // 기존의 게시글을 불러옵니다.
        FacilityVO existingFacility = FacilityDAO.getFac(vo);
        System.out.println("===> FacilityServiceImpl updateFacility");

        // 기존 게시글이 존재하면 수정할 내용을 적용합니다.
        if (existingFacility != null) {
            // 기존 게시글의 정보를 가져와서 vo에 설정합니다.
            vo.setFacility_idx(existingFacility.getFacility_idx());
            // 나머지 필요한 설정을 수행합니다.
            // 예를 들어, 제목, 작성자, 내용 등을 설정할 수 있습니다.

            // 수정된 내용을 DAO를 통해 업데이트합니다.
            FacilityDAO.updateFacility(vo);
        } else {
            // 기존 게시글이 없으면 처리 로직을 추가하거나 예외를 던질 수 있습니다.
            // 여기서는 간단하게 콘솔에 메시지를 출력합니다.
            System.out.println("게시글이 존재하지 않습니다.");
        }
    }

    
    @Override
    @Transactional
    public void deleteFacility(FacilityVO vo) {
        FacilityDAO.deleteFacility(vo);
    }

    @Override
    public FacilityVO getFac(FacilityVO vo) {
        return FacilityDAO.getFac(vo);
    }
    
  @Override
  public List<FacilityVO> getFacList(FacilityVO vo) {
      return FacilityDAO.getFacList(vo);
  }

       
    
  }


