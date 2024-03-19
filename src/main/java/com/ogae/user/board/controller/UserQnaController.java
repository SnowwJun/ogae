package com.ogae.user.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ogae.admin.board.Pagination;
import com.ogae.user.board.UserQnaDAO;
import com.ogae.user.board.UserQnaVO;
import com.ogae.user.board.service.UserQnaService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class UserQnaController {

	@Autowired
	private UserQnaService qnaService;
	
	@Autowired
	private UserQnaDAO UserQnaDAO;
	
//Qna
//@RequestMapping("/QnaList.do")
//public String QnaListView(UserQnaVO UserQnaVO, Model model) {
//	System.out.println("===> UserController QnaListView");
//	List<UserQnaVO> QnaList = qnaService.getQnaList(UserQnaVO);
//	System.out.println(QnaList.size());
//	model.addAttribute("QnaList", QnaList);
//	return "Qna/QnaList";
//}

	
	
	@PostMapping("/checkQnaPassword.do")
	   @ResponseBody
	   public ResponseEntity<String> checkQnaPass(UserQnaVO vo, @RequestParam("qnaIdx") Integer idx, @RequestParam("inputPass") String inputPass) {
	       try {
	          
	          UserQnaVO UserQna = qnaService.getQna(vo);
	          System.out.println(UserQna.toString());
	          
	           // 비밀번호 확인 및 결과 반환
	           boolean isPasswordCorrect = UserQna.getQnaPass().equals(inputPass);
	           System.out.println("isPasswordCorrect::::::" + isPasswordCorrect);

	           if (isPasswordCorrect) {
	               return ResponseEntity.ok("success");
	           } else {
	               return ResponseEntity.ok("fail");
	           }
	       } catch (Exception e) {
	           // 예외 로깅 추가
	           return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("error");
	       }
	   }
	/** 글 목록 조회 2023-11-13 */
	   @RequestMapping("/getQnaList.do")
	   public String getQnaList(UserQnaVO vo, Model model,
	             @RequestParam(required = false, defaultValue = "1") int page, 
	             @RequestParam(required = false, defaultValue = "1") int range,
	             @RequestParam(required = false, defaultValue = "") String searchCondition,
	             @RequestParam(required = false, defaultValue = "") String searchKeyword) {
	      // 검색 조건이 있는지 확인하여 QnaVO에 설정
	       UserQnaVO searchVO = new UserQnaVO();
	       if (searchCondition != null && searchKeyword != null) {
	           searchVO.setSearchCondition(searchCondition);
	           searchVO.setSearchKeyword(searchKeyword);
	       }

	       // 게시글 수 조회
	       int listCnt = qnaService.getSearchQnaListCnt(searchCondition, searchKeyword);

	       // 페이징 정보 설정
	       Pagination pagination = new Pagination();
	       pagination.pageInfo(page, range, listCnt);

	       // 페이징된 리뷰 리스트 가져오기
	       List<UserQnaVO> QnaList = qnaService.getSearchQnaList(searchCondition, searchKeyword, pagination);

	       // 모델에 속성 추가
	       model.addAttribute("pagination", pagination);
	       model.addAttribute("QnaList", QnaList);
	       return "qna/getQnaList";
	   }

@GetMapping("/insertQna.do")
public String insertQnaView() {
	System.out.println("===> UserController QnainsertView");
	return "qna/insertQna";
}
@PostMapping("/insertQna.do")
public String insertQna(UserQnaVO UserQnaVO) {
	System.out.println("===> UserController 게시글등록");
	System.out.println(UserQnaVO.toString());
	qnaService.insertQna(UserQnaVO);
	return "redirect:/getQnaList.do";
}
//@GetMapping("/deleteQna.do")
//   public String deleteQna(@RequestParam("qnaIdx") int QnaIdx) {
//     UserQnaVO Qna = new UserQnaVO();
//      Qna.setQnaIdx(QnaIdx);
//
//      qnaService.deleteQna(Qna);
//
//      // 삭제 후 목록 페이지로 리다이렉트
//      return "redirect:/QnaList.do";
//   }

@GetMapping("/deleteQna.do")
public String deleteQna(UserQnaVO vo) {
	qnaService.deleteQna(vo);
	System.out.println("DeleteQna");
	return"redirect:/getQnaList.do";
	
}
//2023-11-14 수정 기능 변경
@GetMapping("/updateQna.do")
public String updateQnaView(UserQnaVO vo, Model model) {
	System.out.println("updateQna Form으로 이동");

	UserQnaVO qna = qnaService.getQna(vo);
	System.out.println(qna.toString());
	model.addAttribute("qna", qna);
	return "qna/updateQna";
}

@PostMapping("/updateQna.do")
public String updateQna(UserQnaVO vo) {
	System.out.println("수정 완료 후 버튼 누르면 Qnalist Form 으로 이동");
	System.out.println(vo.toString());
	qnaService.updateQna(vo);
	return"redirect:/getQnaViewDetail.do?qnaIdx=" + vo.getQnaIdx();
}

//@RequestMapping("/getQnaViewDetail.do")
//public String getQnaViewDetailView(UserQnaVO UserQnaVO, Model model) {
//	System.out.println("===> UserController getQnaViewDetailView");
//	
//	UserQnaVO Qna = qnaService.getQna(UserQnaVO);
//	System.out.println(Qna.toString());
//	model.addAttribute("Qna", Qna);
//	return "qna/getQnaViewDetail";
//
//	}
//}

@GetMapping("/getQnaViewDetail.do")
public String getQnaViewDetailView(UserQnaVO vo, Model model) {
	
   // 글 상세 정보 가져오기
	UserQnaVO getQnaViewDetail = qnaService.getQna(vo);
   model.addAttribute("qna",getQnaViewDetail);
   
   //조회수
   qnaService.countQna(vo.getQnaIdx());
   
   // 현재 글 기준으로 이전 글, 다음 글 정보 가져오기
   UserQnaVO prevNext = qnaService.prevNext(vo);
   model.addAttribute("prevNext", prevNext);
   
   // 단일 댓글 정보 가져오기
   String qnaReply = qnaService.getQnaReply(vo);
   model.addAttribute("qnaReply", qnaReply);

   return "qna/getQnaViewDetail";
   
   
}

@PostMapping("/insertQnaReply.do")
public ResponseEntity<String> insertQnaReply(@RequestBody UserQnaVO vo) {
    try {
        // 게시글 정보 가져오기
    	UserQnaVO qna = qnaService.getQna(vo);

        // 댓글 등록
        qna.addComment(vo.getQnaReply());
        qnaService.insertQnaReply(qna);

        return new ResponseEntity<>("댓글이 등록되었습니다.", HttpStatus.OK);
    } catch (Exception e) {
        return new ResponseEntity<>("댓글 등록에 실패하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
    }
}

@GetMapping("/deleteQnaReply.do")
public String deleteQnaReply(@RequestParam("qnaReply") int qnaReply) {
	UserQnaVO vo = new UserQnaVO();
    vo.setQnaIdx(qnaReply);
    
    // 댓글 삭제
    qnaService.deleteQnaReply(vo);
    
    // 댓글 삭제 후 상세 페이지로 리다이렉트
    return "redirect:/getQnaViewDetail.do?qnaIdx=" + vo.getQnaIdx();
}
}


