package com.ogae.admin.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ogae.admin.board.Pagination;
import com.ogae.admin.board.QnaDAO;
import com.ogae.admin.board.QnaVO;
import com.ogae.admin.board.service.QnaService;

@Service("QnaService")
public class QnaServiceImpl implements QnaService{

    @Autowired
    private QnaDAO qnaDAO;

    @Override
    @Transactional
    public void insertQna(QnaVO vo) {
    	System.out.println("===> QnaServiceImpl insertQna");
        qnaDAO.insertQna(vo);
    }
    


    @Override
    @Transactional
    public void updateQna(QnaVO vo) {
        // 기존의 게시글을 불러옵니다.
        QnaVO existingQna = qnaDAO.getQna(vo);

        // 기존 게시글이 존재하면 수정할 내용을 적용합니다.
        if (existingQna != null) {
            // 기존 게시글의 정보를 가져와서 vo에 설정합니다.
            vo.setQnaIdx(existingQna.getQnaIdx());
            vo.setQnaRegDate(existingQna.getQnaRegDate());

            // 나머지 필요한 설정을 수행합니다.
            // 예를 들어, 제목, 작성자, 내용 등을 설정할 수 있습니다.

            // 수정된 내용을 DAO를 통해 업데이트합니다.
            qnaDAO.updateQna(vo);
        } else {
            // 기존 게시글이 없으면 처리 로직을 추가하거나 예외를 던질 수 있습니다.
            // 여기서는 간단하게 콘솔에 메시지를 출력합니다.
            System.out.println("게시글이 존재하지 않습니다.");
        }
    }

    @Override
    @Transactional
    public void deleteQna(QnaVO vo) {
    	System.out.println("1");
        qnaDAO.deleteQna(vo);
    }

    @Override
    public QnaVO getQna(QnaVO vo) {
        return qnaDAO.getQna(vo);
    }
  

    //페이징
	@Override
	public List<QnaVO> getQnaList(QnaVO vo) {
		  return qnaDAO.getQnaList(vo);
	}

	@Override
	public List<QnaVO> getQnaList(Pagination pagination) {
		return qnaDAO.getQnaList(pagination);
	}

	@Override
	public int getQnaListCnt() {
		  return qnaDAO.getQnaListCnt();
	}
	//검색
	@Override
	public List<QnaVO> getSearchQnaList(String searchCondition, String searchKeyword, Pagination pagination) {
		  return qnaDAO.getSearchQnaList(searchCondition, searchKeyword, pagination);
	}

	@Override
	public int getSearchQnaListCnt(String searchCondition, String searchKeyword) {
		  return qnaDAO.getSearchQnaListCnt(searchCondition, searchKeyword);
	  
	}
	//이전글 다음글
	@Override
	public QnaVO prevNext(QnaVO vo) {
		return qnaDAO.prevNext(vo);
	}


	//댓글
	@Override
	@Transactional
	public void insertQnaReply(QnaVO vo) {
		qnaDAO.insertQnaReply(vo);;
		
		
	}



	@Override
	@Transactional
	public void deleteQnaReply(QnaVO vo) {
		 qnaDAO.deleteQnaReply(vo);
		
	}


	@Override
    public String getQnaReply(QnaVO vo) {
        QnaVO qna = qnaDAO.getQna(vo);
        if (qna != null && qna.isHasReply()) {
            return qna.getQnaReply();
        } else {
            return null;
        }
	}
}

