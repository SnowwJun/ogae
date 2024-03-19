package com.ogae.admin.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ogae.admin.board.ServiceImgVO;
import com.ogae.admin.board.ServiceVO;
import com.ogae.admin.board.service.ServiceImgService;
import com.ogae.admin.board.service.ServiceService;
import com.ogae.common.AwsS3Util;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ServiceController {

	@Autowired
	@Qualifier("serviceServiceImpl")
	private ServiceService serviceService;

	 @Autowired
	 @Qualifier("serviceImgServiceImpl")
	 private ServiceImgService serviceImgService;	
	
	
	//입력내용과 맞는 목차불러오기
	@RequestMapping("/getServiceList.ado")
	public String showServiceList(Model model) {
		log.debug(null);
		List<ServiceVO> serviceList = serviceService.getServiceList(new ServiceVO());
		model.addAttribute("serviceList", serviceList); // noticeList를 모델에 추가
		return "service/getServiceList"; // 뷰 이름을 "notice/getNoticeList"로 설정
	}

	@GetMapping("/insertServiceBoard.ado")
	public String insertServiceBoard() {
		log.debug(null);
		return "service/insertServiceBoard";
//		return "redirect:/getNoticeList.ado";
	}

	@PostMapping("/insertService.ado")
	public String insertService(ServiceVO serviceVO, ServiceImgVO serviceImgVO, MultipartHttpServletRequest request) throws IOException {
			log.debug("service: {}, image: {}", serviceVO, serviceImgVO);	
			serviceService.insertService(serviceVO);
			
			List<MultipartFile> fileList = request.getFiles("imageFile[]");
			// 전송할 파일 존재
			if(fileList.size() > 0) {
				AwsS3Util awsS3 = AwsS3Util.getInstance();
				
				int idx = 0;
				for(MultipartFile file: fileList) {
					// 파일 확장자 추출
					
					String originalFilename = file.getOriginalFilename();
					String ext = "";

					if (originalFilename != null && originalFilename.contains(".")) {
					    ext = originalFilename.substring(originalFilename.lastIndexOf("."));
					}
					
					//String ext = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
					// 전송 파일이름		
					String tempName = createFileName(++idx) + ext;
					String uploadFileName = request.getServletContext().getRealPath("/") + tempName;

					// S3에 저장할 파일 생성
					File uploadFile = new File(uploadFileName);
					file.transferTo(uploadFile);
					
					// S3 저장 폴더명 + 파일명
					String s3File = "upload/service/" + tempName;
					awsS3.upload(uploadFile, s3File);				
					System.err.println("--------idx: " + "https://ogae-dog.s3.ap-northeast-2.amazonaws.com/" + s3File);
					// 업로드 성공 테스트 
					// ie 주소창에 https://ogae-dog.s3.ap-northeast-2.amazonaws.com/ + s3File
					ServiceImgVO imgVO = new ServiceImgVO();
					imgVO.setImg_path(s3File);
					imgVO.setService_idx(serviceVO.getService_idx());
					serviceImgService.insertServiceImg(imgVO);
					
				}
			}		
			return "redirect:/getServiceList.ado";
		}
		
	
	// 23.11.14 물어보기 왜 idx 값을 별도로 받아오는지 vo 객체가 아닌
	
	@GetMapping("/getServiceView.ado")
	public String getServiceView(@RequestParam("service_idx") int serviceIdx, ServiceVO vo, ServiceImgVO imgVo, Model model) {
		// noticeIdx를 사용해서 해당 공지사항 정보를 가져옴
		ServiceVO service = new ServiceVO();
		service.setService_idx(serviceIdx);
		//1204 주석 취소
		ServiceVO serviceDetail = serviceService.getService(service);

		
		List<ServiceImgVO> getServiceImgList = serviceImgService.getServiceImgList(vo.getService_idx());
		ServiceImgVO serviceImg = new ServiceImgVO();
		   serviceImg.setImg_idx(serviceIdx);
		  
		
		// 가져온 정보를 모델에 담아서 뷰로 전달
		model.addAttribute("service", serviceDetail);
		model.addAttribute("getServiceImgList", getServiceImgList);
		return "service/getServiceView";
		
	}


	@GetMapping("/deleteService.ado")
	public String deleteService(@RequestParam("service_idx") int serviceIdx) {
		// 공지사항을 삭제하는 작업을 수행 (noticeIdx를 사용하여 삭제)
		ServiceVO service = new ServiceVO();
		service.setService_idx(serviceIdx);

		serviceService.deleteService(service);

		// 삭제 후 목록 페이지로 리다이렉트
		return "redirect:/getServiceList.ado";
	}
	
	
	@GetMapping("/updateServiceBoard.ado")
	public String updateServiceBoard(ServiceVO vo, Model model) {

		//기존내용 가져옴
		ServiceVO service = serviceService.getService(vo);
		
		//모델에 공지사항 정보 추가
		model.addAttribute("service", service);
		System.out.println("===>공지사항 수정");
		return "service/updateServiceBoard";
	}
	
	@PostMapping("/updateServiceBoard.ado")
	public String updateService(ServiceVO vo) {
		System.out.println("수정완료");
		System.out.println(vo.toString());
		
	    
		serviceService.updateService(vo);
		return "redirect:/getServiceView.ado?service_idx=" + vo.getService_idx();
	}
	
////	 231123 수정 권유진======================================================================================
////	 이미지 업로드를 위한 MutiparFile 인터페이스 사용
//	@PostMapping("/insertBoard.ado")
//	@Transactional
//	public String insertBoard(ServiceVO serviceVO, ServiceImgVO serviceImgVO, MultipartHttpServletRequest request) throws IOException {
//		log.debug("service: {}, image: {}", serviceVO, serviceImgVO);	
//		
//		List<MultipartFile> fileList = request.getFiles("imageFile[]");
//		// 전송할 파일 존재
//		if(fileList.size() > 0) {
//			AwsS3Util awsS3 = AwsS3Util.getInstance();
//			
//			int idx = 0;
//			for(MultipartFile file: fileList) {
//				// 파일 확장자 추출
//				
//				String originalFilename = file.getOriginalFilename();
//				String ext = "";
//
//				if (originalFilename != null && originalFilename.contains(".")) {
//				    ext = originalFilename.substring(originalFilename.lastIndexOf("."));
//				}
//				
//				//String ext = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
//				// 전송 파일이름		
//				String tempName = createFileName(++idx) + ext;
//				String uploadFileName = request.getServletContext().getRealPath("/") + tempName;
//
//				// S3에 저장할 파일 생성
//				File uploadFile = new File(uploadFileName);
//				file.transferTo(uploadFile);
//				
//				// S3 저장 폴더명 + 파일명
//				String s3File = "upload/service/" + tempName;
//				awsS3.upload(uploadFile, s3File);				
//				System.err.println("--------idx: " + "https://ogae-dog.s3.ap-northeast-2.amazonaws.com/" + s3File);
//				// 업로드 성공 테스트 
//				// ie 주소창에 https://ogae-dog.s3.ap-northeast-2.amazonaws.com/ + s3File
//				ServiceImgVO imgVO = new ServiceImgVO();
//				imgVO.setImg_path(s3File);
//				imgVO.setService_idx(serviceVO.getService_idx());
//				serviceImgService.insertServiceImg(imgVO);
//				
//			}
//		}		
//		return "service/getServiceList";
//	}
	
	private String createFileName(int index) {

		Calendar cal = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmSS");
		return dateFormat.format(cal.getTime()) + String.format("%03d", index); 
	}
	// ========================================================================================
	
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

	
	
}
