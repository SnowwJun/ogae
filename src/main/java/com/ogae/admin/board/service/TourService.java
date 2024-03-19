package com.ogae.admin.board.service;

import java.util.List;

import com.ogae.admin.board.TourVO;

public interface TourService {
	TourVO getTourView(TourVO vo);
//	int insertTour(TourVO vo);
	void deleteTour(TourVO vo);
	void updateTour(TourVO vo);
	List<TourVO> getTourList(TourVO vo);
	
}
