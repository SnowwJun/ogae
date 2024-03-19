package com.ogae.user.board.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ogae.admin.board.TourVO;
import com.ogae.admin.board.service.TourService;

@Controller
public class UserTourController {
	
	 @Autowired
	 private TourService tourService;
		
//	    public UserTourController(TourService tourService) {
//	        this.TourService = tourService;
//	    }
	 
	@GetMapping("Arboretum.do")
	public String Arboretum(TourVO vo, Model model) {
		List<TourVO> tourList = tourService.getTourList(vo);
		
        model.addAttribute("tourList", tourList);  // 뷰 이름, 필요에 따라 수정
		return "tour/Arboretum";
	}

	@GetMapping("Cheongpyeong.do")
	public String Cheongpyeong(TourVO vo, Model model) {
		List<TourVO> tourList = tourService.getTourList(vo);
		
        model.addAttribute("tourList", tourList);  // 뷰 이름, 필요에 따라 수정
		return "tour/Cheongpyeong";
	}

	@GetMapping("JadeGarden.do")
	public String JadeGarden(TourVO vo, Model model) {
		List<TourVO> tourList = tourService.getTourList(vo);
		
        model.addAttribute("tourList", tourList);  // 뷰 이름, 필요에 따라 수정
		return "tour/JadeGarden";	
	}

	@GetMapping("Jara.do")
	public String Jara(TourVO vo, Model model) {
		List<TourVO> tourList = tourService.getTourList(vo);
		
        model.addAttribute("tourList", tourList);  // 뷰 이름, 필요에 따라 수정
		return "tour/Jara";
	}

	@GetMapping("Nami.do")
	public String Nami(TourVO vo, Model model) {
		List<TourVO> tourList = tourService.getTourList(vo);
		
        model.addAttribute("tourList", tourList);  // 뷰 이름, 필요에 따라 수정
		return "tour/Nami";
	}

	@GetMapping("PetitFrance.do")
	public String PetitFrance(TourVO vo, Model model) {
		List<TourVO> tourList = tourService.getTourList(vo);
		
        model.addAttribute("tourList", tourList);  // 뷰 이름, 필요에 따라 수정
		return "tour/PetitFrance";
	}

	@GetMapping("RailBike.do")
	public String RailBike(TourVO vo, Model model) {
		List<TourVO> tourList = tourService.getTourList(vo);
		
        model.addAttribute("tourList", tourList);  // 뷰 이름, 필요에 따라 수정
		return "tour/RailBike";
	}
	
	@GetMapping("Tour.do")
	public String Tour(TourVO vo, Model model) {
		List<TourVO> tourList = tourService.getTourList(vo);
		
        model.addAttribute("tourList", tourList);  // 뷰 이름, 필요에 따라 수정
		return "tour/Tour";
	}
	
}
