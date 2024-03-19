package com.ogae.admin.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogae.admin.board.TourDAO;
import com.ogae.admin.board.TourVO;
import com.ogae.admin.board.service.TourService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("TourService")
public class TourServiceImpl implements TourService {
	
	@Autowired
	private TourDAO TourDAO;

	@Override
	public TourVO getTourView(TourVO vo) {
		log.debug("{}", vo.toString());
		return TourDAO.getTourView(vo);
	}
	
//	@Override
//	public int insertTour(TourVO vo) {
//		log.debug("{}", vo.toString());
//		int result = TourDAO.insertTour(vo);
//		
//		return result;
//	}

	@Override
	public void updateTour(TourVO vo) {
		log.debug("{}", vo.toString());
		TourDAO.updateTour(vo);
	}

	@Override
	public void deleteTour(TourVO vo) {
		log.debug("{}", vo.toString());
		TourDAO.deleteTour(vo);
	}

	@Override
	public List<TourVO> getTourList(TourVO vo) {
		return TourDAO.getTourList(vo);
	}

	

}
