package com.ogae.admin.board;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventImgDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/** 이미지 등록 */
	public void insertEventImg(EventImgVO vo) {
		System.out.println("===> insertEventImg(EventImgVO vo)");
		try {
			sqlSessionTemplate.insert("EventImgDAO.insertEventImg", vo);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	/** 이미지 수정 */
	public void updateEventImg(EventImgVO vo) {
		System.out.println("===> updateEventImg(EventImgVO vo)");
		sqlSessionTemplate.update("EventImgDAO.updateEventImg", vo);
	}
	
	/** 이미지 삭제 */
	public void deleteEventImg(EventImgVO vo) {
		System.out.println("===> deleteEventImg(EventImgVO vo)");
		sqlSessionTemplate.delete("EventImgDAO.deleteEventImg", vo);
	}
	
	/** 이미지 조회 */
	public EventImgVO getEventImg(EventImgVO vo) {
		System.out.println("===> getEventImg(EventImgVO vo)");
		return sqlSessionTemplate.selectOne("EventImgDAO.getEventImg", vo);
	}
	
	public EventImgVO getEventImg(Integer idx) {
		System.out.println("===> getEventImg(Integer idx)");
		return sqlSessionTemplate.selectOne("EventImgDAO.getEventImg", idx);
	}
}
