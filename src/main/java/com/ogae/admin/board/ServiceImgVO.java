package com.ogae.admin.board;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ServiceImgVO {
	private int img_idx;
	private String img_path;
	private int service_idx; // -> 1124  추가 객실 키 값 필요
	
}