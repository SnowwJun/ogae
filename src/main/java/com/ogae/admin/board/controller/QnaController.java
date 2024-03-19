package com.ogae.admin.board.controller;

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

import com.ogae.admin.board.Pagination;
import com.ogae.admin.board.QnaDAO;
import com.ogae.admin.board.QnaVO;
import com.ogae.admin.board.service.QnaService;


@Controller
public class QnaController {

	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private QnaDAO QnaDAO;
	
//Qna
//@RequestMapping("/QnaList.ado")
//public String QnaListView(QnaVO QnaVO, Model model) {
//	System.out.println("===> UserController QnaListView");
//	List<QnaVO> QnaList = qnaService.getQnaList(QnaVO);
//	System.out.println(QnaList.size());
//	model.addAttribute("QnaList", QnaList);
//	return "Qna/QnaList";
//}

	/** 글 목록 조회 2023-11-13 */
	   @RequestMapping("/getQnaList.ado")
	   public String getQnaList(QnaVO vo, Model model,
	             @RequestParam(required = false, defaultValue = "1") int page, 
	             @RequestParam(required = false, defaultValue = "1") int range,
	             @RequestParam(required = false, defaultValue = "") String searchCondition,
	             @RequestParam(required = false, defaultValue = "") String searchKeyword) {
	      // 검색 조건이 있는지 확인하여 QnaVO에 설정
	       QnaVO searchVO = new QnaVO();
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
	       List<QnaVO> QnaList = qnaService.getSearchQnaList(searchCondition, searchKeyword, pagination);

	       // 모델에 속성 추가
	       model.addAttribute("pagination", pagination);
	       model.addAttribute("QnaList", QnaList);
	       return "qna/getQnaList";
	   }

@GetMapping("/insertQna.ado")
public String insertQnaView() {
	System.out.println("===> UserController QnainsertView");
	return "qna/insertQna";
}
@PostMapping("/insertQna.ado")
public String insertQna(QnaVO QnaVO) {
	System.out.println("===> UserController 게시글등록");
	System.out.println(QnaVO.toString());
	qnaService.insertQna(QnaVO);
	return "redirect:/getQnaList.ado";
}
//@GetMapping("/deleteQna.ado")
//   public String deleteQna(@RequestParam("qnaIdx") int QnaIdx) {
//     QnaVO Qna = new QnaVO();
//      Qna.setQnaIdx(QnaIdx);
//
//      qnaService.deleteQna(Qna);
//
//      // 삭제 후 목록 페이지로 리다이렉트
//      return "redirect:/QnaList.ado";
//   }

@GetMapping("/deleteQna.ado")
public String deleteQna(QnaVO vo) {
	qnaService.deleteQna(vo);
	System.out.println("DeleteQna");
	return"redirect:/getQnaList.ado";
	
}
//2023-11-14 수정 기능 변경
@GetMapping("/updateQna.ado")
public String updateQnaView(QnaVO vo, Model model) {
	System.out.println("updateQna Form으로 이동");

	QnaVO qna = qnaService.getQna(vo);
	System.out.println(qna.toString());
	model.addAttribute("qna", qna);
	return "qna/updateQna";
}

@PostMapping("/updateQna.ado")
public String updateQna(QnaVO vo) {
	System.out.println("수정 완료 후 버튼 누르면 Qnalist Form 으로 이동");
	System.out.println(vo.toString());
	qnaService.updateQna(vo);
	return"redirect:/getQnaViewDetail.ado?qnaIdx=" + vo.getQnaIdx();
}

//@RequestMapping("/getQnaViewDetail.ado")
//public String getQnaViewDetailView(QnaVO QnaVO, Model model) {
//	System.out.println("===> Controller getQnaViewDetailView");
//	
//	QnaVO Qna = qnaService.getQna(QnaVO);
//	System.out.println(Qna.toString());
//	model.addAttribute("Qna", Qna);
//	return "qna/getQnaViewDetail";
//
//	}


@GetMapping("/getQnaViewDetail.ado")
public String getQnaViewDetailView(QnaVO vo, Model model) {
	
   // 글 상세 정보 가져오기
   QnaVO getQnaViewDetail = qnaService.getQna(vo);
   model.addAttribute("qna",getQnaViewDetail);
   
   // 현재 글 기준으로 이전 글, 다음 글 정보 가져오기
   QnaVO prevNext = qnaService.prevNext(vo);
   model.addAttribute("prevNext", prevNext);
   
// 단일 댓글 정보 가져오기
   String qnaReply = qnaService.getQnaReply(vo);
   model.addAttribute("qnaReply", qnaReply);

   return "qna/getQnaViewDetail";
   
   
}


@PostMapping("/insertQnaReply.ado")
public ResponseEntity<String> insertQnaReply(@RequestBody QnaVO vo) {
    try {
        // 게시글 정보 가져오기
        QnaVO qna = qnaService.getQna(vo);

        // 댓글 등록
        qna.addComment(vo.getQnaReply());
        qnaService.insertQnaReply(qna);

        return new ResponseEntity<>("댓글이 등록되었습니다.", HttpStatus.OK);
    } catch (Exception e) {
        return new ResponseEntity<>("댓글 등록에 실패하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
    }
}

@GetMapping("/deleteQnaReply.ado")
public String deleteQnaReply(@RequestParam("qnaReply") int qnaReply) {
    QnaVO vo = new QnaVO();
    vo.setQnaIdx(qnaReply);
    
    // 댓글 삭제
    qnaService.deleteQnaReply(vo);
    
    // 댓글 삭제 후 상세 페이지로 리다이렉트
    return "redirect:/getQnaViewDetail.ado?qnaIdx=" + vo.getQnaIdx();
}
}
