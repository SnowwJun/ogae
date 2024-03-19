package com.ogae.user.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ogae.user.board.UserFacilityImgVO;
import com.ogae.user.board.UserFacilityVO;
import com.ogae.user.board.service.UserFacilityImgService;
import com.ogae.user.board.service.UserFacilityService;



@Controller
public class UserFacilityController {
	

	@Autowired
	private UserFacilityImgService FacilityImgService;
	
	@Autowired
	private UserFacilityService FacilityService;
	
	
	@GetMapping("/UserFacility.do")
    public String UserFacilityView(@RequestParam(name = "facility_idx") int facilityIdx,
            UserFacilityVO vo, UserFacilityImgVO imgVo, Model model) {
        UserFacilityVO facility = new UserFacilityVO();
        facility.setFacility_idx(facilityIdx);

        UserFacilityVO getFacViewDetail = FacilityService.getFac(facility);

        UserFacilityImgVO facilityImg = new UserFacilityImgVO();
        facilityImg.setFacility_idx(facilityIdx);
        imgVo.setFacility_idx(facilityIdx);
        List<UserFacilityImgVO> getFacImgList = FacilityImgService.getFacImgList(facilityIdx);
        List<UserFacilityImgVO> imgList = FacilityImgService.getFacImgList(vo.getFacility_idx());

        // 글에 연결된 이미지 정보 가져오기
        // List<FacilityImgVO> img = FacilityImgService.getFacImgList(facilityIdx);

        model.addAttribute("Facility", getFacViewDetail);
        model.addAttribute("getFacImgList", getFacImgList);
        model.addAttribute("imgList", imgList);

        System.out.println("이미지 정보 보기" + getFacImgList);
        System.out.println("정보 보여줘봐" + getFacViewDetail);
        return "facility/UserFacility";
    }
}
		
	

