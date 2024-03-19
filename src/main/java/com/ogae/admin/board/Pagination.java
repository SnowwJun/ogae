package com.ogae.admin.board;

import org.springframework.stereotype.Repository;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Repository
public class Pagination {
	/** 페이징 */
	private int listSize = 10; // 한 페이지 당 보여질 리스트의 개수
	private int rangeSize = 10; // 한 페이지 범위에 보여질 페이지의 개수
	private int page; // 현재 목록의 페이지 번호
	private int range; // 각 페이지 범위 시작 번호
	private int listCnt; // 전체 게시물의 개수
	private int pageCnt; // 전체 페이지 범위의 개수
	private int startPage; // 각 페이지 범위 시작 번호
	private int startList; // 게시판 시작 번호
	private int endPage; // 각 페이지 범위 끝 번호
	private boolean prev; // 이전 페이지 여부
	private boolean next; // 다음 페이지 여부

	public void pageInfo(int page, int range, int listCnt) {
		this.page = page; // 기본 페이지 설정
		this.range = range; // 기본 레인지 설정
		this.listCnt = listCnt; // 기본 리스트 개수 설정 (또는 다른 값으로 초기화)

		// 전체 페이지 수
		this.pageCnt = (int) Math.ceil((double) listCnt / listSize);

		// 시작 페이지
		this.startPage = (range - 1) * rangeSize + 1;

		// 끝 페이지
		this.endPage = range * rangeSize;

		// 게시판 시작 번호
		this.startList = (page - 1) * listSize;

		// 이전 버튼 상태
		this.prev = range == 1 ? false : true;

		// 다음 버튼 상태
		this.next = pageCnt > endPage ? true : false;

		if (this.endPage > this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false;
		}
	}
}