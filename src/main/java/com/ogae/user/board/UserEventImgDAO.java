package com.ogae.user.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserEventImgDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/** 이미지 조회 */
	public UserEventImgVO getEventImg(UserEventImgVO vo) {
		System.out.println("===> getEventImg(UserEventImgVO vo)");
		return sqlSessionTemplate.selectOne("UserEventImgDAO.getEventImg", vo);
	}
	
	public UserEventImgVO getEventImg(Integer idx) {
		System.out.println("===> getEventImg(Integer idx)");
		return sqlSessionTemplate.selectOne("UserEventImgDAO.getEventImg", idx);
	}
	
	public List<UserEventImgVO> getEventImgList(Integer idx){
		System.out.println("==> getEventImgList(Integer idx)");
		return sqlSessionTemplate.selectList("UserEventImgDAO.getEventImgList", idx);
	}
}
