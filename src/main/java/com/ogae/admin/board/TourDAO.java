package com.ogae.admin.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TourDAO {
	
	    @Autowired
	    private SqlSessionTemplate sqlSessionTemplate;

	    public TourVO getTourView(TourVO vo) {
	    	System.out.println("---> MyBatis로 getTourView() 기능 처리");
	    	return (TourVO) sqlSessionTemplate.selectOne("TourDAO.getTourView", vo);
	    }
	    
//	    public int insertTour(TourVO vo) {
//	    	System.out.println("===> TourDAO insertTour");
//	    	
//	    	int result = sqlSessionTemplate.insert("TourDAO.insertTour", vo);
//	    	
//	    	return result;
//	    }
	    
	    public void updateTour(TourVO vo) {
			System.out.println("---> MyBatis로 updateTour() 기능 처리");
			sqlSessionTemplate.update("TourDAO.updateTour", vo);
	    }

	    public void deleteTour(TourVO vo) {
	    	System.out.println("---> MyBatis로 deleteTour() 기능 처리");
	    	sqlSessionTemplate.delete("TourDAO.deleteTour", vo);
	    }

	   

	    public List<TourVO> getTourList(TourVO vo) {
	    	System.out.println("---> MyBatis로 getTourList() 기능 처리");
	        return sqlSessionTemplate.selectList("TourDAO.getTourList", vo);
	    }
	}
