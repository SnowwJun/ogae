package com.ogae.admin.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ogae.admin.board.EventImgVO;
import com.ogae.admin.board.EventVO;
import com.ogae.admin.board.Pagination;
import com.ogae.admin.board.service.EventImgService;
import com.ogae.admin.board.service.EventService;
import com.ogae.common.AwsS3Util;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller // 컨트롤러 빈으로 등록
public class EventController {
	
	@Autowired
	private EventService eventService;
	@Autowired
	private EventImgService eventImgService;
    private AwsS3Util awsS3;
    private String awsS3Url = "https://ogae-dog.s3.ap-northeast-2.amazonaws.com/";
	
	/** 글 등록 */
	@GetMapping("/insertEvent.ado")
	public String insertEvent() {
		System.out.println("insertEvent Form으로 이동");
		return "event/insertEvent";
	}
	@PostMapping("/insertEvent.ado")
	public String insertEvent(EventVO vo, MultipartHttpServletRequest request) throws IOException {
		log.debug("event: {}", vo);
		
		// 이벤트 등록 시 현재 시간을 수정일로 설정
	    vo.setRegDate(new Date());
	    
		// 이벤트 테이블에 이벤트 관련 컬럼 값 삽입
 		eventService.insertEvent(vo);
		
		List<MultipartFile> fileList = request.getFiles("imageFile[]");
		   // 전송할 파일 존재
		   if(fileList.size() > 0) {
		      awsS3 = AwsS3Util.getInstance();
		      
		      int idx = 0;
		      for(MultipartFile file: fileList) {
		         // 파일 확장자 추출
		         String ext = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		         
		         // 전송 파일 이름
		         String tempName = createFileName(++idx) + ext;
		         String uploadFileName = request.getServletContext().getRealPath("/") + tempName;

		         // S3에 저장할 파일 생성
		         File uploadFile = new File(uploadFileName);
		         file.transferTo(uploadFile);
		         
		         // S3 저장 폴더명 + 파일명
		         String s3File = "upload/event/" + tempName;
		         awsS3.upload(uploadFile, s3File);            
		         System.err.println("--------idx: " + awsS3Url + s3File);
		         // 업로드 성공 테스트 
		         // ie 주소창에 https://ogae-dog.s3.ap-northeast-2.amazonaws.com/ + s3File
		         
		        // 이벤트 이미지 테이블에 이미지 정보 삽입
		        EventImgVO imgVo = new EventImgVO();
		        imgVo.setPath(s3File);
		        imgVo.setIdx(vo.getIdx());
		        eventImgService.insertEventImg(imgVo);
		      }
		   }
		   return "redirect:/getEventList.ado";
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
	   
   /** 등록 시임시저장 */
   @PostMapping("/saveTempEvent.ado")
   @ResponseBody
   public String saveTempEvent(@RequestBody EventVO vo) {
	   System.out.println("임시저장");
	   eventService.insertEvent(vo);

	   System.out.println("Temp event saved successfully");
	   return "redirect:/getEventList.ado";
   }
   
	/** 글 수정  */
	@GetMapping("/updateEvent.ado")
	public String updateEventView(EventVO vo, Model model) {
		System.out.println("updateEvent Form으로 이동");
		
		// EventVO 정보 가져오기
		EventVO event = eventService.getEvent(vo);
		
		// EventImgVO 정보 가져오기
	    EventImgVO img = eventImgService.getEventImg(vo.getIdx());

		System.out.println(event.toString());
		model.addAttribute("event", event);
		model.addAttribute("img", img);
		
		return "event/updateEvent";
	}
	
	@PostMapping("/updateEvent.ado")
	public String updateEvent(@ModelAttribute("event") EventVO vo, EventImgVO imgVo, MultipartHttpServletRequest request) throws IOException {
		log.debug("event: {}", vo);	
		log.debug("event_img: {}", imgVo);

		// 기존 이미지 정보 가져오기
		EventImgVO img = eventImgService.getEventImg(vo.getIdx());
	
        System.out.println("기존: " + img);

        // S3 서버에 업로드된 기존 파일 삭제
        if (img != null) {
            awsS3.delete(img.getPath());
        }

        List<MultipartFile> fileList = request.getFiles("imageFile[]");
        
	    // 전송할 파일 존재
	    if (fileList.size() > 0) {
        awsS3 = AwsS3Util.getInstance();

        int idx = 0;
        for (MultipartFile file : fileList) {
             // 파일 확장자 추출
             String ext = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));

             // 전송 파일 이름
             String tempName = createFileName(++idx) + ext;
             String uploadFileName = request.getServletContext().getRealPath("/") + tempName;

             // S3에 저장할 파일 생성
             File uploadFile = new File(uploadFileName);
             file.transferTo(uploadFile);

             // S3 저장 폴더명 + 파일명
             String s3File = "upload/event/" + tempName;
             awsS3.upload(uploadFile, s3File);
             System.err.println("--------idx: " + awsS3Url + s3File);

             // 이벤트 정보 업데이트 또는 삽입
             if (img != null) {
                 img.setIdx(vo.getIdx());
                 img.setPath(s3File);
                 eventImgService.updateEventImg(img);
             } else {
                 // 이미지 정보가 없을 경우 신규로 생성하여 등록
            	EventImgVO newImg = new EventImgVO();
            	newImg.setPath(s3File);
            	newImg.setIdx(vo.getIdx());
 		    	eventImgService.insertEventImg(newImg);
 		    	System.out.println("업데이트했습니다: " + newImg);
             }
             System.out.println("업데이트했습니다: " + img);
		   }
        }
	    // 이벤트 정보 업데이트
	    vo.setModyDate(new Date()); // 수정 시간 설정
	    eventService.updateEvent(vo);
		    
