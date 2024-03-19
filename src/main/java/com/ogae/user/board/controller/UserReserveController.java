package com.ogae.user.board.controller;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ogae.admin.board.RoomImgVO;
import com.ogae.admin.board.RoomVO;
import com.ogae.common.Utility;
import com.ogae.service.GuestService;
import com.ogae.service.PaymentService;
import com.ogae.service.ReserveService;
import com.ogae.vo.GuestVO;
import com.ogae.vo.MailVO;
import com.ogae.vo.PaymentVO;
import com.ogae.vo.ReserveVO;
import com.ogae.vo.TempDTO;
import com.ogae.vo.TermsAgreeVO;

import lombok.extern.slf4j.Slf4j;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Slf4j
@Controller
public class UserReserveController {
	
//	@Autowired
//	private SendService sendService;
	@Autowired
	private ReserveService reserService;
	@Autowired
	private GuestService guestService;
	@Autowired
	private PaymentService payService;
//	@Autowired
//	private JavaMailSender mailSender;
	
	@GetMapping("/reserveMain.do")
	public String reserMainView() {
		return "reserve/reserveMain";
	}
	
	@GetMapping("/reserCalender.do")
	public String reserCalendar() {
		return "reserve/reserCalendar";
	}

	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "/getReserList.do", produces = "application/json; charset=utf-8")
	public JSONObject getReserList(@RequestParam Map<String, String> param) throws IOException, java.text.ParseException {
	
		log.debug("year: {}, month: {}", param.get("year"), param.get("month"));
		int year = Integer.valueOf(param.get("year"));
		int month = Integer.valueOf(param.get("month"));
		
		List<RoomVO> roomList = reserService.getUseRoomList();
		log.debug("------------------ roomList: {}", roomList);
		
		Calendar cal = Calendar.getInstance();
		cal.set(year, month-1, 1);
		Date start = cal.getTime();
		int dayOfMonth = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		cal.set(year, month-1, dayOfMonth);
		Date end = cal.getTime();
		
		Map<String, Date> sendParam = new HashMap<String, Date>();
		
		log.debug("startDate: {} endDate: {}", start, end);
		sendParam.put("start", start);
		sendParam.put("end", end);
		
		List<ReserveVO> list = reserService.getReserList(sendParam);		
		
		JSONObject jsonObject = new JSONObject();
		JSONArray roomArray = new JSONArray();
		JSONArray listArray = new JSONArray();
		
//		ObjectMapper mapper = new ObjectMapper();
//		String jsonString = mapper.writeValueAsString(roomList);
		for(int i=0; i<roomList.size(); i++) {
			JSONObject jsonTemp = new JSONObject();
			jsonTemp.put("room_idx", roomList.get(i).getRoom_idx());
			jsonTemp.put("room_name", roomList.get(i).getRoom_name());
			jsonTemp.put("room_price", roomList.get(i).getRoom_price());
			roomArray.add(jsonTemp);
		}		
//		jsonObject.put("room", jsonString);
//		
//		jsonString = mapper.writeValueAsString(list);
//		jsonObject.put("list", jsonString);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		for(int i=0; i<list.size(); i++) {
			String reserStart = dateFormat.format(list.get(i).getReserve_start());
			String reserEnd = dateFormat.format(list.get(i).getReserve_end());
			
			JSONObject jsonTemp = new JSONObject();
			jsonTemp.put("room_idx", list.get(i).getRoom_idx());
			jsonTemp.put("reserve_start", reserStart);
			jsonTemp.put("reserve_end", reserEnd);
			jsonTemp.put("reserve_state", list.get(i).getReserve_state());
			listArray.add(jsonTemp);
		}		
		
		jsonObject.put("list", listArray);
		jsonObject.put("room", roomArray);
		
		log.debug("-----------------2 {}", jsonObject.toString());
		
		return jsonObject;
	}
	
	@GetMapping("/reserApply.do")
	public String reserApply() {
		return "reserve/reserApply";
	}
	
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "/getReserRoom.do", produces = "application/json; charset=utf-8")
	public JSONObject getReserRoom(@RequestParam Map<String, String> param) {
		
		log.debug("{}", param);
		
		JSONObject jsonObject = new JSONObject();
		JSONArray roomArray = new JSONArray();
		JSONArray listArray = new JSONArray();
		
		String[] dateArr = param.get("start").split("-");
		Calendar cal = Calendar.getInstance();
		cal.set(Integer.valueOf(dateArr[0]), Integer.valueOf(dateArr[1]) - 1, Integer.valueOf(dateArr[2]));
		Date startDate = cal.getTime();
		dateArr = param.get("end").split("-");
		cal.set(Integer.valueOf(dateArr[0]), Integer.valueOf(dateArr[1]) - 1, Integer.valueOf(dateArr[2]));
		Date endDate = cal.getTime();
		Map<String, Date> sendParam = new HashMap<String, Date>();

		log.debug("startDate: {} endDate: {}", startDate, endDate);
		sendParam.put("start", startDate);
		sendParam.put("end", endDate);
		
		List<RoomVO> roomList = reserService.getUseRoomList();
		List<ReserveVO> list = reserService.getReserList(sendParam);
		List<RoomImgVO> roomImg = reserService.getImageList();
		
		// 우선 테스트 하기 위해 wldnjfk
//		for(int i=0; i<roomImg.size(); i++) {
//			int idx = roomImg.get(i).getRoom_idx();
//			if (idx == 90) {
//				roomImg.get(i).setRoom_idx(32);
//			} else if (idx == 98) {
//				roomImg.get(i).setRoom_idx(33);
//			} else if (idx == 99) {
//				roomImg.get(i).setRoom_idx(34);
//			}
//		}

		String imgServer = "https://ogae-dev.s3.ap-northeast-2.amazonaws.com/";
		for(int i=0; i<roomList.size(); i++) {
			JSONObject jsonTemp = new JSONObject();
			jsonTemp.put("room_idx", roomList.get(i).getRoom_idx());
			jsonTemp.put("room_name", roomList.get(i).getRoom_name());
			jsonTemp.put("room_info", roomList.get(i).getRoom_info());
			jsonTemp.put("room_person", roomList.get(i).getPerson_num());
			jsonTemp.put("room_category", roomList.get(i).getRoom_category());
			jsonTemp.put("room_size", roomList.get(i).getRoom_size());
			jsonTemp.put("room_price", roomList.get(i).getRoom_price());
			for(int j=0; j<roomImg.size(); j++) {
				if(roomList.get(i).getRoom_idx() == roomImg.get(j).getRoom_idx()) {
					jsonTemp.put("room_img", imgServer + roomImg.get(j).getImg_path());
					break;
				}
			}
			roomArray.add(jsonTemp);
		}

		for(int i=0; i<list.size(); i++) {
			JSONObject jsonTemp = new JSONObject();
			jsonTemp.put("room_idx", list.get(i).getRoom_idx());
			jsonTemp.put("reserve_start", list.get(i).getReserve_start().toString());
			jsonTemp.put("reserve_end", list.get(i).getReserve_end().toString());
			jsonTemp.put("reserve_state", list.get(i).getReserve_state());
			listArray.add(jsonTemp);
		}		

		jsonObject.put("list", listArray);
		jsonObject.put("room", roomArray);
		
		log.debug("-----------------2 {}", jsonObject.toString());

		return jsonObject;
	}
	
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "/reserApply.do", produces = "application/json; charset=utf-8")
	public JSONObject reserApply(String param) throws ParseException, JsonProcessingException {
		System.err.println("-----------------------------------------------");
		log.debug("{}", param);

		JSONObject jsonObject = new JSONObject();
		JSONArray roomArray = new JSONArray();
		JSONArray listArray = new JSONArray();
		
		if(param != null) {
		
			String[] paramTemp = param.split("&");
			String[] arrTemp = paramTemp[0].split("=");
			String selDate = arrTemp[1];
			//arrTemp = paramTemp[1].split("=");
			
			String[] dateArr = selDate.split("-");
			Calendar cal = Calendar.getInstance();
			cal.set(Integer.valueOf(dateArr[0]), Integer.valueOf(dateArr[1]) - 1, Integer.valueOf(dateArr[2]));
			Date startDate = cal.getTime();
			cal.set(Integer.valueOf(dateArr[0]), Integer.valueOf(dateArr[1]) - 1, Integer.valueOf(dateArr[2]) + 1);
			Date endDate = cal.getTime();
			Map<String, Date> sendParam = new HashMap<String, Date>();
			
			log.debug("startDate: {} endDate: {}", startDate, endDate);
			sendParam.put("start", startDate);
			sendParam.put("end", endDate);
			
			// 231127 중간 날짜 계산하기 숙박기간이 2일 이상인 경우 사이의 방도 예약 금지
			
			List<RoomVO> roomList = reserService.getUseRoomList();
			List<ReserveVO> list = reserService.getReserList(sendParam);
			List<RoomImgVO> roomImg = reserService.getImageList();
			
			log.debug("roomList: {}", roomList);
			log.debug("ReserList: {}", list);
//			System.out.println(sendParam.get("start"));
//			System.out.println(sendParam.get("end"));
			
//			ObjectMapper mapper = new ObjectMapper();
//			String jsonString = mapper.writeValueAsString(roomList);
//			System.out.println(jsonString);
			
			// 우선 테스트 하기 위해 wldnjfk
//			for(int i=0; i<roomImg.size(); i++) {
//				int idx = roomImg.get(i).getRoom_idx();
//				if (idx == 90) {
//					roomImg.get(i).setRoom_idx(32);
//				} else if (idx == 98) {
//					roomImg.get(i).setRoom_idx(33);
//				} else if (idx == 99) {
//					roomImg.get(i).setRoom_idx(34);
//				}
//			}

			String imgServer = "https://ogae-dev.s3.ap-northeast-2.amazonaws.com/";
			for(int i=0; i<roomList.size(); i++) {
				JSONObject jsonTemp = new JSONObject();
				jsonTemp.put("room_idx", roomList.get(i).getRoom_idx());
				jsonTemp.put("room_name", roomList.get(i).getRoom_name());
				jsonTemp.put("room_info", roomList.get(i).getRoom_info());
				jsonTemp.put("room_person", roomList.get(i).getPerson_num());
				jsonTemp.put("room_category", roomList.get(i).getRoom_category());
				jsonTemp.put("room_size", roomList.get(i).getRoom_size());
				jsonTemp.put("room_price", roomList.get(i).getRoom_price());
				for(int j=0; j<roomImg.size(); j++) {
					if(roomList.get(i).getRoom_idx() == roomImg.get(j).getRoom_idx()) {
						jsonTemp.put("room_img", imgServer + roomImg.get(j).getImg_path());
						break;
					}
				}
				roomArray.add(jsonTemp);
			}
	
			for(int i=0; i<list.size(); i++) {
				JSONObject jsonTemp = new JSONObject();
				jsonTemp.put("room_idx", list.get(i).getRoom_idx());
				jsonTemp.put("reserve_start", list.get(i).getReserve_start().toString());
				jsonTemp.put("reserve_end", list.get(i).getReserve_end().toString());
				jsonTemp.put("reserve_state", list.get(i).getReserve_state());
				listArray.add(jsonTemp);
			}		
	
			jsonObject.put("list", listArray);
			jsonObject.put("room", roomArray);
			
			log.debug("-----------------2 {}", jsonObject.toString());
	
			return jsonObject;
		}

		return jsonObject;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getRoomImages.do", produces = "application/json; charset=utf-8")
	public String getRoomImages(@RequestParam("idx") int idx) throws Exception {
		
		log.debug("{}", idx);
		RoomImgVO imgVO = new RoomImgVO();
		
//		// 우선 테스트 하기 위해 wldnjfk
//		if(idx == 32) {
//			imgVO.setRoom_idx(90);
//		} else if (idx == 33) {
//			imgVO.setRoom_idx(98);
//		} else if (idx == 34) {
//			imgVO.setRoom_idx(99);
//		}
		
		System.out.println(imgVO);
		
		List<RoomImgVO> roomImg = reserService.getImages(imgVO);
		
		System.out.println(roomImg);
		
		ObjectMapper mapper = new ObjectMapper(); 
		String jsonString = mapper.writeValueAsString(roomImg);
		
		return jsonString;
	}
	
	@GetMapping("/reserTabMenu.do")
	public String calendar() {
		return "reserve/reserTabMenu";
	}
	
	@GetMapping("/reserCheck.do")
	public String reserCheck() {
		return "reserve/reserCheck";
	}

	@ResponseBody
	@RequestMapping(value = "/reserPaydata.do", produces = "application/json; charset=utf-8")
	//public String reserPaydata(@RequestBody String roomList, HttpServletRequest request) {
	public String reserPaydata(@RequestBody TempDTO vo, HttpServletRequest request) throws Exception {
	//public String reserPaydata() {	
		log.debug("{}", vo.getTempList());

		String reserNum = Utility.getInstance().createFileName(0);
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonString = mapper.writeValueAsString(vo.getTempList());
		System.out.println(jsonString);
		
		ServletContext servletContext = request.getSession().getServletContext();
		System.out.println(servletContext);
		String realPath = servletContext.getRealPath("/");
		String path = realPath + reserNum + ".json";
		System.out.println(path);
		
		FileWriter file = new FileWriter(path);
		file.write(jsonString);
		file.flush();
		file.close();
		
		return reserNum;
	}
	
	@GetMapping("/reserPayment.do")
	public String reserPayment() {
		log.debug("{}");
		return "reserve/reserPayment";
	}
	
	@ResponseBody
	@RequestMapping(value = "/getJson.do", produces = "application/json; charset=utf-8")
	public String getJson(@RequestParam String code, HttpServletRequest request) {
		
		log.debug("code: {}", code);
		ServletContext servletContext = request.getSession().getServletContext();
		System.out.println(servletContext);
		String realPath = servletContext.getRealPath("/");
		String path = realPath + code + ".json";
		System.out.println(path);
		JSONArray jsonArray = new JSONArray();
		JSONParser jsonParser = new JSONParser();
		try (FileReader reader = new FileReader(path)) {
			jsonArray = (JSONArray) jsonParser.parse(reader);			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		System.out.println(jsonArray.toString());
		
		return jsonArray.toString();
	}
	
	@ResponseBody
	@RequestMapping(value = "/completePayment.do", produces = "application/json; charset=utf-8")
	public String completePayment(@RequestBody Map<String, Object> param, GuestVO gvo ,PaymentVO pvo, ReserveVO rvo, TermsAgreeVO tvo, Model model) throws java.text.ParseException {
		
		log.debug("{}", param);
		
		// guest insert
		String guest_idx = (String) param.get("guest_idx");
		String guest_name = (String) param.get("guest_name");
		String guest_birth = (String) param.get("guest_birth");
		String guest_phone = (String) param.get("guest_phone");
		String guest_ephone = (String) param.get("guest_ephone");
		String guest_email = (String) param.get("guest_email");
		String guest_time = (String) param.get("guest_time");
		String guest_request = (String) param.get("guest_request");
		
		gvo.setGuest_idx(guest_idx);
		gvo.setGuest_name(guest_name);
		gvo.setGuest_birth(guest_birth);
		gvo.setGuest_phone(guest_phone);
		gvo.setGuest_emerge_phone(guest_ephone);
		gvo.setGuest_email(guest_email);
		gvo.setGuest_arrive_time(guest_time);
		gvo.setGuest_request(guest_request);
		
		log.debug("{}", gvo);
//		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//		System.out.println(dateFormat.parse((String) param.get("reser_start")));
//		System.out.println(dateFormat.parse((String) param.get("reser_end")));
//		
		// reserve insert
		String reserve_idx = (String) param.get("reser_idx");
		Date reserve_start = dateFormat.parse((String) param.get("reser_start"));
		Date reserve_end = dateFormat.parse((String) param.get("reser_end"));
		String reserve_state = (String) param.get("reser_state");
		int room_idx =  Integer.parseInt((String) param.get("reser_room"));
		
		rvo.setReserve_idx(reserve_idx); 
		rvo.setReserve_start(reserve_start); 
		rvo.setReserve_end(reserve_end); 
		rvo.setReserve_state(reserve_state); 
		rvo.setRoom_idx(room_idx); 
		rvo.setGuest_idx(guest_idx);
		
		log.debug("{}", rvo);
		
		//System.out.println("1: " + param.get("pay_status"));
		//System.out.println("2: " + (String) param.get("pay_status"));
		
		// payment insert
		String payment_idx = (String) param.get("merchant_uid");
		String payment_type = (String) param.get("pay_type");
		String payment_status = "1";
		String payment_bank = "은행";
		String payment_approval = (String) param.get("pay_apply");
		String payment_date = new Date().toString();
		int payment_total =Integer.parseInt((String) param.get("pay_total"));
		
		pvo.setPayment_idx(payment_idx);
		pvo.setPayment_type(payment_type);
		pvo.setPayment_status(payment_status);
		pvo.setPayment_bank(payment_bank);
		pvo.setPayment_approval(payment_approval);
		pvo.setPayment_date(payment_date);
		pvo.setPayment_total(payment_total);
		pvo.setReserve_idx(reserve_idx);
		
		log.debug("{}", pvo);

		String room_name = (String) param.get("reser_room_name");
		int room_price = Integer.parseInt((String) param.get("reser_room_price"));
		String reser_peoInfo = (String) param.get("reser_peoInfo");
		String[] peoArr = reser_peoInfo.split("/");
		int reser_adult = Integer.parseInt(peoArr[0]);
		int reser_child = Integer.parseInt(peoArr[1]);
		int reser_baby = Integer.parseInt(peoArr[2]);
		
		System.err.println("========================================");
		System.out.println(room_name + " " + room_price + " " + reser_adult + " " + reser_child + " " + reser_baby);
		System.err.println("========================================");
		
		// terms_agree insert

		guestService.insertGuest(gvo);
		reserService.insertReserve(rvo);
		payService.insertPayment(pvo);
		
		//String phone, String reserNo, String roomInfo, String peoInfo, String reserDate
		
		String peoInfo = (reser_adult > 0 ? "성인" + reser_adult : "") 
						+ (reser_child > 0 ? "/유아" + reser_child : "")
						+ (reser_baby > 0 ? "/아동" + reser_baby : "");
		long diffDays = ((reserve_end.getTime() - reserve_start.getTime()) / 1000) / (24*60*60);

		sendSmsReserve(gvo.getGuest_phone(), rvo.getReserve_idx(), room_name, peoInfo, dateFormat.format(reserve_start) + "(" + diffDays + "박)");
		
		model.addAttribute("reserno", rvo.getReserve_idx());
		model.addAttribute("name", gvo.getGuest_name());
		model.addAttribute("phone", gvo.getGuest_phone());
		model.addAttribute("ephone", gvo.getGuest_emerge_phone());
		model.addAttribute("email", gvo.getGuest_email());
		model.addAttribute("roomname", room_name);
		model.addAttribute("roomprice", room_price);
		model.addAttribute("indate", rvo.getReserve_start());
		model.addAttribute("total", pvo.getPayment_total());
		model.addAttribute("reser_adult", reser_adult);
		model.addAttribute("reser_child", reser_child);
		model.addAttribute("reser_baby", reser_baby);
		
		return "success";
	}
	
	@GetMapping("/reserComplete.do")
	public ModelAndView reserComplete() {
		
//		model.addAttribute("reserno", reserno);
//		model.addAttribute("name", name);
//		model.addAttribute("phone", phone);
//		model.addAttribute("ephone", ephone);
//		model.addAttribute("email", email);
//		model.addAttribute("roomname", roomname);
//		model.addAttribute("roomname", roomname);
//		model.addAttribute("roomprice", roomprice);
//		model.addAttribute("indate", indate);
//		model.addAttribute("total", total);
//		model.addAttribute("reser_adult", reser_adult);
//		model.addAttribute("reser_child", reser_child);
//		model.addAttribute("reser_baby", reser_baby);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("reserve/reserComplete");
		return mav;
	}
	
	@PostMapping("/sendMailReserve.do")
	public String sendMailReserve(@RequestParam("frommail") String fromMail, @RequestParam("tomail") String toMail, @RequestParam("reserno") String reserNo, 
			@RequestParam("roomname") String roomName, @RequestParam("adult") String adult,  @RequestParam("child") String child,  @RequestParam("baby") String baby, 
			@RequestParam("reserdate") String reserDate, @RequestParam("resertype") String reserType, @RequestParam("reserprice") String reserPrice, MailVO vo) {
	//public String sendMailReserve(String email, String reserNo, String roomName, adult, child, baby, String reserDate, String reserType, String reserPrice, MailVO vo) {
//		
//		try {
//				System.out.println(fromMail + " " + toMail);
//				MimeMessage mimeMessage = mailSender.createMimeMessage();
//				MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
//				
//				String title = "[여기오개] 예약확인 메일입니다.";
//				String peoInfo = "성인" + adult + " / 아동" + child + " / 유아" + baby;
//				
//				StringBuilder sbMsg = new StringBuilder();
//				
//				sbMsg.append("<html><head><style>table{width: 70%;}table tr:first-child{border-top: 2px solid #000;}table td, table th {padding: 1.7% 0;font-size: 1.2rem;color: #000;border-bottom: 1px solid #dedede; }table th {padding-left: 2%;text-align: left;border-right: 1px solid #dedede;}table td {padding-left: 4%;}</style></head>");
//				sbMsg.append("<body><table><colgroup><col style='width: 16%'><col style='width: 84%'></colgroup>");
//				sbMsg.append("<tbody><tr><td><img src='resources/images/logo.png' width='200'></td><td>예약 확인 메일입니다.</td></tr>");
//				sbMsg.append("<tr><th scope='row'>예약번호</th><td><strong>");
//				sbMsg.append(reserNo);
//				sbMsg.append("</strong></td></tr><tr><th scope='row'>객실명</th><td><strong>");
//				sbMsg.append(roomName);
//				sbMsg.append("</strong></td></tr><tr><th scope='row'>이용날짜</th><td>");
//				sbMsg.append(reserDate);
//				sbMsg.append("</td></tr><tr><th scope='row'>이용인원</th><td>");
//				sbMsg.append(peoInfo);
//				sbMsg.append("</td></tr><tr><th scope='row'>결제금액</th><td>");
//				sbMsg.append(reserPrice);
//				sbMsg.append("원</td></tr><tr><th scope='row'>결제방법</th><td>");
//				sbMsg.append(reserType);
//				sbMsg.append("</td></tr><tr><th scope='row'>예약상태</th><td>예약완료</td></tr></tbody></table></body></html>");
//				
//				System.out.println(sbMsg.toString());
//				
//				messageHelper.setFrom(fromMail);
//				messageHelper.setTo(toMail);
//				messageHelper.setSubject(title);
//				messageHelper.setText("text/html", sbMsg.toString());
				
//				mimeMessage.addRecipients(MimeMessage.RecipientType.TO, toMail);
//				mimeMessage.setSubject(title);
//				mimeMessage.setFileName(fromMail);
//				mimeMessage.setText(sbMsg.toString(), "utf-8", "html");
		
//				vo.setTo(email);
//				vo.setFrom("dlfma330@gmail.com");
//				vo.setSubject("예약확인 메일입니다.");
//				vo.setContent(sbMsg.toString());
				
//				sendService.sendMail(vo);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		
		return "index";
	}
	
	//@PostMapping("/sendSmsReserve.do")
	//public SingleMessageSentResponse sendSmsReserve(@RequestParam("phone") String phone, @RequestParam("reserno") String reserNo,
	//		@RequestParam("reserDate") String reserDate, @RequestParam("peoInfo") String peoInfo, @RequestParam("roomInfo") String roomInfo) {
	public SingleMessageSentResponse sendSmsReserve(String phone, String reserNo, String roomInfo, String peoInfo, String reserDate) {
		log.debug("phone:{} reserNo:{}", phone, reserNo);
		
		String api_key = "NCS9QZHSNXMGNJT9";
		String api_secret = "NDWUNZLKMDJWTTDW0WSKQK9URXCBSXOC";

		DefaultMessageService messageService = NurigoApp.INSTANCE.initialize(api_key, api_secret, "https://api.coolsms.co.kr");
		String strMsg = String.format("예약완료 여기오개 펜션/%s/%s/%s\n예약번호:%s", roomInfo, reserDate, peoInfo, reserNo);
		System.out.println(strMsg);
		
		
		Message message = new Message();
		message.setFrom("01053242514");
		message.setTo(phone);
		message.setText(strMsg);
//		message.setText("[테스트]예약확인 메시지\n예약번호: " + reserNo);
		
		SingleMessageSentResponse response = messageService.sendOne(new SingleMessageSendingRequest(message));
		System.out.println(response);
		
		return response;
	}
}
