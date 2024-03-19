package com.ogae.user.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ogae.admin.board.Pagination;
import com.ogae.admin.board.QnaVO;
import com.ogae.user.board.UserQnaDAO;
import com.ogae.user.board.UserQnaVO;
import com.ogae.user.board.service.UserQnaService;



@Service("UserQnaService")
public class UserQnaServiceImpl implements UserQnaService {

    @Autowired
    private UserQnaDAO qnaDAO;

    @Override
    @Transactional
    public void insertQna(UserQnaVO vo) {
    	System.out.println("===> QnaServiceImpl insertQna");
        qnaDAO.insertQna(vo);
    }
    


    @Override
    @Transactional
    public void updateQna(UserQnaVO vo) {
        // 기존의 게시글을 불러옵니다.
        UserQnaVO existingQna = qnaDAO.getQna(vo);

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
    public void deleteQna(UserQnaVO vo) {
    	System.out.println("1");
        qnaDAO.deleteQna(vo);
    }

    @Override
    public UserQnaVO getQna(UserQnaVO vo) {
        return qnaDAO.getQna(vo);
    }
    
//  @Override
//  public List<QNAVO> getQNAList(QNAVO vo) {
//      return qnaDAO.getQNAList(vo);
//   
    
    
    

	@Override
	public List<UserQnaVO> getQnaList(UserQnaVO vo) {
		  return qnaDAO.getQnaList(vo);
	}

	@Override
	public List<UserQnaVO> getQnaList(Pagination pagination) {
		return qnaDAO.getQnaList(pagination);

	}

	@Override
	public int getQnaListCnt() {
		  return qnaDAO.getQnaListCnt();

	}

	@Override
	public List<UserQnaVO> getSearchQnaList(String searchCondition, String searchKeyword, Pagination pagination) {
		  return qnaDAO.getSearchQnaList(searchCondition, searchKeyword, pagination);

	}

	@Override
	public int getSearchQnaListCnt(String searchCondition, String searchKeyword) {
		  return qnaDAO.getSearchQnaListCnt(searchCondition, searchKeyword);

	}



	@Override
	public UserQnaVO prevNext(UserQnaVO vo) {
		return qnaDAO.prevNext(vo);
	}


	@Transactional
	@Override
	public void insertQnaReply(UserQnaVO vo) {
		qnaDAO.insertQnaReply(vo);
		
	}


	@Transactional
	@Override
	public void deleteQnaReply(UserQnaVO vo) {
		 qnaDAO.deleteQnaReply(vo);
		
	}



	@Override
	public String getQnaReply(UserQnaVO vo) {
		UserQnaVO qna = qnaDAO.getQna(vo);
        if (qna != null && qna.isHasReply()) {
            return qna.getQnaReply();
        } else {
            return null;
	}
}



	@Override
	public void countQna(int qnaIdx) {
		 qnaDAO.countQna(qnaIdx);
		
	}
}

