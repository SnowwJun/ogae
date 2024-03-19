package com.ogae.admin.board.controller;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ogae.admin.board.TourVO;
import com.ogae.admin.board.service.TourService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TourController {
	
	@Autowired
	private TourService tourService;
	
	@RequestMapping("insertTour.ado")
	public String insertTour() throws IOException, ParseException {

//		참고문서에 있는 url주소
		String apiUrl = "https://apis.data.go.kr/B551011/KorService1/searchKeyword1";
//	     홈페이지에서 받은 키
		String serviceKey = "rAMyyQOpVTpHl7tGWBRdIE%2F%2BjP3lQXDBor6o765IltCHYI0aj9iGYk9bWf7lziP8nEB%2B%2FVUxKHvm5easxcaX3Q%3D%3D";

		StringBuilder urlBuilder = new StringBuilder(apiUrl);
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + serviceKey);
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=50");
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=1");
		urlBuilder.append("&" + URLEncoder.encode("MobileOS", "UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("MobileApp", "UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("listYN", "UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("arrange", "UTF-8") + "=" + URLEncoder.encode("A", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("keyword", "UTF-8") + "=" + "%EA%B0%80%ED%8F%89");
		urlBuilder.append("&" + URLEncoder.encode("contentTypeId", "UTF-8") + "=12");

		/*
		 * GET방식으로 전송해서 파라미터 받아오기
		 */
		URL url = new URL(urlBuilder.toString());

		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());

		BufferedReader rd;	
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}

		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}

		rd.close();
		conn.disconnect();

		String result = sb.toString();

		// =======이 밑에 부터는 json에서 데이터 파싱해 오는 부분이다=====//

		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject) jsonParser.parse(result);

		JSONObject response = (JSONObject) jsonObject.get("response");
		JSONObject body = (JSONObject) response.get("body");
		JSONObject items = (JSONObject) body.get("items");
		JSONArray itemArray = (JSONArray) items.get("item");
		
//		List<TourVO> voList = new ArrayList<>();
		
		TourVO vo = new TourVO();

		// 배열을 돌며 필요한 카테고리 코드에 해당하는 값을 dto에 넣어주기
		for (int i = 0; i < itemArray.size(); i++) {

			JSONObject item = (JSONObject) itemArray.get(i);
			
			vo.setTour_idx(i+1);

//		        dto.setPTY(item.get("obsrValue").toString());
			String addr1 = (String) item.get("addr1");
			vo.setTour_addr1(addr1);

//		        dto.setREH(item.get("obsrValue").toString());
			String mapx = (String) item.get("mapx");
			vo.setTour_mapx(mapx);

//		        dto.setRN1(item.get("obsrValue").toString());
			String mapy = (String) item.get("mapy");
			vo.setTour_mapy(mapy);
			
//		        dto.setT1H(item.get("obsrValue").toString());
			String title = (String) item.get("title");
			vo.setTour_title(title);
			
			System.out.println("tour 정보: " + vo.toString());
			
//			
//			if(tourService.insertTour(vo) > 0) {
//				System.out.println("성공");
//			} else {
//				System.out.println("실패");
//			}
//			
			
			vo = new TourVO();
			
			
		}
		return "tour/insertTour";
	}
	
	
	@GetMapping("getTour.ado")
	public String TourList(TourVO vo, Model model) {
		List<TourVO> tourList = tourService.getTourList(vo);
		vo.setTour_idx(5);
		//tourService.getTour(vo)
		model.addAttribute("tourList", tourList);
		
		return "tour/insertTour";
	}
	
	@GetMapping("getTourView.ado")
	public String getTourView(@RequestParam("tour_idx") int tour_idx, Model model) {
		// tour_idx를 사용해서 해당 공지사항 정보를 가져옴
		TourVO tour = new TourVO();
		tour.setTour_idx(tour_idx);
//		TourVO tourDetail = tourService.getTourView(tour);
		tour = tourService.getTourView(tour);
		
		System.out.println("==============================================" + tour.toString());

		// 가져온 정보를 모델에 담아서 뷰로 전달
		model.addAttribute("tour", tour);

		return "redirect:/tourDetailView.ado?tour_idx=" + tour.getTour_idx();
	}
	
	@GetMapping("/tourDetailView.ado")
	public String tourDetailView(@RequestParam("tour_idx") int tour_idx, Model model) {

		TourVO tour = new TourVO();
	    tour.setTour_idx(tour_idx);
	    tour = tourService.getTourView(tour);

	    // 가져온 정보를 모델에 담아서 뷰로 전달
	    model.addAttribute("tour", tour);
		
	    return "tour/getTourView";
	}

	
	@RequestMapping("TourList.ado")
	public String TourList(Model model, TourVO vo) {
		log.debug(null);
		List<TourVO> tourList = tourService.getTourList(vo);
//		List<NoticeVO> noticeList = noticeDAO.getNoticeList(new NoticeVO());
		model.addAttribute("tourList", tourList);
		return "tour/TourList";
	}
	
	
	@GetMapping("updateTour.ado")
	public String updateTour(TourVO vo, Model model) {

		//기존내용 가져옴
		TourVO tour = tourService.getTourView(vo);
		
		//모델에 공지사항 정보 추가
		model.addAttribute("tour", tour);
		System.out.println("===>여행 정보 수정");
		return "tour/updateTour";
	}
	
	@PostMapping("updateTour.ado")
	public String updateTour(TourVO vo) {
		System.out.println("수정완료");
		System.out.println(vo.toString());
		
		tourService.updateTour(vo);
		return "redirect:/getTourView.ado?tour_idx=" + vo.getTour_idx();
	}
}

