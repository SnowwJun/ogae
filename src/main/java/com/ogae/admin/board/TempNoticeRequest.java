package com.ogae.admin.board;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TempNoticeRequest {
	private String title;
	private String writer;
	private String content;
	private boolean isTempSave;
	public Object getNoticeVO() {

		return null;
	}
}
