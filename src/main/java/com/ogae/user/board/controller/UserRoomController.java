package com.ogae.user.board.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ogae.admin.board.service.RoomImgService;
import com.ogae.common.AwsS3Util;
import com.ogae.user.board.UserRoomImgVO;
import com.ogae.user.board.UserRoomItemVO;
import com.ogae.user.board.UserRoomVO;
import com.ogae.user.board.service.UserRoomImgService;
import com.ogae.user.board.service.UserRoomItemServ;
import com.ogae.user.board.service.UserRoomService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class UserRoomController {
	@Autowired
	private UserRoomService userRoomService;

	@Autowired
	private UserRoomItemServ userRoomItemService;

	@Autowired
	private UserRoomImgService userRoomImgService;

	@Autowired
	private RoomImgService roomImgService;

	private AwsS3Util awsS3;
	private String awsS3URL = "https://ogae-dog.s3.ap-northeast-2.amazonaws.com/";

	@GetMapping("/rooms.do")
	public String getRoomList(Model model, UserRoomImgVO userRoomImgvo) {
		List<UserRoomVO> userRoomList = userRoomService.getRoomList(new UserRoomVO());
		List<UserRoomImgVO> roomImgList = userRoomImgService.getRoomImgList(new UserRoomImgVO());

		model.addAttribute("userRoomList", userRoomList);
		model.addAttribute("roomImgList", roomImgList);
		System.out.println("이미지정보===>" + roomImgList);
		return "room/rooms";
	}

	@GetMapping("roomDetail.do")
	public String roomDetail(@RequestParam("room_idx") int roomIdx, UserRoomVO vo,
			@RequestParam("room_item_idx") String roomItemIdx, UserRoomImgVO userRoomImgVO,
			UserRoomItemVO userRoomItemVO, Model model) {
		log.debug("===>객실 상세 정보 조회");
		try {
//			List<UserRoomVO> getRoom = userRoomService.getRoom(vo);
			
			UserRoomVO roomDetail = userRoomService.getRoom(vo);
			System.out.println("객실아" + roomDetail);
			
			
			 // 이전객실, 다음객실
			UserRoomVO prevRoom = userRoomService.getPrevRoom(roomIdx);
			UserRoomVO nextRoom = userRoomService.getNextRoom(roomIdx);
			List<UserRoomVO> otherRooms = userRoomService.getOtherRooms(roomIdx);

			 // 객실 아이템 정보 조회	
			List<UserRoomItemVO> roomItemList = userRoomItemService.getRoomItemList(userRoomItemVO);
			model.addAttribute("roomItemList", roomItemList);

			// 이미지 목록을 가져와서 모델에 추가
			List<UserRoomImgVO> roomImgList = userRoomImgService.getRoomImgList(userRoomImgVO);
			model.addAttribute("roomImgList", roomImgList);
			

			UserRoomVO roomItemNames = userRoomService.getRoomWithItemName(roomIdx);
			System.out.println("아이템얍!" + roomItemNames);
			

			// jsp로 전달
			model.addAttribute("room", roomDetail);
			model.addAttribute("prevRoom", prevRoom);
			model.addAttribute("nextRoom", nextRoom);
			model.addAttribute("otherRooms", otherRooms);
			model.addAttribute("roomItemIdx", roomItemNames.getRoom_item_names());

			log.debug("room: {}", roomDetail);
			log.debug("image: {}", roomImgList);

		} catch (Exception e) {
			log.error("객실 정보 조회 중 오류 발생", e);
		}
		return "room/roomDetail";
	}
	

}
