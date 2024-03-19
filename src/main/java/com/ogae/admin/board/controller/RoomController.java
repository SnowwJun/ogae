package com.ogae.admin.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ogae.admin.board.NoticeVO;
import com.ogae.admin.board.RoomImgVO;
import com.ogae.admin.board.RoomItemDAO;
import com.ogae.admin.board.RoomItemVO;
import com.ogae.admin.board.RoomVO;
import com.ogae.admin.board.service.RoomImgService;
import com.ogae.admin.board.service.RoomItemService;
import com.ogae.admin.board.service.RoomService;
import com.ogae.common.AwsS3Util;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class RoomController {

	@Autowired
	private RoomService roomService;

	@Autowired
	private RoomImgService roomImgService;

	@Autowired
	private RoomItemService roomItemService;

	@Autowired
	private RoomItemDAO roomItemDAO;

	private AwsS3Util awsS3;
	private String awsS3URL = "https://ogae-dog.s3.ap-northeast-2.amazonaws.com/";

	// 입력내용과 맞는 목차 불러오기
	@RequestMapping("/getRoomList.ado")
	public String showRoomsList(Model model, RoomVO vo, RoomItemVO roomItemvo, RoomImgVO roomImgvo) {
		System.out.println("===>BoardController getRoomList");

		List<RoomVO> roomsList = roomService.getRoomList(vo);
		List<RoomImgVO> roomImgList = roomImgService.getRoomImgList(roomImgvo);
		List<RoomItemVO> roomItemList = roomItemService.getRoomItemList(roomItemvo);

		model.addAttribute("roomList", roomsList); // roomsList를 모델에 추가
		model.addAttribute("roomImgList", roomImgList);
		model.addAttribute("roomItemList", roomItemList);
		return "room/getRoomList";
	}

	// 객실등록
	@GetMapping("/insertRoom.ado")
	public String insertRoomView() {
		System.out.println("===>insertRoom");
		return "room/insertRoom";
	}

	/* 11.21 추가 */
	@PostMapping("/insertRoomReg.ado")
	public String insertRoom(RoomVO roomVO, @RequestParam(name = "roomItems", required = false) String[] selectedItems,
			RoomItemDAO roomItemDAO, MultipartHttpServletRequest request) throws IOException {
		log.debug("room: {}, item: {}", roomVO, Arrays.toString(selectedItems));
		roomVO.setRoom_item_idx(StringUtils.arrayToCommaDelimitedString(selectedItems));

		// 선택한 아이템 값 사용
		System.out.println("선택한 아이템: " + selectedItems);
		roomService.insertRoom(roomVO);

		List<MultipartFile> fileList = request.getFiles("imageFile[]");
		System.out.println(fileList);

		// 전송할 파일 존재
		if (fileList.size() > 0) {
			awsS3 = AwsS3Util.getInstance();
			System.out.println(awsS3);

			int idx = 0;
			for (MultipartFile file : fileList) {
				// 파일 확장자 추출
				String ext = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
				// 전송 파일이름
				String tempName = createFileName(++idx) + ext;
				String uploadFileName = request.getServletContext().getRealPath("/") + tempName;

				// S3에 저장할 파일 생성
				File uploadFile = new File(uploadFileName);
				file.transferTo(uploadFile);

				// S3 저장 폴더명 + 파일명
				String s3File = "upload/room/" + tempName;

				try {
					awsS3.upload(uploadFile, s3File);
					System.err.println("--------idx: " + "https://ogae-dog.s3.ap-northeast-2.amazonaws.com/" + s3File);
				} catch (Exception e) {
					e.printStackTrace();
				}
				// 업로드 성공 테스트
				// ie 주소창에 https://ogae-dog.s3.ap-northeast-2.amazonaws.com/ + s3File

				// 231123 작업 필요 -> 객실 이미지 테이블에 이미지 정보 삽입
				RoomImgVO imgVO = new RoomImgVO();
				imgVO.setImg_path(s3File);
				imgVO.setRoom_idx(roomVO.getRoom_idx());
				roomImgService.insertRoomImg(imgVO);
			}
		}
		return "redirect:/getRoomList.ado";

	}

	// 231123 수정 권유진 추가
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

	/* 11.21 추가 */
	@GetMapping("/getRoomView.ado")
	public String getRoomView(@RequestParam("room_idx") int roomIdx, RoomVO vo,
			@RequestParam("room_item_idx") String roomItemIdx, RoomImgVO roomImgVO, RoomItemVO roomItemVO,
			Model model) {
		log.debug("===>객실 상세 정보 조회");
		try {
			List<RoomImgVO> getRoomImgList = roomImgService.getRoomImgList(vo.getRoom_idx());

			RoomVO roomDetail = roomService.getRoom(vo);

			List<RoomItemVO> roomItemList = roomItemService.getRoomItemList(roomItemIdx);

//			String roomItemName = roomItemList.isEmpty() ? "" : roomItemList.get(0).getRoom_item_name();
//			model.addAttribute("setRoom_item_name", roomItemName);
			RoomVO roomItemNames = roomService.getRoomWithItemName(roomIdx);
			System.out.println("아이템얍!" + roomItemNames);

			// 이미지 목록을 가져와서 모델에 추가
			List<RoomImgVO> roomImgList = roomImgService.getRoomImgList(new RoomImgVO());
			model.addAttribute("roomImgList", roomImgList);

			// jsp로 전달
			model.addAttribute("room", roomDetail);
			model.addAttribute("getRoomImgList", getRoomImgList);
			model.addAttribute("roomItemIdx", roomItemNames.getRoom_item_names());

			log.debug("room: {}", roomDetail);
			log.debug("image: {}", getRoomImgList);

		} catch (Exception e) {
			log.error("객실 정보 조회 중 오류 발생", e);
		}
		return "room/getRoomView";
	}

	// 객실삭제
	@GetMapping("/deleteRoom.ado")
	public String deleteRooms(@RequestParam("room_idx") int room_idx, RoomVO vo, RoomImgVO imgVO) {
		System.out.println("----> 객실 삭제 진행");

		// 객실 이미지 정보 가져오기
		List<RoomImgVO> roomImgList = roomImgService.getRoomImgList(imgVO);
		awsS3 = AwsS3Util.getInstance();

		// 이미지 리스트가 비어있지 않은 경우에만 처리
		System.out.println(roomImgList);

		// S3 서버에 업로드된 기존 파일 삭제
		if (roomImgList != null && !roomImgList.isEmpty()) {
			for (RoomImgVO img : roomImgList) {
				System.out.println("----- " + img.getImg_path());

				// 파일 경로를 키로 변환
				String s3Key = img.getImg_path();
				awsS3.delete(s3Key);

				roomImgService.deleteRoomImg(img);
			}
		}

		log.debug("이미지: " + roomImgList);

		RoomVO room = new RoomVO();
		room.setRoom_idx(room_idx);
		log.debug("객실번호: " + vo);

		roomService.deleteRoom(vo);

		// 삭제 후 목록 페이지로 리다이렉트
		return "redirect:/getRoomList.ado";
	}

	// 객실 수정
	@GetMapping("/updateRoom.ado")
	public String updateRoom(@RequestParam("room_idx") int room_idx, @RequestParam(name = "roomItems", required = false) String[] selectedItems,
			RoomVO vo, RoomItemVO itemVO, RoomImgVO imgVO, Model model) {

		System.out.println("===>객실 정보 수정 시작");

		// 기존내용 가져옴
		RoomVO roomDetail = roomService.getRoom(vo);
		System.out.println("객실정보===>" + roomDetail);

		awsS3 = AwsS3Util.getInstance();

		List<RoomItemVO> roomItem = roomItemService.getRoomItemList(vo.getRoom_item_idx());
		System.out.println("객실아이템===> " + roomItem);

		List<RoomImgVO> roomImgList = roomImgService.getRoomImgList(vo.getRoom_idx());
		System.out.println("객실이미지===> " + roomImgList);

		model.addAttribute("room", roomDetail);
		model.addAttribute("roomItem", roomItem);
		model.addAttribute("roomImgList", roomImgList);

		System.out.println("==>객실 정보수정");
		return "room/updateRoom";
	}

	@Transactional
	@PostMapping("/updateRoom.ado")
	public String updateRoomInfo(@RequestParam("room_idx") int room_idx, RoomVO vo, @RequestParam(name = "roomItems", required = false) String[] selectedItems,
			RoomItemDAO roomItemDAO, RoomImgVO imgVO, MultipartHttpServletRequest request)
			throws IOException {

		roomService.getRoom(vo);
		log.debug("Room(객실): {}" + vo);
		
		List<RoomItemVO> roomItem = roomItemService.getRoomItemList(vo.getRoom_item_idx());
		vo.setRoom_item_idx(StringUtils.arrayToCommaDelimitedString(selectedItems));
		System.out.println("선택한 아이템: " + selectedItems);

		RoomVO roomDetail = roomService.getRoom(vo);
		System.out.println("객실정보===>" + roomDetail);

		awsS3 = AwsS3Util.getInstance();
		// 기존 이미지 정보 가져오기
		List<RoomImgVO> imgList = roomImgService.getRoomImgList(vo.getRoom_idx());

		System.out.println("===>이미지 정보 가져오기" + imgList);

		// S3서버에 업로드된 기존 파일 삭제
		if (imgList != null && !imgList.isEmpty()) {
			for (RoomImgVO img : imgList) {
				System.out.println("-----" + img.getImg_path());

				// 파일경로를 키로 변환
				String s3Key = img.getImg_path();
				awsS3.delete(s3Key);

				// DB에서 이미지 정보 삭제
				roomImgService.deleteRoomImg(img);
			}
		}
		
		System.out.println("이미지 삭제 완료");
		
		List<MultipartFile> fileList = request.getFiles("imageFile[]");
		System.out.println("이미지 사이즈: " + (fileList != null ? fileList.size() : 0 ));

		
		// 전송할 파일 존재
		if (fileList.size() > 0) {
			awsS3 = AwsS3Util.getInstance();
			System.out.println("여기까지" + awsS3);

			int idx = 0;
			for (MultipartFile file : fileList) {
				
				// 파일 확장자 추출
				String ext = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
				
				// 전송 파일이름
				String tempName = createFileName(++idx) + ext;
				String uploadFileName = request.getServletContext().getRealPath("/") + tempName;

				// S3에 저장할 파일 생성
				File uploadFile = new File(uploadFileName);
				file.transferTo(uploadFile);

				// S3 저장 폴더명 + 파일명
				String s3File = "upload/room/" + tempName;
				
				System.out.println("tempName===>" + tempName);
				try {
					awsS3.upload(uploadFile, s3File);
					System.err.println("--------idx: " + "https://ogae-dog.s3.ap-northeast-2.amazonaws.com/" + s3File);
				} catch (Exception e) {
					e.printStackTrace();
				}
							
				// 업로드 성공 테스트
				// ie 주소창에 https://ogae-dog.s3.ap-northeast-2.amazonaws.com/ + s3File

				//이미지 정보 업데이트 또는 삽입
				RoomImgVO newImg = new RoomImgVO();
				newImg.setImg_path(s3File);
				newImg.setRoom_idx(vo.getRoom_idx());
				
				roomImgService.insertRoomImg(newImg);
				System.out.println("이미지 업데이트 성공" + newImg);
			}

		}

		roomService.updateRoom(vo);
		System.out.println("===>객실 정보 수정 완료");

		return "redirect:/getRoomList.ado";
	}

	/* 11.17 추가 */
	// 객실아이템 등록하는 화면으로 이동
	@GetMapping("/getItemList.ado")
	public String insertItem() {
		System.out.println("===>insertItem");
		return "room/getItemList";
	}

	/* 11.19 추가 */
	// 객실아이템 등록
	@PostMapping("/insertRoomItem.ado")
	@ResponseBody
	public String insertRoomItem(RoomItemVO vo) {
		try {
			log.debug("Received RoomItemVO: {}", vo);
			roomItemService.insertRoomItem(vo);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/* 화면에 DB에 등록한 목록 불러오기(11.20 추가) */
	@RequestMapping(value = "/getRoomItems.ado", produces = "application/json")
	@ResponseBody
	public String getRoomItems() throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		List<RoomItemVO> itemList = roomItemService.getAllRoomItems();
		return mapper.writeValueAsString(itemList).toString();
	}
	
	@GetMapping("/deleteRoomItem.ado")
	@ResponseBody
	public String deleteItem(@RequestParam("room_item_idx") String itemIdx) {
		
		RoomItemVO itemVO = new RoomItemVO();
		itemVO.setRoom_item_idx(itemIdx);
	
		System.out.println("aaaaaaaa: " + itemIdx);
	    try {
	        // 서비스 또는 DAO를 호출하여 데이터베이스에서 항목 삭제
	        roomItemService.deleteRoomItem(itemIdx);
	        System.out.println("ddddd: " + itemIdx);
	        return "success"; // 성공 시 어떤 응답이라도 반환할 수 있습니다
	    } catch (Exception e) {
	        log.error("항목 삭제 오류", e);
	        return "error";
	    }
	}
	

	
//	@PostMapping("/updateRoomItem.ado")
//	@ResponseBody
//    public String updateRoomItem
//        try {
//            // 서비스를 통해 아이템 업데이트
//            roomItemService.updateRoomItem(itemVO);
//            return "redirect:/getRoomList.ado";
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//	
	
}
