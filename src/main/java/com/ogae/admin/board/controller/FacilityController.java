package com.ogae.admin.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ogae.admin.board.FacilityImgVO;
import com.ogae.admin.board.FacilityVO;
import com.ogae.admin.board.service.FacilityImgService;
import com.ogae.admin.board.service.FacilityService;
import com.ogae.common.AwsS3Util;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class FacilityController {
	
	@Autowired
	private FacilityService FacilityService;
	
	
	@Autowired
	private FacilityImgService FacilityImgService;
	
	private AwsS3Util awsS3;
	private String awsS3URL = "https://ogae-dog.s3.ap-northeast-2.amazonaws.com/";
	

  
	// 생성자를 통한 의존성 주입
    public FacilityController(FacilityService FacilityService, FacilityImgService FacilityImgService) {
        this.FacilityService = FacilityService;
        this.FacilityImgService = FacilityImgService;
    }

	
	// 입력내용과 맞는 목차 불러오기
		@RequestMapping("/getFacList.ado")
		public String showFacList(Model model) {
			System.out.println("===>BoardController getFacList");
			List<FacilityVO> getFacList = FacilityService.getFacList(new FacilityVO());
			List<FacilityImgVO> getFacImgList = FacilityImgService.getFacImgList(new FacilityImgVO());

			model.addAttribute("getFacList", getFacList); // roomsList를 모델에 추가
			model.addAttribute("getFacImgList", getFacImgList);
			return "facility/getFacList";
		}



@GetMapping("/insertFacility.ado")
public String insertFacilityView() {
	System.out.println("===> Controller FacilityinsertView");
	return "facility/insertFacility";
}


// 이미지 업로드를 위한 MutiparFile 인터페이스 사용
//2023-11-23일 추가 
@PostMapping("/insertFaclility.ado")
public String insertFacility(FacilityVO facilityVO, MultipartHttpServletRequest request) throws IOException {
	log.debug("facility: {}", facilityVO);	
	
	FacilityService.insertFacility(facilityVO);

	List<MultipartFile> fileList = request.getFiles("imageFile[]");
	// 전송할 파일 존재
	if(fileList.size() > 0) {
		awsS3 = AwsS3Util.getInstance();
		
		int idx = 0;
		for(MultipartFile file: fileList) {
			// 파일 확장자 추출
			String ext = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			// 전송 파일이름
			String tempName = createFileName(++idx) + ext;
			String uploadFileName = request.getServletContext().getRealPath("/") + tempName;

			// S3에 저장할 파일 생성
			File uploadFile = new File(uploadFileName);
			file.transferTo(uploadFile);
			
			// S3 저장 폴더명 + 파일명
			String s3File = "upload/facility/" + tempName;
			awsS3.upload(uploadFile, s3File);				
			System.err.println("--------idx: " + "https://ogae-dog.s3.ap-northeast-2.amazonaws.com/" + s3File);
			// 업로드 성공 테스트 
			// ie 주소창에 https://ogae-dog.s3.ap-northeast-2.amazonaws.com/ + s3File
			
			
////			 231123 작업 필요 -> 객실 이미지 테이블에 이미지 정보 삽입
			FacilityImgVO imgVO = new FacilityImgVO();
			imgVO.setImg_path(s3File);
			imgVO.setFacility_idx(facilityVO.getFacility_idx());
			FacilityImgService.insertFacilityImg(imgVO);
		}
	}
	
	return "redirect:/getFacList.ado";
}
/**
 * 파일이름 생성
 * @return 생성된 파일이름
 */
private String createFileName(int index) {

	Calendar cal = Calendar.getInstance();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmSS");
	return dateFormat.format(cal.getTime()) + String.format("%03d", index); 
}


private String uploadImage(MultipartFile imageFile, String imageName) {

	String uploadPath = "/path/to/upload/folder/";
	String imagePath = uploadPath + imageName;

	try {
		// 지정한 경로에 파일 저장
		imageFile.transferTo(new File(imagePath));
	} catch (IOException e) {
		// 이미지 업로드에 실패한 경우 예외처리
		e.printStackTrace();
	}
	return imagePath;
}



@GetMapping("/deleteFacility.ado")
public String deleteFacility(@RequestParam("facility_idx") int facilityIdx, FacilityVO vo, FacilityImgVO imgVo) {
    // 부가시설 이미지 정보 가져오기
    List<FacilityImgVO> imgList = FacilityImgService.getFacImgList(imgVo);

    awsS3 = AwsS3Util.getInstance();
    
    // 이미지 리스트가 비어있지 않은 경우에만 처리
    System.out.println(imgList);
    
    
    // S3 서버에 업로드된 기존 파일 삭제
    if (imgList != null && !imgList.isEmpty()) {
        for (FacilityImgVO img : imgList) {
        	System.out.println("------ " + img.getImg_path());
            String s3Key = img.getImg_path(); // 파일 경로를 키로 변환
            awsS3.delete(s3Key);
            
            // DB에서 이미지 정보 삭제
            FacilityImgService.deleteFacilityImg(img);
        }
    }

    // 부가시설 삭제
    vo.setFacility_idx(facilityIdx);
    FacilityService.deleteFacility(vo);

    System.out.println("DeleteFacility 작동");
    return "redirect:/getFacList.ado";
}






@GetMapping("/updateFacility.ado")
public String updateFacility(@RequestParam("facility_idx") int facilityIdx, FacilityVO vo, FacilityImgVO imgVo, Model model) {
   FacilityVO facility = new FacilityVO();
   facility.setFacility_idx(facilityIdx);
   
   FacilityVO updateFacility = FacilityService.getFac(facility);

   FacilityImgVO facilityImg = new FacilityImgVO();
   facilityImg.setImg_idx(facilityIdx);
   List<FacilityImgVO> getFacImgList = FacilityImgService.getFacImgList(vo.getFacility_idx());


   model.addAttribute("Facility", updateFacility);
   model.addAttribute("getFacImgList", getFacImgList);

   return "facility/updateFacility";
}
@PostMapping("/updateFacility.ado")
public String updateFacility(FacilityVO vo, FacilityImgVO imgVo, MultipartHttpServletRequest request) throws IOException {
    log.debug("Facility: {}", vo);
    log.debug("Facility_img: {}", imgVo);

    awsS3 = AwsS3Util.getInstance();
    // 기존 이미지 정보 가져오기
    List<FacilityImgVO> imgList = FacilityImgService.getFacImgList(vo.getFacility_idx());

    System.out.println("기존: " + imgList);
 
    
    // S3 서버에 업로드된 기존 파일 삭제
    if (imgList != null && !imgList.isEmpty()) {
        for (FacilityImgVO img : imgList) {
        	System.out.println("------ " + img.getImg_path());
            String s3Key = img.getImg_path(); // 파일 경로를 키로 변환
            awsS3.delete(s3Key);
            
            // DB에서 이미지 정보 삭제
            FacilityImgService.deleteFacilityImg(img);
        
        }
    }
    List<MultipartFile> fileList = request.getFiles("imageFile[]");
  
    // 전송할 파일 존재
    if (fileList.size() > 0) {

        for (int idx = 0; idx < fileList.size(); idx++) {
            MultipartFile file = fileList.get(idx);

            // 파일 확장자 추출
            String ext = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));

            // 전송 파일 이름
            String tempName = createFileName(idx + 1) + ext;
            String uploadFileName = request.getServletContext().getRealPath("/") + tempName;

            // S3에 저장할 파일 생성
            File uploadFile = new File(uploadFileName);
            file.transferTo(uploadFile);

            // S3 저장 폴더명 + 파일명
            String s3File = "upload/facility/" + tempName;
            awsS3.upload(uploadFile, s3File);
            System.err.println("--------idx: " + awsS3URL + s3File);
            
            System.err.println("=========================: " + vo.getFacility_idx());
            
            // 이미지 정보 업데이트 또는 삽입
            FacilityImgVO newImg = new FacilityImgVO();
            newImg.setImg_path(s3File);
            newImg.setFacility_idx(vo.getFacility_idx());

            FacilityImgService.insertFacilityImg(newImg); // 기존 이미지가 삭제된 경우에도 삽입으로 변경
            System.out.println("업데이트했습니다: " + newImg);
            
//            FacilityImgService.updateFacilityImg(newImg);
        }
    }

    // 시설 정보 업데이트
    FacilityService.updateFacility(vo);
    
    return "redirect:/getFacList.ado";
}

@GetMapping("/getFacViewDetail.ado")
public String getFacViewDetailView(@RequestParam("facility_idx") int facilityIdx, FacilityVO vo, FacilityImgVO imgVo, Model model) {
   FacilityVO facility = new FacilityVO();
   facility.setFacility_idx(facilityIdx);
   
   FacilityVO getFacViewDetail = FacilityService.getFac(facility);

   FacilityImgVO facilityImg = new FacilityImgVO();
   facilityImg.setImg_idx(facilityIdx);
   List<FacilityImgVO> getFacImgList = FacilityImgService.getFacImgList(vo.getFacility_idx());

   
   //글에 연결된 이미지 정보 가져오기
  // List<FacilityImgVO> img = FacilityImgService.getFacImgList(facilityIdx);

   model.addAttribute("Facility", getFacViewDetail);
   model.addAttribute("getFacImgList", getFacImgList);

   return "facility/getFacViewDetail";
}

}

   