package com.ogae.vo;

import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TempDTO {
	private int idx;
	private String name;
	private int base;
	private int max;
	private int price;
	private int adult;
	private int child;
	private int baby;
	private Date indate;
	private Date outdate;
	
	private List<TempDTO> tempList;
}