        return "redirect:/getEventList.ado";
    }
	
	/** 수정 시 임시저장 */
   @PostMapping("/saveTempEventUpdate.ado")
   @ResponseBody
   public String saveTempEventUpdate(@RequestBody EventVO vo) {
	   System.out.println("임시저장");
	   eventService.updateEvent(vo);

	   System.out.println("Temp event saved successfully");
	   return "redirect:/getEventList.ado";
   }
	
	/** 글 삭제 */
	@GetMapping("/deleteEvent.ado")
	public String deleteEvent(EventVO vo, EventImgVO imgVo) {
	    
		// 이벤트 이미지 정보 가져오기
		EventImgVO img = eventImgService.getEventImg(imgVo);

	    // S3에서 이미지 삭제
	    if (img != null) {
	        awsS3.delete(img.getPath());
	    }
	    
	    // 이벤트 이미지를 참조하는 레코드 삭제
	    eventImgService.deleteEventImg(imgVo);

	    // 이벤트 삭제
	    eventService.deleteEvent(vo);
	    
		return "redirect:/getEventList.ado";
	}
	/** 글 상세 조회 */
	@RequestMapping("/getEvent.ado")
	public String getEvent(EventVO vo, EventImgVO imgVo, Model model) {
		System.out.println("getEvent Form으로 이동");
		
		// 글 상세 정보 가져오기
		EventVO event = eventService.getEvent(vo);
		model.addAttribute("event", event);
		
		// 글에 연결된 이미지 정보 가져오기
		EventImgVO img = eventImgService.getEventImg(vo.getIdx());
		model.addAttribute("img", img);
		
		// 현재 글 기준으로 이전 글, 다음 글 정보 가져오기
		EventVO prevNext = eventService.prevNext(vo);
		model.addAttribute("prevNext", prevNext);

		 return "event/getEvent";
	}
	
	/** 글 목록 조회 */
	@RequestMapping("/getEventList.ado")
	public String getEventList(EventVO vo, Model model,
			@RequestParam(required = false, defaultValue = "1") int page, 
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "") String searchCondition,
			@RequestParam(required = false, defaultValue = "") String searchKeyword) {
		// 검색 조건이 있는지 확인하여 EventVO에 설정
		EventVO searchVO = new EventVO();
	    if (searchCondition != null && searchKeyword != null) {
	        searchVO.setSearchCondition(searchCondition);
	        searchVO.setSearchKeyword(searchKeyword);
	    }
		
		// 게시글 수 조회
	    int listCnt = eventService.getSearchEventListCnt(searchCondition, searchKeyword);
	    
	    // 페이징 정보 설정
	    Pagination pagination = new Pagination();
	    pagination.pageInfo(page, range, listCnt);

	    // 페이징된 리뷰 리스트 가져오기
	    List<EventVO> eventList = eventService.getSearchEventList(searchCondition, searchKeyword, pagination);

	    // 모델에 속성 추가
	    model.addAttribute("pagination", pagination);
	    model.addAttribute("eventList", eventList);
	    System.out.println(pagination.toString());
	    System.out.println(eventList.toString());
	    return "event/getEventList";
	}
}
