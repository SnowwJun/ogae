package com.ogae.user.board.service;

import java.util.List;

import com.ogae.user.board.UserRoomImgVO;

public interface UserRoomImgService {

	UserRoomImgVO getRoomImg(UserRoomImgVO vo);

    List<UserRoomImgVO> getRoomImgList(UserRoomImgVO vo);
    List<UserRoomImgVO> getRoomImgList(Integer idx);
}
