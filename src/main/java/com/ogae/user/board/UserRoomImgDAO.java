package com.ogae.user.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserRoomImgDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public UserRoomImgVO getRoomImg(UserRoomImgVO vo) {
        System.out.println("===> UserRoomImgVO [객실 이미지]");
        return sqlSessionTemplate.selectOne("UserRoomImgDAO.getRoomImg", vo);
    }

    public List<UserRoomImgVO> getRoomImgList(UserRoomImgVO vo) {
        System.out.println("===> UserRoomImgVO [객실 이미지 리스트]");
        return sqlSessionTemplate.selectList("UserRoomImgDAO.getRoomImgList", vo);
    }
    
    public List<UserRoomImgVO> getRoomImgList(Integer idx) {
        System.out.println("===> UserRoomImgVO [객실 이미지 리스트]");
        return sqlSessionTemplate.selectList("UserRoomImgDAO.getRoomImgList", idx);
    }
}
